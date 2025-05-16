import glob
import itertools
import os
import numpy as np
import random
import pickle
import shutil
from collections import Counter, namedtuple
from typing import List, Tuple, Dict
import matplotlib.pyplot as plt
from tqdm import tqdm
from enum import Enum, auto
import logging

from unified_planning.io import PDDLReader
from unified_planning.engines.compilers import GrounderHelper
from unified_planning.plans import ActionInstance, SequentialPlan

from collections import defaultdict

Constraint = namedtuple("Constraint", ["type", "condition", "instantiation", "nl_description"])
# Action = namedtuple("Action", ["name", "args"])
Object = namedtuple("Object", ["color", "type", "room"])
Room = namedtuple("Room", ["room_id"])
Door = namedtuple("Door", ["color", "adj_rooms"])

logger = None


class Action:
    def __init__(self, name, args):
        self.name = name
        self.args = args

    def __repr__(self):
        return self.__str__()

    def __str__(self):
        if len(self.args) == 0:
            return "(" + self.name + ")"
        else:
            return "(" + self.name + " " + self.args + ")"

    def __eq__(self, other):
        if isinstance(other, Action):
            if self.name == other.name and self.args == other.args:
                return True
        return False


class ActionSpace:
    def __init__(self, actions):
        self.actions = actions

    @property
    def size(self):
        return len(self.actions)

    @property
    def sample(self):
        # Randomly sample an element from the actions array
        return random.choice(self.actions)

    def index(self, action):
        # Find the index of the given action
        if action in self.actions:
            return self.actions.index(action)
        else:
            raise ValueError(f"Action '{action}' is not in the action space.")


class ConstraintType(Enum):
    ALWAYS = "always"
    SOMETIME = "sometime"
    AT_MOST_ONCE = "at_most_once"
    SOMETIME_BEFORE = "sometime_before"
    SOMETIME_AFTER = "sometime_after"

    def is_one_arg(self):
        return (
            self == ConstraintType.ALWAYS
            or self == ConstraintType.SOMETIME
            or self == ConstraintType.AT_MOST_ONCE
        )


class OperationType(Enum):
    AND_OP = "and"
    OR_OP = "or"

    def complement(self):
        return OperationType.AND_OP if self == OperationType.OR_OP else OperationType.OR_OP


class SignType(Enum):
    POS = "+"
    NEG = "-"

    def complement(self):
        return SignType.NEG if self == SignType.POS else SignType.POS


class Literal:
    def __init__(self, predicate: str, arguments: List[str], sign: SignType):
        self.predicate = predicate
        self.arguments = arguments
        self.sign = sign

    def nl_description(self):
        if self.predicate == "agentInRoom":
            return f"Agent is in {self.arguments[0]}."
        elif self.predicate == "objectInRoom":
            return f"{self.arguments[0]} is in {self.arguments[1]}."
        elif self.predicate == "at":
            return f"Agent is at {self.arguments[0]}."
        elif self.predicate == "carrying":
            return f"Agent is carrying {self.arguments[0]}."
        elif self.predicate == "locked":
            return f"{self.arguments[0]} is locked."
        elif self.predicate == "visited":
            return f"Agent has visited {self.arguments[0]}."
        elif self.predicate == "emptyHands":
            return "The agent is not holding anything."

    def __repr__(self):
        atom_str = self.predicate + "(" + ",".join(self.arguments) + ")"
        return atom_str if self.sign == SignType.POS else "not(" + atom_str + ")"

    __str__ = __repr__

    def __eq__(self, other):
        if isinstance(other, Literal):
            return (
                self.predicate == other.predicate
                and self.arguments == other.arguments
                and self.sign == other.sign
            )
        return False

    def __hash__(self):
        return hash((self.predicate, self.arguments, self.sign))

    def complement(self):
        return Literal(self.predicate, self.arguments, self.sign.complement())


class Formula:
    def __init__(self, operation: OperationType, literals: List[Literal]):
        self.operation = operation
        self.literals = literals

    def nl_description_generator(self):
        nl_description = ""
        if self.operation == OperationType.AND_OP:
            nl_description += "all of the following constraints are satisfied.\n"
        elif self.operation == OperationType.OR_OP:
            nl_description += "at least of the following constraints is satisfied.\n"
        nl_description += "Constraints: \n"
        for literal in self.literals:
            nl_description += literal.nl_description() + "\n"
        return nl_description

    def __repr__(self):
        return f"{self.operation}" + "(" + ",".join(map(lambda x: str(x), self.literals)) + ")"

    __str__ = __repr__

    def __eq__(self, other):
        if isinstance(other, Formula):
            return self.operation == other.operation and self.literals == other.literals
        return False

    def __hash__(self):
        return hash((self.operation, self.literals))

    def complement(self):
        return Formula(self.operation.complement(), [lit.complement() for lit in self.literals])


class PDDLConstraint:
    def __init__(
        self,
        type: ConstraintType,
        args: Tuple[Formula],
    ):
        if not isinstance(type, ConstraintType):
            raise ValueError(f"Invalid constraint type: {type}")
        self.type = type
        self.args = args
        self.nl_description = self.nl_description_generator()

    def nl_description_generator(self):
        nl_description = ""
        if self.type.is_one_arg():
            if self.type == ConstraintType.ALWAYS:
                nl_description += "In all states, it must be the case that "
            elif self.type == ConstraintType.SOMETIME:
                nl_description += "In at least one state, it must be the case that "
            elif self.type == ConstraintType.AT_MOST_ONCE:
                nl_description += "If the following situation has come about at some earlier state, and this situation is no longer satisfied, then it must never come about again in a future state. The situation is:\n "
            nl_description += self.args[0].nl_description_generator()
        else:
            nl_description += "If the following situation comes about:\n"
            nl_description += self.args[0].nl_description_generator()
            if self.type == ConstraintType.SOMETIME_BEFORE:
                nl_description += "then there must be an earlier state where the following situation is satisfied: "
                nl_description += self.args[1].nl_description_generator()
            elif self.type == ConstraintType.SOMETIME_AFTER:
                nl_description += (
                    "then there must be a future state where the following situation is satisfied: "
                )
                nl_description += self.args[1].nl_description_generator()
        return nl_description

    def __repr__(self):
        return f"{self.type}" + "(" + ",".join(map(lambda x: str(x), self.args)) + ")"

    __str__ = __repr__

    def __eq__(self, other):
        if isinstance(other, PDDLConstraint):
            return self.type == other.type and self.args == other.args
        return False

    def __hash__(self):
        return hash((self.type, self.args))


class Goal:
    def __init__(self, task, color, type, source_room, dest_room, between_rooms):
        self.task = task  # target task
        self.color = color  # color of goal object
        self.type = type  # type of goal object
        self.source_room = source_room  # source room
        self.dest_room = dest_room  # destination room
        self.between_rooms = between_rooms  # for door_objects


class EmptyObject:
    def __init__(self, cur_pos):
        self.type = "empty"
        self.cur_pos = cur_pos
        self.color = None


class AgentObject:
    def __init__(self, cur_pos):
        self.type = "agent"
        self.cur_pos = cur_pos


class InfeasiblePlan(Exception):
    """Exception raised for actions that are not feasible."""

    def __init__(self, message=""):
        self.message = message
        super().__init__(self.message)


class ActionFailureKind(Enum):
    LOW_LEVEL = auto()
    HIGH_LEVEL = auto()


class Sample:
    """Dataset Sample Class"""

    def __init__(
        self,
        seed,
        # nl_task=None
        initial_state,
        # rl_goal,
        # simulator_plan: List[List],
        # nl_states: List[str],
    ):
        self.seed = seed
        self.initial_state = initial_state
        # self.goals = goals
        # self.constraints = constraints
        # self.nl_task = nl_task
        # self.initial_state = initial_state
        # self.rl_goal = rl_goal
        # self.simulator_plan = simulator_plan
        # self.nl_states = nl_states

    def __repr__(self):
        return f"{self.seed}"

    __str__ = __repr__


class GenerationStats:
    def __init__(self):
        # self.number_of_infeasible_unconstrained_problems = 0
        # self.number_of_unsolvable_constrained_problems = 0
        # self.number_of_constrained_problems_without_cost_increase = 0
        # self.number_of_infeasible_constrained_problems = 0
        # self.number_of_feasible_constrained_problems = 0

        # self.status = ""

        self.costs = dict()
        costs_keys = ["unconstrained", "constrained"]
        for key in costs_keys:
            self.costs[key] = 0

        self.times = dict()
        times_keys = [
            "unconstrained_planning",
            "constraints_generation",
            "compilation",
            "constrained_planning",
            "pddl2nl",
            "total",
        ]
        for key in times_keys:
            self.times[key] = 0

    def update_time(self, kind, value):
        self.times[kind] = value

    def update_cost(self, kind, value):
        self.costs[kind] = value

    def update_costs(self, unconstrained_cost, constrained_cost):
        self.unconstrained_cost = unconstrained_cost
        self.constrained_cost = constrained_cost

    def update_times(
        self,
        unconstrained_plan_generation_time,
        constraint_generation_time,
        liftedtcore_compilation_time,
        lifted_planning_time,
        pddl2nl_time,
        generation_time,
        # llm_execution_time_dict,
        # llm_execution_unconstrained_time_dict,
    ):
        # Update stats as needed based on your logic
        self.unconstrained_plan_generation_time = unconstrained_plan_generation_time
        self.constraint_generation_time = constraint_generation_time
        self.liftedtcore_compilation_time = liftedtcore_compilation_time
        self.lifted_planning_time = lifted_planning_time
        self.pddl2nl_time = pddl2nl_time
        self.generation_time = generation_time
        # self.llm_execution_time_dict = llm_execution_time_dict
        # self.llm_execution_unconstrained_time_dict = llm_execution_unconstrained_time_dict

    def update_completion_tokens(
        self, llm_completion_tokens_dict, llm_completion_tokens_unconstrained_dict
    ):
        self.llm_completion_tokens_dict = llm_completion_tokens_dict
        self.llm_completion_tokens_unconstrained_dict = llm_completion_tokens_unconstrained_dict


def load_problem(domain_file, problem_file):
    reader = PDDLReader()
    problem = reader.parse_problem(domain_file, problem_file)
    return problem


def load_plan(problem, plan_file):
    reader = PDDLReader()
    plan = reader.parse_plan(problem, plan_file)
    return plan


def get_sample_path(data_path, seed, folder_no):
    return f"{data_path}/data_{folder_no}/{seed}"


def setup_sample_dir(data_path, seed, folder_no):
    os.makedirs(f"{data_path}/data_{folder_no}", exist_ok=True)
    os.makedirs(f"{data_path}/data_{folder_no}/{seed}", exist_ok=True)


def constrained_problem_files(data_path, seed, folder_no):
    base_path = get_sample_path(data_path, seed, folder_no)
    # os.makedirs(base_path, exist_ok=True)
    domain_file = f"{base_path}/domain.pddl"
    problem_file = f"{base_path}/problem.pddl"
    plan_file = f"{base_path}/constrained_plan"

    return (
        domain_file,
        problem_file,
        plan_file,
    )


def get_data_file(data_path, seed, folder_no):
    base_path = get_sample_path(data_path, seed, folder_no)
    # os.makedirs(base_path, exist_ok=True)
    data_file = f"{base_path}/data"

    return data_file


def unconstrained_problem_files(data_path, seed, folder_no):
    base_path = get_sample_path(data_path, seed, folder_no)
    # os.makedirs(base_path, exist_ok=True)
    domain_file = f"{base_path}/domain.pddl"
    problem_file = f"{base_path}/unconstrained_problem.pddl"
    plan_file = f"{base_path}/unconstrained_plan"

    return (
        domain_file,
        problem_file,
        plan_file,
    )


def data_sample_files(data_path, seed, folder_no):
    base_path = get_sample_path(data_path, seed, folder_no)
    # os.makedirs(base_path, exist_ok=True)
    domain_file = f"{base_path}/domain.pddl"
    problem_file = f"{base_path}/problem.pddl"
    unconstrained_problem_file = f"{base_path}/unconstrained_problem.pddl"
    compiled_domain_file = f"{base_path}/compiled_domain.pddl"
    compiled_problem_file = f"{base_path}/compiled_problem.pddl"
    plan_file = f"{base_path}/constrained_plan"
    unconstrained_plan_file = f"{base_path}/unconstrained_plan"
    data_file = f"{base_path}/data"
    nl_file = f"{base_path}/nl"

    return (
        domain_file,
        compiled_domain_file,
        problem_file,
        unconstrained_problem_file,
        compiled_problem_file,
        plan_file,
        unconstrained_plan_file,
        data_file,
        nl_file,
    )


def get_data_sample_files_for_simulation(data_path, seed, folder_no):
    base_path = get_sample_path(data_path, seed, folder_no)

    domain_file = f"{base_path}/domain.pddl"
    problem_file = f"{base_path}/problem.pddl"
    compiled_domain_file = f"{base_path}/compiled_domain.pddl"
    compiled_problem_file = f"{base_path}/compiled_problem.pddl"
    unconstrained_plan_file = f"{base_path}/unconstrained_plan"
    constrained_plan_file = f"{base_path}/constrained_plan"
    data_file = f"{base_path}/data"

    return (
        domain_file,
        problem_file,
        compiled_domain_file,
        compiled_problem_file,
        unconstrained_plan_file,
        constrained_plan_file,
        data_file,
    )


def get_llm_stats(stats_file):
    values = []
    with open(stats_file, "r") as f:
        for line in f:
            values.append(float(line.strip().split(" ")[-1]))
    return values


def get_all_action_instances(problem):
    grounder = GrounderHelper(problem)
    grounded_actions = grounder.get_grounded_actions()
    action_instances = list()
    for grounded_action in grounded_actions:
        if grounded_action[2]:
            action_instances.append(ActionInstance(grounded_action[0], grounded_action[1]))
    return action_instances


def find_most_similar_action(llm_action, all_action_instances):
    def edit_distance(str1, str2, m, n):
        # Create a table to store results of sub-problems
        dp = [[0 for _ in range(n + 1)] for _ in range(m + 1)]

        # Fill d[][] in bottom up manner
        for i in range(m + 1):
            for j in range(n + 1):
                # If first string is empty, only option is to
                # insert all characters of second string
                if i == 0:
                    dp[i][j] = j  # Min. operations = j
                # If second string is empty, only option is to
                # remove all characters of second string
                elif j == 0:
                    dp[i][j] = i  # Min. operations = i
                # If last characters are same, ignore last char
                # and recur for remaining string
                elif str1[i - 1] == str2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                # If last character are different, consider all
                # possibilities and find minimum
                else:
                    dp[i][j] = 1 + min(
                        dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]  # Insert  # Remove
                    )  # Replace
        return dp[m][n]

    min_distance = 100000
    most_similar_action = None
    for action_instance in all_action_instances:
        dist = edit_distance(
            str(llm_action), str(action_instance), len(str(llm_action)), len(str(action_instance))
        )
        if dist < min_distance:
            min_distance = dist
            most_similar_action = action_instance
    return most_similar_action


def parse_plan_with_edit_distance(
    problem,
    plan_filename: str,
):
    with open(plan_filename) as plan:
        return parse_plan_string_with_edit_distance(problem, plan.read())


def parse_plan_string_with_edit_distance(
    problem,
    plan_str: str,
):
    actions: List = []
    ground_actions = get_all_action_instances(problem)
    for line in plan_str.splitlines():
        act_instance = find_most_similar_action(line, ground_actions)
        actions.append(act_instance)
    return SequentialPlan(actions)


def log_list_stats(logger, title, stat_list, trials_no):
    logger.info(f"\t{title}: ")
    logger.info(f"\t\tSum: {sum(stat_list)}")
    logger.info(f"\t\tAverage: {sum(stat_list)/trials_no}")
    logger.info(f"\t\tMin: {min([c for c in stat_list if c!=0])}")
    logger.info(f"\t\tMax: {max(stat_list)}")


def log_list_dicts_stats(logger, title, stat_dicts_list, trials_no):
    values_per_model = defaultdict(list)
    for stats in stat_dicts_list:
        for key, value in stats.items():
            values_per_model[key].append(value)
    logger.info(f"\t{title}: ")
    for model_name in values_per_model.keys():
        logger.info(f"\t\t{model_name}: ")
        logger.info(f"\t\t\tSum: {sum(values_per_model[model_name])}")
        logger.info(f"\t\t\tAverage: {sum(values_per_model[model_name])/trials_no}")
        logger.info(f"\t\t\tMin: {min([c for c in values_per_model[model_name] if c!=0])}")
        logger.info(f"\t\t\tMax: {max(values_per_model[model_name])}")


def print_stats(logger, stats_list):

    logger.info("Statistics: ")
    problems_no = len(stats_list)
    logger.info(f"\tNumber of Generated Problems: {problems_no}")

    # ===== Statistics regarding (un)constrained problem cost  ===== #

    # unconstrained_costs = [stats.unconstrained_cost for stats in stats_list]
    # constrained_costs = [stats.constrained_cost for stats in stats_list]
    logger.info("Costs: ")
    for key in stats_list[0].costs.keys():
        values = [stats.costs[key] for stats in stats_list]
        log_list_stats(logger, key, values, problems_no)

    logger.info("Times: ")
    for key in stats_list[0].times.keys():
        values = [stats.times[key] for stats in stats_list]
        log_list_stats(logger, key, values, problems_no)

    # ===== Statistics regarding LLM execution  ===== #

    # llm_execution_time_dicts = [stats.llm_execution_time_dict for stats in stats_list]
    # llm_execution_unconstrained_time_dicts = [
    # stats.llm_execution_unconstrained_time_dict for stats in stats_list
    # ]
    # llm_completion_tokens_dicts = [stats.llm_completion_tokens_dict for stats in stats_list]
    # llm_completion_tokens_unconstrained_dicts = [
    # stats.llm_completion_tokens_unconstrained_dict for stats in stats_list
    # ]
    """
    log_list_dicts_stats(
        logger,
        "LLM Planning times",
        llm_execution_time_dicts,
        number_of_feasible_constrained_problems,
    )
    log_list_dicts_stats(
        logger,
        "LLM Unconstrained Planning times",
        llm_execution_unconstrained_time_dicts,
        number_of_feasible_constrained_problems,
    )
    """
    """
    logger.info("Completion Tokens: ")
    log_list_dicts_stats(
        logger,
        "Completion Tokens for Constrained Problem",
        llm_completion_tokens_dicts,
        number_of_feasible_constrained_problems,
    )
    log_list_dicts_stats(
        logger,
        "Completion Tokens for Unconstrained Problem",
        llm_completion_tokens_unconstrained_dicts,
        number_of_feasible_constrained_problems,
    )
    """


def close_logger(logger):
    handlers = logger.handlers[:]
    for handler in handlers:
        handler.close()
        logger.removeHandler(handler)


def setup_logger(folder_name, seed, constraints_no):
    """Set up a unique logger for each process using the seed."""

    logs_dir = f"{folder_name}/log_{constraints_no}"
    os.makedirs(logs_dir, exist_ok=True)

    log_filename = f"{logs_dir}/log_{seed}.log"

    logger = logging.getLogger(str(seed))
    logger.setLevel(logging.INFO)

    logger.handlers.clear()

    # Ensure no duplicate handlers
    handler = logging.FileHandler(log_filename, mode="w")
    handler.setFormatter(logging.Formatter("%(asctime)s - %(levelname)s - %(message)s"))
    logger.addHandler(handler)

    logger.propagate = False

    return logger


def sample_one(mylist):
    if len(mylist) > 0:
        return random.sample(mylist, 1)[0]
    return None


def insert_text_before_last_n_lines(read_path, write_path, text_block, n):
    with open(read_path, "r") as file:
        lines = file.readlines()

    insert_index = max(0, len(lines) - n)  # Ensures n doesn't exceed file length
    lines[insert_index:insert_index] = text_block.splitlines(keepends=True)

    with open(write_path, "w") as file:
        file.writelines(lines)


def flatten_list(to_flatten: List[List]):
    return list(itertools.chain.from_iterable(to_flatten))


def unzip_list(to_unzip: List[Tuple]) -> List[Tuple]:
    return list(zip(*to_unzip))


def counter(to_count: List):
    return Counter(to_count)


def get_adjacent_rooms(room_id):
    adj_dict = {"1": ["2", "3"], "2": ["1", "4"], "3": ["1", "4"], "4": ["2", "3"]}
    return adj_dict[room_id]


def delete_planner_outputs(directory_path):
    # directory_path = os.path.join(directory_path, f'{seed}')
    # Check if the directory exists
    if not os.path.exists(directory_path):
        print(f"The directory {directory_path} does not exist.")
        return

    # List all files and directories in the given directory
    for filename in (pbar := tqdm(os.listdir(directory_path))):
        file_path = os.path.join(directory_path, filename)
        pbar.set_description(f"Deleting {file_path}", refresh=True)

        try:
            # Check if it is a file or directory and remove it accordingly
            if os.path.isfile(file_path):
                os.remove(file_path)  # Remove file
                # print(f"File {file_path} deleted.")
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)  # Remove directory and all its contents
                # print(f"Directory {file_path} deleted.")
        except Exception as e:
            print(f"Failed to delete {file_path}. Reason: {e}")


def delete_problem_file(seed, directory_path):
    filepath = f"{directory_path}/problem_{seed}.pddl"
    if os.path.isfile(filepath):
        os.remove(filepath)  # Remove file


def plot_grid(env):
    img = env.render()
    # Display the image using matplotlib
    plt.imshow(img)
    plt.axis("off")  # Hide the axis
    plt.tight_layout()
    plt.show()


def save_string_to_file(string_data: str) -> str:
    # Ensure the directory exists where the file will be saved
    filename = os.path.join(os.environ["LEXICON"], "train/temp_problem_file.pddl")
    os.makedirs(os.path.dirname(filename), exist_ok=True)

    # Write the string data to the file
    with open(filename, "w") as file:
        file.write(string_data)

    return filename


def load_from_disk(save_path):
    if os.path.isfile(save_path):
        with open(save_path, "rb") as infile:
            try:
                dataset = pickle.load(infile)
            except Exception as e:
                print(e)
                dataset = []  # If file does not exist, create an empty list
            return dataset
    else:
        print(f"{save_path} does not exist.")
        return []


def load_all_data_samples(directory_path: str, stage: str = "test"):
    """
    :param directory_path: path to generated_data from running lexicon/generate_dataset.py
    :param stage: training (offline/online RL training) or testing stage (for planning); default is test
    :return: loaded data samples
    """
    print("Directory path: " + directory_path)
    file_pattern = os.path.join(directory_path, "*")
    file_list = glob.glob(file_pattern)

    if stage == "offline":
        file_list = file_list[:1000]
    elif stage == "online":
        file_list = file_list[1000:]
    else:
        random.seed(3)
        random.shuffle(file_list)
        file_list = file_list[:2]
        pass

    all_data_samples = []
    for file in file_list:
        samples = load_from_disk(file)
        for sample in tqdm(samples):
            # if len(sample.plan) > 4:
            #     continue
            # if sample_uniform_distribution:
            # making the data distribution (approximately) uniform along different axes
            # if sample.rl_goal.type == 'door' and random.random() > 0.2:
            #     continue
            # if sample.rl_goal.color == 'yellow':
            #     if random.random() > 0.5:
            #         continue
            # if sample.rl_goal.type == 'key' and random.random() > 0.1:
            #     continue
            # if sample.rl_goal.task == 'goto' and random.random() > 0.4:
            #     continue
            # if sample.constraint.type == 'action' and random.random() > 0.6:
            #     continue
            # if sample.rl_goal.task == 'open' and sample.rl_goal.between_rooms is None and random.random() > 0.4:
            #     continue
            # if sample.rl_goal.task == 'pickup' and sample.rl_goal.source_room is not None and random.random() > 0.3:
            #     continue
            # if sample.rl_goal.task == 'put' and random.random() > 0.5:
            #     continue
            # if sample.rl_goal.task != 'open' or sample.constraint.condition not in ['before']:
            #     continue
            if isinstance(sample, list):
                if len(sample) > 0:
                    all_data_samples.extend(sample)
            elif sample is not None:
                all_data_samples.append(sample)

    print(f"# Data Samples Loaded: {len(all_data_samples)}")

    new_combined_path = os.path.join(directory_path, "combined_data.pkl")
    # with open(new_combined_path, 'wb') as infile:
    #     pickle.dump(all_data_samples, infile)
    return all_data_samples


# Function to plot a counter
def plot_counter(counter: Counter, title: str):
    labels, values = zip(*counter.items())

    plt.figure(figsize=(10, 5))
    plt.bar(labels, values)
    plt.title(title)
    # plt.xlabel('Categories')
    plt.ylabel("Frequency")
    plt.xticks(rotation=45)  # Rotate labels if necessary
    plt.tight_layout()
    plt.show()


def plot_nested_counter(nested_dict: Dict):
    # Extract the outer keys and nested keys
    outer_keys = list(nested_dict.keys())
    nested_keys = list(nested_dict[outer_keys[0]].keys())

    # Prepare data for plotting
    any_values = [nested_dict[outer_key]["any"] for outer_key in outer_keys]
    specific_values = [nested_dict[outer_key]["specific"] for outer_key in outer_keys]

    # Set up bar positions and width
    x = np.arange(len(outer_keys))  # The label locations
    width = 0.35  # The width of the bars

    # Plotting
    fig, ax = plt.subplots(figsize=(10, 5))
    rects1 = ax.bar(x - width / 2, any_values, width, label="Any")
    rects2 = ax.bar(x + width / 2, specific_values, width, label="Specific")

    # Add labels and title
    ax.set_xlabel("Actions")
    ax.set_ylabel("Values")
    ax.set_title('Comparison of "Any" and "Specific" for Each Action')
    ax.set_xticks(x)
    ax.set_xticklabels(outer_keys)
    ax.legend()

    # Add value labels on top of bars
    def add_value_labels(rects):
        for rect in rects:
            height = rect.get_height()
            ax.annotate(
                f"{height}",
                xy=(rect.get_x() + rect.get_width() / 2, height),
                xytext=(0, 3),  # 3 points vertical offset
                textcoords="offset points",
                ha="center",
                va="bottom",
            )

    add_value_labels(rects1)
    add_value_labels(rects2)

    # Adjust layout for better fit
    plt.tight_layout()

    # Show the plot
    plt.show()


def analyze_dataset(data_samples):
    constraint_type = []
    constraint_condition = []
    tasks = []
    objects = []
    colors = []
    source_rooms = 0
    dest_rooms = 0
    between_rooms = 0
    plan_len = []
    any_specific_counter = {
        "goto": {"any": 0, "specific": 0},
        "pickup": {"any": 0, "specific": 0},
        "open": {"any": 0, "specific": 0},
        "put": {"any": 0, "specific": 0},
    }
    for sample in data_samples:
        constraint_type.append(sample.constraint.type)
        constraint_condition.append(sample.constraint.condition)
        tasks.append(sample.rl_goal.task)
        objects.append(sample.rl_goal.type)
        colors.append(sample.rl_goal.color)
        plan_len.append(len(sample.plan))
        if sample.rl_goal.source_room is not None:
            source_rooms += 1
        if sample.rl_goal.dest_room is not None:
            dest_rooms += 1
        if sample.rl_goal.between_rooms is not None:
            between_rooms += 1
        if sample.rl_goal.task in ["goto", "pickup"]:
            if sample.rl_goal.source_room is not None:
                any_specific_counter[sample.rl_goal.task]["specific"] += 1
            else:
                any_specific_counter[sample.rl_goal.task]["any"] += 1
        if sample.rl_goal.task in ["put"]:
            any_specific_counter[sample.rl_goal.task]["specific"] += 1
        if sample.rl_goal.task in ["open"]:
            if sample.rl_goal.between_rooms is not None:
                any_specific_counter[sample.rl_goal.task]["specific"] += 1
            else:
                any_specific_counter[sample.rl_goal.task]["any"] += 1
    print(len(constraint_type))

    counter_type = Counter(constraint_type)
    counter_condition = Counter(constraint_condition)
    counter_objects = Counter(objects)
    counter_tasks = Counter(tasks)
    counter_colors = Counter(colors)
    # Plot each counter
    plot_counter(counter_type, "Constraint Type Distribution")
    plot_counter(counter_condition, "Constraint Condition Distribution")
    plot_counter(counter_objects, "Goal Object Distribution")
    plot_counter(counter_tasks, "Tasks Distribution")
    plot_counter(counter_colors, "Colors Distribution")
    plot_nested_counter(any_specific_counter)
    print(f"Avg Plan Length: {np.array(plan_len).mean()} | Max length: {np.array(plan_len).max()}")
    # TODO: vocabulary distribution
