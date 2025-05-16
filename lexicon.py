import os
from abc import ABC, abstractmethod
import time
import multiprocessing as mp
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor
import pickle
from itertools import product
from functools import partial
import random
from collections import defaultdict

from openai import OpenAI
from anthropic import Anthropic
from google import genai
from google.genai import types

from unified_planning.engines.results import PlanGenerationResultStatus
from unified_planning.io import PDDLWriter
from unified_planning.shortcuts import SequentialSimulator
from unified_planning.io import PDDLReader
from unified_planning.shortcuts import (
    And,
    Or,
    Always,
    Sometime,
    AtMostOnce,
    SometimeBefore,
    SometimeAfter,
    OneshotPlanner,
)

from constraints import (
    non_static_atoms,
    simplify_flat_exists,
    sample_literal_for_arity_one_constraint,
    sample_first_literal_for_arity_two_constraint,
    sample_second_literal_for_arity_two_constraint,
    literals_are_compatible,
    constraints_are_compatible,
)
from utils.utils import (
    Action,
    Sample,
    OperationType,
    ConstraintType,
    GenerationStats,
    ActionFailureKind,
    plot_grid,
    sample_one,
    setup_logger,
    setup_sample_dir,
    close_logger,
    print_stats,
    data_sample_files,
    get_data_sample_files_for_simulation,
    load_from_disk,
    load_plan,
    get_data_file,
    constrained_problem_files,
    unconstrained_problem_files,
    get_sample_path,
    get_llm_stats,
    parse_plan_with_edit_distance,
)
from up_utils import (
    solve_unconstrained,
    simulate_high_level_plan,
    compile_lifted_tcore,
    solve_compiled_lifted,
)


def cfg_mapper(cfg, env_class, seed):
    lexicon_env = env_class(cfg)
    lexicon_env.reset(seed=seed)
    print(f"My seed: {seed}. My pid: {os.getpid()}")
    result = lexicon_env.generate_constrained_problem()
    return result


def generate_dataset(cfg, env_class):
    """Generate a dataset with solvable (seed, constrained_problem, optimal_plan) tuples"""

    stats_list = list()
    initial_seed = cfg.initial_seed
    num_samples_required = cfg.num_seeds
    print(f"Number of seeds: {num_samples_required}")

    parallelize = cfg.parallelize

    global_start_time = time.time()

    if parallelize:
        num_workers = mp.cpu_count()
        print(f"Number of workers: {num_workers}")
        seed_offset = 0
        with ProcessPoolExecutor(max_workers=num_workers) as executor:
            seed_mapper = partial(cfg_mapper, cfg, env_class)

            while len(stats_list) < num_samples_required:
                batch_size = num_workers
                seed_range = range(
                    initial_seed + seed_offset, initial_seed + seed_offset + batch_size
                )
                print(f"Trying seeds: {list(seed_range)}")

                # seed_range = range(initial_seed, initial_seed + num_seeds)
                results = executor.map(seed_mapper, seed_range, chunksize=3)

                for seed, result in zip(seed_range, results):
                    print(f"Job for seed {seed} produced result {result}")
                    if result:
                        stats_list.append(result)
                        if len(stats_list) >= num_samples_required:
                            break
                seed_offset += batch_size

    else:
        env = env_class(cfg)
        seed = initial_seed
        complete_problems = 0
        while complete_problems < num_samples_required:
            env.reset(seed=seed)
            stats = env.generate_constrained_problem()
            seed += 1
            if stats:
                stats_list.append(stats)
                complete_problems += 1

    logger = setup_logger(
        env_class(cfg).logs_dir, "master", cfg.constraint_form.constraints_no
    )
    print_stats(logger, stats_list)
    logger.info(f"Total execution time: {time.time() - global_start_time}")


def evaluate_llms(cfg, env_class):

    # ===== Setup and get problem sample ===== #

    def evaluate_sample_with_llm(args):
        model_name_and_strategy, data_no = args
        model_name, strategy = model_name_and_strategy

        model_strategy_string = model_name + "@" + strategy if strategy else model_name

        env = env_class(cfg)
        data_file = get_data_file(env.data_samples_dir, data_no, env.folder_no)
        data_sample = load_from_disk(data_file)
        base_path = get_sample_path(env.data_samples_dir, data_no, env.folder_no)
        env.reset(data_sample.seed, data_sample)

        domain_file, problem_file, plan_file = constrained_problem_files(
            env.data_samples_dir, data_no, env.folder_no
        )
        reader_constrained = PDDLReader()
        problem_constrained = reader_constrained.parse_problem(
            domain_file, problem_file
        )
        mapper = env.mapper_class(problem_constrained)
        system_set_prompt, domain_nl, problem_nl = mapper.get_problem_nl()

        if strategy:
            """
            few_shot_prompt = "Consider the following examples:\n"
            for data_no_few_shot in env.few_shot_data:
                (
                    domain_file_few_shot,
                    problem_file_few_shot,
                    compiled_domain_file_few_shot,
                    compiled_problem_file_few_shot,
                    unconstrained_plan_file_few_shot,
                    constrained_plan_file_few_shot,
                    data_file_few_shot,
                ) = get_data_sample_files_for_simulation(
                    env.data_samples_dir, data_no_few_shot, env.folder_no
                )

                reader_few_shot = PDDLReader()
                constrained_problem_few_shot = reader_few_shot.parse_problem(
                    domain_file_few_shot, problem_file_few_shot
                )

                mapper_constrained_few_shot = env.mapper_class(constrained_problem_few_shot)

                _, _, problem_constrained_few_shot_nl = mapper_constrained_few_shot.get_problem_nl()

                reader_few_shot = PDDLReader()

                compiled_problem_few_shot = reader_few_shot.parse_problem(
                    compiled_domain_file_few_shot, compiled_problem_file_few_shot
                )

                constrained_plan_few_shot = reader_constrained.parse_plan(
                    compiled_problem_few_shot, constrained_plan_file_few_shot
                )

                mapper_few_shot = env.mapper_class(compiled_problem_few_shot)

                plan_few_shot_nl = mapper_few_shot.get_plan_nl(constrained_plan_few_shot)

                few_shot_prompt += f"\tProblem:\n {problem_constrained_few_shot_nl}\n"

                few_shot_prompt += f"\tOptimal Plan: {plan_few_shot_nl}\n"
            """
            few_shot_prompt = ""
            few_shot_prompt += "\tTo solve such problems, think step-by-step.\n"

            problem_nl += few_shot_prompt

        llm_execution_start_time = time.time()
        (
            response,
            prompt_tokens,
            completion_tokens,
            reasoning_content,
            reasoning_tokens,
        ) = env.prompt_llm(model_name, system_set_prompt, domain_nl + problem_nl)
        llm_execution_time = time.time() - llm_execution_start_time

        llm_constrained_response_file = f"{base_path}/{model_strategy_string}_response"
        llm_constrained_plan_file = f"{base_path}/{model_strategy_string}_plan"
        llm_constrained_stats_file = f"{base_path}/{model_strategy_string}_stats"
        llm_constrained_plan = env.parse_response(model_name, response)

        with open(llm_constrained_response_file, "w") as f:
            f.write(f"{response}")
        with open(llm_constrained_plan_file, "w") as f:
            f.write(f"{llm_constrained_plan}")

        with open(llm_constrained_stats_file, "w") as f:
            f.write(f"Time: {llm_execution_time}\n")
            f.write(f"Completion Tokens: {completion_tokens}\n")

        if model_name == "deepseek":
            reasoning_content_constrained_file = (
                f"{base_path}/{model_strategy_string}_reasoning_content_constrained"
            )
            with open(reasoning_content_constrained_file, "w") as f:
                f.write(reasoning_content)

        if reasoning_tokens:
            with open(llm_constrained_stats_file, "a") as f:
                f.write(f"Reasoning Tokens: {reasoning_tokens}\n")
        return f"{model_strategy_string} responded on {data_no}"

    # format: if "@" exists in the models name, then the format is model_name@prompting_strategy
    model_names_and_strategies = [
        ("deepseek", None),
        ("o3", None),
        ("gemini-2.5", None),
        ("claude_37_sonnet", None),
        # ("gpt-4.1", None),
        # ("gpt-4.1", "few-shot"),
        # ("gemini_llm", "few-shot"),
        # ("deepseek_llm", "few-shot"),
        # ("claude_llm", "few-shot"),
    ]  # ["deepseek"]  # ["o3", "gemini-2.5", "claude_37_sonnet", "deepseek"]
    pairs = list(product(model_names_and_strategies, cfg.evaluation_data))

    with ThreadPoolExecutor() as executor:
        results = list(executor.map(evaluate_sample_with_llm, pairs))
    print(results)


def evaluate_unconstrained_llms(cfg, env_class):

    # ===== Setup and get problem sample ===== #

    def evaluate_sample_with_llm(args):
        model_name_and_strategy, data_no = args
        model_name, strategy = model_name_and_strategy

        model_strategy_string = model_name + "@" + strategy if strategy else model_name

        env = env_class(cfg)
        data_file = get_data_file(env.data_samples_dir, data_no, env.folder_no)
        data_sample = load_from_disk(data_file)
        base_path = get_sample_path(env.data_samples_dir, data_no, env.folder_no)
        env.reset(data_sample.seed, data_sample)

        domain_file, problem_file, plan_file = unconstrained_problem_files(
            env.data_samples_dir, data_no, env.folder_no
        )
        reader_constrained = PDDLReader()
        problem_constrained = reader_constrained.parse_problem(
            domain_file, problem_file
        )
        mapper = env.mapper_class(problem_constrained)
        system_set_prompt, domain_nl, problem_nl = mapper.get_problem_nl()

        if strategy:
            """
            few_shot_prompt = "Consider the following examples:\n"
            for data_no_few_shot in env.few_shot_data:
                (
                    domain_file_few_shot,
                    problem_file_few_shot,
                    compiled_domain_file_few_shot,
                    compiled_problem_file_few_shot,
                    unconstrained_plan_file_few_shot,
                    constrained_plan_file_few_shot,
                    data_file_few_shot,
                ) = get_data_sample_files_for_simulation(
                    env.data_samples_dir, data_no_few_shot, env.folder_no
                )

                reader_few_shot = PDDLReader()
                constrained_problem_few_shot = reader_few_shot.parse_problem(
                    domain_file_few_shot, problem_file_few_shot
                )

                mapper_constrained_few_shot = env.mapper_class(constrained_problem_few_shot)

                _, _, problem_constrained_few_shot_nl = mapper_constrained_few_shot.get_problem_nl()

                reader_few_shot = PDDLReader()

                compiled_problem_few_shot = reader_few_shot.parse_problem(
                    compiled_domain_file_few_shot, compiled_problem_file_few_shot
                )

                constrained_plan_few_shot = reader_constrained.parse_plan(
                    compiled_problem_few_shot, constrained_plan_file_few_shot
                )

                mapper_few_shot = env.mapper_class(compiled_problem_few_shot)

                plan_few_shot_nl = mapper_few_shot.get_plan_nl(constrained_plan_few_shot)

                few_shot_prompt += f"\tProblem:\n {problem_constrained_few_shot_nl}\n"

                few_shot_prompt += f"\tOptimal Plan: {plan_few_shot_nl}\n"

                few_shot_prompt += "\tTo solve such problems, think step-by-step.\n"
            problem_nl += few_shot_prompt
            """
            few_shot_prompt = ""
            few_shot_prompt += "\tTo solve such problems, think step-by-step.\n"
            problem_nl += few_shot_prompt

        llm_execution_start_time = time.time()
        (
            response,
            prompt_tokens,
            completion_tokens,
            reasoning_content,
            reasoning_tokens,
        ) = env.prompt_llm(model_name, system_set_prompt, domain_nl + problem_nl)
        llm_execution_time = time.time() - llm_execution_start_time

        llm_constrained_response_file = (
            f"{base_path}/{model_strategy_string}_response_unconstrained"
        )
        llm_constrained_plan_file = (
            f"{base_path}/{model_strategy_string}_plan_unconstrained"
        )
        llm_constrained_stats_file = (
            f"{base_path}/{model_strategy_string}_stats_unconstrained"
        )
        llm_constrained_plan = env.parse_response(model_name, response)

        with open(llm_constrained_response_file, "w") as f:
            f.write(f"{response}")
        with open(llm_constrained_plan_file, "w") as f:
            f.write(f"{llm_constrained_plan}")

        with open(llm_constrained_stats_file, "w") as f:
            f.write(f"Time: {llm_execution_time}\n")
            f.write(f"Completion Tokens: {completion_tokens}\n")

        if model_name == "deepseek":
            reasoning_content_constrained_file = (
                f"{base_path}/{model_strategy_string}_reasoning_content_unconstrained"
            )
            with open(reasoning_content_constrained_file, "w") as f:
                f.write(reasoning_content)

        if reasoning_tokens:
            with open(llm_constrained_stats_file, "a") as f:
                f.write(f"Reasoning Tokens: {reasoning_tokens}\n")
        return f"{model_strategy_string} responded on {data_no}"

    # format: if "@" exists in the models name, then the format is model_name@prompting_strategy
    model_names_and_strategies = [
        ("deepseek", None),
        ("o3", None),
        ("gemini-2.5", None),
        ("claude_37_sonnet", None),
        # ("gpt-4.1", None),
        ("gpt-4.1", "few-shot"),
    ]  # ["deepseek"]  # ["o3", "gemini-2.5", "claude_37_sonnet", "deepseek"]
    pairs = list(product(model_names_and_strategies, cfg.evaluation_data))

    with ThreadPoolExecutor() as executor:
        results = list(executor.map(evaluate_sample_with_llm, pairs))
    print(results)


def verify_llm_plan(cfg, env_class):

    env = env_class(cfg)

    model_name = env.llm

    data_no = env.evaluation_data[0]

    (
        domain_file,
        compiled_domain_file,
        problem_file,
        unconstrained_problem_file,
        compiled_problem_file,
        plan_file,
        unconstrained_plan_file,
        data_file,
        nl_file,
    ) = data_sample_files(env.data_samples_dir, data_no, env.folder_no)

    base_path = get_sample_path(env.data_samples_dir, data_no, env.folder_no)

    reader_constrained = PDDLReader()

    data_sample = load_from_disk(data_file)

    compiled_problem = reader_constrained.parse_problem(
        compiled_domain_file, compiled_problem_file
    )

    constrained_plan = reader_constrained.parse_plan(compiled_problem, plan_file)
    env.reset(data_sample.seed, data_sample)

    # =====   evaluate metrics start ===== #

    optimal_cost_constrained = len(constrained_plan.actions)

    llm_constrained_plan_file = f"{base_path}/{model_name}_plan"

    if not os.path.isfile(llm_constrained_plan_file):
        return
    try:
        llm_constrained_plan = reader_constrained.parse_plan(
            compiled_problem, llm_constrained_plan_file
        )
    except Exception:
        llm_constrained_plan = parse_plan_with_edit_distance(
            compiled_problem, llm_constrained_plan_file
        )

    # ===== check if constrained plan is valid ===== #
    # I use a simulator instead of a validator in order to be able to check:
    # (i) which preconditions are not satisfied in the case of an INAPPLICABLE_ACTION failure reason
    # (ii) which goals were not reached in the case of an UNSATISFIED_GOALS failure reason
    # In either case, if a fluent added by the compiler is the culprit,
    # then we deduce that a constraint was violated.
    simulator_constrained = SequentialSimulator(compiled_problem)

    state = simulator_constrained.get_initial_state()
    # print(mapper.get_state_nl(state))
    status = "INVALID"

    for action in llm_constrained_plan.actions:
        state, unsatisfied_conditions = env.step_llm_plan(
            action, state, compiled_problem, simulator_constrained
        )
        if unsatisfied_conditions:
            status = "INVALID"
            print(action.action.name)
            break

    if state:
        unsatisfied_goals = simulator_constrained.get_unsatisfied_goals(state)
        if len(unsatisfied_goals) > 0:

            status = "INVALID"
            print(f"\tGoals {unsatisfied_goals} were not reached.")
        else:
            status = "VALID"

    # ===== check if constrained plan is optimal ===== #
    if status == "VALID":
        llm_constrained_plan_cost = len(llm_constrained_plan.actions)
        if llm_constrained_plan_cost > optimal_cost_constrained:
            print(
                f"\tSuboptimal constrained plan: The optimal cost is {optimal_cost_constrained}"
            )
            status = "SUBOPTIMAL"
        else:
            print("\tOptimal constrained plan.")
            status = "OPTIMAL"

    print(f"\tConstrained plan validation result: {status}")


def get_metrics_from_stored_llm_answers(cfg, env_class):

    env = env_class(cfg)

    model_names = [
        "deepseek",
        "o3",
        "gemini-2.5",
        "claude_37_sonnet",
        # "gpt-4.1",
        # "gpt-4.1@few-shot",
        # "gemini_llm@few-shot",
        # "deepseek_llm@few-shot",
        # "claude_llm@few-shot",
    ]
    unconstrained = False
    edit = False

    samples_no = len(env.evaluation_data)

    optimal_no = defaultdict(int)
    suboptimal_valid_no = defaultdict(int)
    violated_precondtions_no = defaultdict(int)
    unsatisfied_goals_no = defaultdict(int)
    violated_constraints_no = defaultdict(int)

    times_dict = defaultdict(list)
    completion_tokens_dict = defaultdict(list)
    reasoning_tokens_dict = defaultdict(list)

    optimal_costs = defaultdict(list)
    llm_plan_costs = defaultdict(list)

    for data_no in env.evaluation_data:

        (
            domain_file,
            compiled_domain_file,
            problem_file,
            unconstrained_problem_file,
            compiled_problem_file,
            plan_file,
            unconstrained_plan_file,
            data_file,
            nl_file,
        ) = data_sample_files(env.data_samples_dir, data_no, env.folder_no)

        base_path = get_sample_path(env.data_samples_dir, data_no, env.folder_no)

        reader_constrained = PDDLReader()

        data_sample = load_from_disk(data_file)

        if not unconstrained:
            compiled_problem = reader_constrained.parse_problem(
                compiled_domain_file, compiled_problem_file
            )

            constrained_plan = reader_constrained.parse_plan(
                compiled_problem, plan_file
            )
        else:
            compiled_problem = reader_constrained.parse_problem(
                domain_file, unconstrained_problem_file
            )

            constrained_plan = reader_constrained.parse_plan(
                compiled_problem, unconstrained_plan_file
            )

        print(f"Data No: {data_no}")

        env.reset(data_sample.seed, data_sample)

        # =====   evaluate metrics start ===== #

        optimal_cost_constrained = len(constrained_plan.actions)

        # mapper = env.mapper_class(compiled_problem)
        # plan_validator_constrained = PlanValidator(problem_kind=compiled_problem.kind)
        # plan_validator_unconstrained = PlanValidator(problem_kind=unconstrained_problem.kind)

        for model_name in model_names:

            # ===== constrained plan evaluation ===== #
            if not unconstrained:
                llm_constrained_plan_file = f"{base_path}/{model_name}_plan"

            # for unconstrained
            # UNCONSTRAINED CHECK
            else:
                llm_constrained_plan_file = (
                    f"{base_path}/{model_name}_plan_unconstrained"
                )

            if not os.path.isfile(llm_constrained_plan_file):
                continue
            try:
                llm_constrained_plan = reader_constrained.parse_plan(
                    compiled_problem, llm_constrained_plan_file
                )
            except Exception:
                if edit:
                    llm_constrained_plan = parse_plan_with_edit_distance(
                        compiled_problem, llm_constrained_plan_file
                    )
                else:
                    violated_precondtions_no[model_name] += 1
                    break

            # print(llm_constrained_plan)

            # print(f"{model_name} Constrained Plan:\n")
            # print(f"{llm_constrained_plan}\n")

            # ===== check if constrained plan is valid ===== #
            # I use a simulator instead of a validator in order to be able to check:
            # (i) which preconditions are not satisfied in the case of an INAPPLICABLE_ACTION failure reason
            # (ii) which goals were not reached in the case of an UNSATISFIED_GOALS failure reason
            # In either case, if a fluent added by the compiler is the culprit,
            # then we deduce that a constraint was violated.
            simulator_constrained = SequentialSimulator(compiled_problem)

            state = simulator_constrained.get_initial_state()
            # print(mapper.get_state_nl(state))
            status = "INVALID"

            for action in llm_constrained_plan.actions:
                state, unsatisfied_conditions = env.step_llm_plan(
                    action, state, compiled_problem, simulator_constrained
                )
                if unsatisfied_conditions:
                    status = "INVALID"
                    print(
                        f"\tAction {action} failed because conditions {unsatisfied_conditions} were not satisfied."
                    )
                    print(action.action.name)
                    # print(action.action.preconditions)
                    violated_precondtions_no[model_name] += 1
                    # for
                    # if unsatisfied_condit
                    # if "hold_" in action.name or "seen_" in action.name:
                    #   violated_
                    break

            if state:
                unsatisfied_goals = simulator_constrained.get_unsatisfied_goals(state)
                if len(unsatisfied_goals) > 0:
                    exists_hold_fluent = False
                    for unsat_goal in unsatisfied_goals:
                        if (
                            unsat_goal.is_fluent_exp()
                            and "hold_" in unsat_goal.fluent().name
                        ):
                            exists_hold_fluent = True
                            break
                    if exists_hold_fluent:
                        violated_constraints_no[model_name] += 1
                    else:
                        unsatisfied_goals_no[model_name] += 1

                    status = "INVALID"
                    print(f"\tGoals {unsatisfied_goals} were not reached.")
                else:
                    status = "VALID"

            # ===== check if constrained plan is optimal ===== #
            if status == "VALID":
                llm_constrained_plan_cost = len(llm_constrained_plan.actions)
                if llm_constrained_plan_cost > optimal_cost_constrained:
                    print(
                        f"\tSuboptimal constrained plan: The optimal cost is {optimal_cost_constrained}"
                    )
                    status = "SUBOPTIMAL"
                    suboptimal_valid_no[model_name] += 1
                else:
                    print("\tOptimal constrained plan.")
                    status = "OPTIMAL"
                    optimal_no[model_name] += 1
                llm_plan_costs[model_name].append(llm_constrained_plan_cost)
                optimal_costs[model_name].append(optimal_cost_constrained)

                if not unconstrained:
                    stats = get_llm_stats(f"{base_path}/{model_name}_stats")
                else:
                    stats = get_llm_stats(
                        f"{base_path}/{model_name}_stats_unconstrained"
                    )
                if len(stats) == 3:
                    my_time, completion_tokens, reasoning_tokens = stats
                else:
                    my_time, completion_tokens = stats
                    reasoning_tokens = 0
                times_dict[model_name].append(my_time)
                completion_tokens_dict[model_name].append(completion_tokens)
                reasoning_tokens_dict[model_name].append(reasoning_tokens)

            print(f"\tConstrained plan validation result: {status}")

    # ===== Print Metrics ===== #
    for model_name in model_names:

        print(f"Total problems: {samples_no}")
        print(f"Model: {model_name}\n")
        print(f"Optimal solutions: {optimal_no[model_name]}")
        print(f"Suboptimal valid solutions: {suboptimal_valid_no[model_name]}")
        invalid_solutions_no = (
            violated_precondtions_no[model_name]
            + unsatisfied_goals_no[model_name]
            + violated_constraints_no[model_name]
        )
        print(f"Invalid solutions: {invalid_solutions_no}, out of which: ")
        # print(f"\tAction precondition violations: {violated_precondtions_no[model_name]}")
        # print(f"\tUnsatisfied goals: {unsatisfied_goals_no[model_name]}")
        # print(f"\tConstraint violations: {violated_constraints_no[model_name]}\n")

        # print(f"Average response times: {sum(times_dict[model_name])/samples_no}")
        # print(f"Average completion tokens: {sum(completion_tokens_dict[model_name])/samples_no}")
        # print(f"Average reasoning tokens: {sum(reasoning_tokens_dict[model_name])/samples_no}")
        """
        if suboptimal_valid_no[model_name] > 0:
           # print(optimal_costs[model_name])
           # print(llm_plan_costs[model_name])
            fractions_sum = 0
            for i in range(0, len(optimal_costs[model_name])):
                fractions_sum += (
                    llm_plan_costs[model_name][i] - optimal_costs[model_name][i]
                ) / optimal_costs[model_name][i]
            diff = fractions_sum / len(optimal_costs[model_name])
            print(f"Average percentage cost difference: {diff}")
        """

        print()


def get_full_state(curr_state, updates_state):
    for fluent in updates_state._values.keys():
        if "hold" not in fluent.fluent().name and "seen" not in fluent.fluent().name:
            if updates_state.get_value(fluent) != curr_state.get_value(fluent):
                curr_state._values[fluent] = updates_state.get_value(fluent)

    return curr_state


def decision_making_llms(cfg, env_class):

    # ===== Setup and get problem sample ===== #

    def decision_making_with_llm(args):
        model_name_and_strategy, data_no = args
        model_name, strategy = model_name_and_strategy

        model_strategy_string = model_name + "@" + strategy if strategy else model_name

        env = env_class(cfg)
        (
            domain_file,
            problem_file,
            compiled_domain_file,
            compiled_problem_file,
            unconstrained_plan_file,
            plan_file,
            data_file,
        ) = get_data_sample_files_for_simulation(
            env.data_samples_dir, data_no, env.folder_no
        )
        data_sample = load_from_disk(data_file)
        base_path = get_sample_path(env.data_samples_dir, data_no, env.folder_no)
        env.reset(data_sample.seed, data_sample)

        reader_constrained = PDDLReader()
        problem_constrained = reader_constrained.parse_problem(
            domain_file, problem_file
        )
        mapper = env.mapper_class(problem_constrained)
        system_set_prompt, domain_nl, problem_nl = mapper.get_problem_nl()

        if strategy and strategy == "few-shot":

            few_shot_prompt = "Consider the following examples:\n"
            for data_no_few_shot in env.few_shot_data:
                (
                    domain_file_few_shot,
                    problem_file_few_shot,
                    compiled_domain_file_few_shot,
                    compiled_problem_file_few_shot,
                    unconstrained_plan_file_few_shot,
                    constrained_plan_file_few_shot,
                    data_file_few_shot,
                ) = get_data_sample_files_for_simulation(
                    env.data_samples_dir, data_no_few_shot, env.folder_no
                )

                reader_few_shot = PDDLReader()
                constrained_problem_few_shot = reader_few_shot.parse_problem(
                    domain_file_few_shot, problem_file_few_shot
                )

                mapper_constrained_few_shot = env.mapper_class(
                    constrained_problem_few_shot
                )

                _, _, problem_constrained_few_shot_nl = (
                    mapper_constrained_few_shot.get_problem_nl()
                )

                reader_few_shot = PDDLReader()

                compiled_problem_few_shot = reader_few_shot.parse_problem(
                    compiled_domain_file_few_shot, compiled_problem_file_few_shot
                )

                constrained_plan_few_shot = reader_constrained.parse_plan(
                    compiled_problem_few_shot, constrained_plan_file_few_shot
                )

                mapper_few_shot = env.mapper_class(compiled_problem_few_shot)

                plan_few_shot_nl = mapper_few_shot.get_plan_nl(
                    constrained_plan_few_shot
                )

                few_shot_prompt += f"\tProblem:\n {problem_constrained_few_shot_nl}\n"

                few_shot_prompt += f"\tOptimal Plan: {plan_few_shot_nl}\n"
            problem_nl += few_shot_prompt

        system_set_prompt += mapper.decision_making_prompt()
        messages = [
            {"role": "system", "content": system_set_prompt},
            {"role": "user", "content": domain_nl + problem_nl},
        ]
        problem_nl += mapper.decision_making_prompt()
        reader_constrained = PDDLReader()
        # constrained_problem = reader.parse_problem(domain_file, problem_file)
        compiled_problem = reader_constrained.parse_problem(
            compiled_domain_file, compiled_problem_file
        )

        optimal_plan = reader_constrained.parse_plan(compiled_problem, plan_file)

        simulator_constrained = SequentialSimulator(compiled_problem)
        state = simulator_constrained.get_initial_state()
        llm_execution_start_time = time.time()
        llm_plan = []
        curr_state = state
        while True:
            (
                response,
                prompt_tokens,
                completion_tokens,
                reasoning_content,
                reasoning_tokens,
            ) = env.chat_llm(model_name, system_set_prompt, messages)
            print(response)
            print(completion_tokens)
            print(reasoning_tokens)
            action_response, llm_action_plan = env.parse_action_from_response(
                compiled_problem, model_name, response
            )
            llm_action = llm_action_plan.actions[0]
            print(llm_action)
            print(action_response)
            state, unsatisfied_conditions = env.step_llm_plan(
                llm_action, state, compiled_problem, simulator_constrained
            )
            if unsatisfied_conditions:
                print("Failure due to invalid action.")
                break
            elif len(simulator_constrained.get_unsatisfied_goals(state)) == 0:
                llm_plan.append(llm_action)
                print("Goals satisfied.")
            else:
                llm_plan.append(llm_action)
                curr_state = get_full_state(curr_state, state)
                messages += [{"role": "assistant", "content": action_response}]
                messages += [
                    {"role": "user", "content": mapper.get_state_nl(curr_state)}
                ]

        llm_execution_time = time.time() - llm_execution_start_time

        llm_constrained_response_file = (
            f"{base_path}/decision_making_{model_strategy_string}_response"
        )
        llm_constrained_plan_file = (
            f"{base_path}/decision_making_{model_strategy_string}_plan"
        )
        llm_constrained_stats_file = (
            f"{base_path}/decision_making_{model_strategy_string}_stats"
        )
        # llm_constrained_plan = env.parse_response(model_name, response)

        print(llm_plan)
        print(len(llm_plan))
        print(optimal_plan.actions)
        print(len(optimal_plan.actions))
        with open(llm_constrained_response_file, "w") as f:
            f.write(f"{response}")
        with open(llm_constrained_plan_file, "w") as f:
            f.write(f"{llm_plan}")

        with open(llm_constrained_stats_file, "w") as f:
            f.write(f"Time: {llm_execution_time}\n")
            f.write(f"Completion Tokens: {completion_tokens}\n")

        if model_name == "deepseek":
            reasoning_content_constrained_file = f"{base_path}/decision_making_{model_strategy_string}_reasoning_content_constrained"
            with open(reasoning_content_constrained_file, "w") as f:
                f.write(reasoning_content)

        if reasoning_tokens:
            with open(llm_constrained_stats_file, "a") as f:
                f.write(f"Reasoning Tokens: {reasoning_tokens}\n")
        return f"{model_strategy_string} responded on {data_no}"

    # format: if "@" exists in the models name, then the format is model_name@prompting_strategy
    model_names_and_strategies = [
        # ("deepseek", None),
        # ("o3", None),
        ("gemini-2.5", None),
        # ("gpt-4.1", None),
        # ("gpt-4.1", "few-shot"),
    ]  # ["deepseek"]  # ["o3", "gemini-2.5", "claude_37_sonnet", "deepseek"]
    pairs = list(product(model_names_and_strategies, cfg.evaluation_data))

    with ThreadPoolExecutor() as executor:
        results = list(executor.map(decision_making_with_llm, pairs))
    print(results)


def simulate_policy(cfg, env_class):
    start_time = time.time()
    env = env_class(cfg)

    print(env.data_samples_dir)
    print(env.folder_no)

    (
        domain_file,
        problem_file,
        compiled_domain_file,
        compiled_problem_file,
        unconstrained_plan_file,
        constrained_plan_file,
        data_file,
    ) = get_data_sample_files_for_simulation(
        env.data_samples_dir, env.data_no, env.folder_no
    )

    # data_sample = load_from_disk(data_file)
    reader = PDDLReader()

    data_sample = load_from_disk(data_file)
    compiled_problem = reader.parse_problem(compiled_domain_file, compiled_problem_file)
    constrained_problem = reader.parse_problem(domain_file, problem_file)
    goals = constrained_problem.goals
    constraints = constrained_problem.trajectory_constraints
    # plan = load_plan(compiled_problem, plan_file)
    print(compiled_problem)
    print(constrained_plan_file)
    plan = load_plan(compiled_problem, constrained_plan_file)
    # plan = load_plan(constrained_problem, constrained_plan_file)

    # env.reset(env.data_no, data_sample)

    print(data_sample)
    print(env.data_no)
    env.reset(env.data_no, data_sample)

    # print(f"Initial State: {data_sample.initial_state}")
    print(f"Goals: {goals}")
    print(f"Constraints: {constraints}")

    init_state_time = time.time()
    simulator = SequentialSimulator(compiled_problem)
    state = simulator.get_initial_state()
    print(f"Init state retrieve time: {time.time() - init_state_time}")
    for action in plan.actions:

        step_start_time = time.time()
        state, goal_reached, action_failed = env.step_with_high_level_action(
            action, state, compiled_problem, simulator
        )
        print(f"Step time: {time.time() - step_start_time}")
        if action_failed:
            print(f"Action {action} failed at {action_failed}")
            break

        if env.render:
            plot_grid(env.env)

        if goal_reached:
            print("Plan ok")
            break
    if not goal_reached:
        print("Goal not reached")
    print(f"Total time: {time.time() - start_time}")


class LexiCon(ABC):
    def __init__(self, cfg):
        # set_domain_name is defined in concrete subclasses.
        self.set_domain_name()
        self.signed_predicates_per_constraint_type = None
        self.mode = cfg.mode
        self.set_data_samples_dir()
        os.makedirs(self.data_samples_dir, exist_ok=True)
        if self.mode == "generation":
            self.set_logs_dir()
            os.makedirs(self.logs_dir, exist_ok=True)
            self.initial_seed = cfg.initial_seed
            self.num_seeds = cfg.num_seeds
            self.constraint_form = cfg.constraint_form
        elif self.mode == "simulation":
            self.time_step = 0
            self.render = cfg.render
            self.data_no = cfg.data_no
            self.folder_no = cfg.folder_no
        elif self.mode in [
            "evaluation",
            "evaluation-unconstrained",
            "decision-making",
            "metrics",
            "verification",
        ]:
            self.llm = cfg.llm
            self.set_evaluation_logs_dir()
            os.makedirs(self.logs_dir, exist_ok=True)
            self.time_step = 0
            self.render = cfg.render
            self.few_shot_data = cfg.few_shot_data
            # self.data_no = cfg.data_no
            self.evaluation_data = cfg.evaluation_data
            self.folder_no = cfg.folder_no
        else:
            raise ValueError(
                f"Unsupported mode: {self.mode}. Expected 'generation' or 'simulation'."
            )

        self._initialize_env()

    @abstractmethod
    def set_domain_name(self):
        pass

    @abstractmethod
    def _initialize_env(self, *args, **kwargs):
        pass

    @abstractmethod
    def reset(self, *args, **kwargs):
        pass

    def set_data_samples_dir(self):
        self.data_samples_dir = f"./domains/{self.domain}/data"

    def set_logs_dir(self):
        self.logs_dir = f"./domains/{self.domain}/logs"

    def set_evaluation_logs_dir(self):
        self.logs_dir = f"./domains/{self.domain}/evaluation_logs"

    def is_feasible_low_level(self, plan):
        """Override for domains where plans need to be simulated into a lower level environment."""
        return True

    def is_feasible_low_level_action(self, action):
        """Override for domains where actions need to be simulated into a lower level environment."""
        return True

    def step_with_high_level_action(self, action, state, problem, simulator):

        if simulator.is_applicable(state, action):
            if not self.is_feasible_low_level_action(action):
                return state, False, ActionFailureKind.LOW_LEVEL
            new_state = simulator.apply(state, action)
            if len(simulator.get_unsatisfied_goals(new_state)) == 0:
                return new_state, True, False
            else:
                return new_state, False, False
        else:
            unsatisfied_conditions, _ = simulator.get_unsatisfied_conditions(
                state, action
            )
            print(f"Unsatisfied condition: {unsatisfied_conditions}")
            return state, False, ActionFailureKind.HIGH_LEVEL

    def step_llm_plan(self, action, state, problem, simulator):
        if simulator.is_applicable(state, action):
            new_state = simulator.apply(state, action)
            return new_state, None
        else:
            try:
                unsatisfied_conditions, _ = simulator.get_unsatisfied_conditions(
                    state, action
                )
            except Exception:
                return None, ["exception"]
            return None, unsatisfied_conditions

    def map_pddl2simulator(self, action: Action):
        return self.env.map_pddl2simulator(action)

    def sample_constraint(self, states, goal, static_fluents):
        for _ in range(100):
            constraint_type = sample_one(self.constraint_form.constraint_types.keys())
            constraint_params = self.constraint_form.constraint_types[constraint_type]
            operation = sample_one(constraint_params["operations"])
            operation = (
                OperationType.AND_OP if operation == "and" else OperationType.OR_OP
            )
            arguments_min = int(constraint_params["arguments_min"])
            arguments_max = int(constraint_params["arguments_max"])
            number_of_literals = random.randint(arguments_min, arguments_max)
            constraint_type = ConstraintType(constraint_type)
            if constraint_type in [
                ConstraintType.ALWAYS,
                ConstraintType.SOMETIME,
                ConstraintType.AT_MOST_ONCE,
            ]:
                literals = list()
                for i in range(0, number_of_literals):
                    for _ in range(0, 5):
                        literal = sample_literal_for_arity_one_constraint(
                            constraint_type,
                            self.unconstrained_problem,
                            states,
                            goal,
                            static_fluents,
                            self.signed_predicates_per_constraint_type,
                            self.domain_axioms,
                        )
                        if literal is None:
                            continue
                        if operation != OperationType.AND_OP or all(
                            literals_are_compatible(literal, lit, self.domain_axioms)
                            for lit in literals
                        ):
                            break
                    if literal is not None:
                        literals.append(literal)
                if len(literals) == 0:
                    continue
                if operation == OperationType.AND_OP:
                    formula = And(literals)
                else:
                    formula = Or(literals)
                if constraint_type == ConstraintType.ALWAYS:
                    pddl_constraints = [Always(formula)]
                elif constraint_type == ConstraintType.SOMETIME:
                    pddl_constraints = [Sometime(formula)]
                else:
                    pddl_constraints = [AtMostOnce(formula)]

                return pddl_constraints

            else:
                # the first formula of the temporal constraint is always a literal
                for _ in range(5):
                    literal1 = sample_first_literal_for_arity_two_constraint(
                        constraint_type,
                        self.unconstrained_problem,
                        states,
                        goal,
                        static_fluents,
                        self.signed_predicates_per_constraint_type,
                        self.domain_axioms,
                    )
                    if literal1 is not None:
                        break
                if literal1 is None:
                    continue

                literals2 = list()
                for i in range(0, number_of_literals):
                    for j in range(0, 5):
                        literal2 = sample_second_literal_for_arity_two_constraint(
                            constraint_type,
                            literal1,
                            self.unconstrained_problem,
                            states,
                            goal,
                            static_fluents,
                            self.signed_predicates_per_constraint_type,
                            self.domain_axioms,
                        )
                        if literal2 is None:
                            continue
                        if operation != OperationType.AND_OP or all(
                            literals_are_compatible(literal2, lit, self.domain_axioms)
                            for lit in literals2
                        ):
                            break
                    if literal2 is not None:
                        literals2.append(literal2)
                if len(literals2) == 0:
                    continue
                if operation == OperationType.AND_OP:
                    formula2 = And(literals2)
                else:
                    formula2 = Or(literals2)
                if constraint_type == ConstraintType.SOMETIME_BEFORE:
                    pddl_constraints = [
                        Sometime(literal1),
                        SometimeBefore(literal1, formula2),
                    ]
                elif constraint_type == ConstraintType.SOMETIME_AFTER:
                    pddl_constraints = [
                        Sometime(literal1),
                        SometimeAfter(literal1, formula2),
                    ]
                return pddl_constraints

        return None

    def sample_constraints(self, states, goal, static_fluents):
        list_of_pddl_constraints = list()
        for _ in range(self.constraint_form.constraints_no):  # self.constraints_no):
            valid_constraint_found = False
            for _ in range(0, 100):
                pddl_constraints = self.sample_constraint(states, goal, static_fluents)
                # print(f"Sampled constraint: {pddl_constraints}\n")
                # print(f"Current constraints: {list_of_pddl_constraints}\n")
                if (
                    pddl_constraints is not None
                    and all(
                        pddl_constraint not in list_of_pddl_constraints
                        for pddl_constraint in pddl_constraints
                    )
                    and all(
                        constraints_are_compatible(
                            my_constraint, prev_constraint, self.domain_axioms
                        )
                        for my_constraint in pddl_constraints
                        for prev_constraint in list_of_pddl_constraints
                    )
                ):
                    # print("Valid Constaint!\n\n")
                    valid_constraint_found = True
                    break
                # print("Invalid Constaint...\n\n")
            if valid_constraint_found:
                for pddl_constraint in pddl_constraints:
                    list_of_pddl_constraints.append(pddl_constraint)
        # if len(list_of_pddl_constraints) > 0:
        return list_of_pddl_constraints
        # return []
        # raise RuntimeError("No constraint found for this problem.")

    def generate_constrained_problem(self):

        generation_start_time = time.time()
        random.seed(self.seed)

        logger = setup_logger(
            self.logs_dir, self.seed, self.constraint_form.constraints_no
        )

        (
            domain_file,
            compiled_domain_file,
            problem_file,
            unconstrained_problem_file,
            compiled_problem_file,
            plan_file,
            unconstrained_plan_file,
            data_file,
            nl_file,
        ) = data_sample_files(
            self.data_samples_dir, self.seed, self.constraint_form.constraints_no
        )

        seed_start_time = time.time()
        stats = GenerationStats()

        logger.info(f"\n================= Seed: {self.seed} =================\n")
        print(f"\n================= Seed: {self.seed} =================\n")

        unconstrained_problem = self.unconstrained_problem

        # with OneshotPlanner(problem_kind=unconstrained_problem.kind) as planner:
        with OneshotPlanner(name="symk") as planner:
            unconstrained_planning_result = planner.solve(unconstrained_problem)

        # initial_nl_state = observation["nl_grid_description"]

        logger.info(self.unconstrained_problem)

        logger.info("Generating plan for unconstrained problem\n")
        unconstrained_planning_start_time = time.time()
        # try:
        #    unconstrained_planning_result = solve_unconstrained(unconstrained_problem)
        # except RuntimeError as e:
        # stats.update_stat("infeasible_unconstrained")
        # print(f"Seed: {self.seed} {e}")
        #    return None  # stats, "incomplete"
        unconstrained_planning_time = time.time() - unconstrained_planning_start_time
        logger.info(
            f"Unconstrained plan generation time: {unconstrained_planning_time}\n"
        )

        if (
            unconstrained_planning_result.status
            != PlanGenerationResultStatus.SOLVED_OPTIMALLY
        ):
            print(
                f"Seed {self.seed}: Unconstrained planning status: {unconstrained_planning_result.status}"
            )
            # stats.update_stat("infeasible_unconstrained")
            return None  # stats, "incomplete"

        unconstrained_plan = unconstrained_planning_result.plan.actions
        unconstrained_cost = len(unconstrained_plan)
        logger.info("Unconstrained plan and cost: ")
        logger.info(unconstrained_planning_result.plan)
        logger.info(unconstrained_cost)

        # print(f"Unconstrained problem kind: {unconstrained_problem.kind}")

        # is_feasible_unconstrained_plan = self.is_feasible_low_level(unconstrained_plan)
        if not self.is_feasible_low_level(unconstrained_plan):
            logger.info(
                f"Seed: {self.seed} Unconstrained plan simulation is not feasible\n"
            )
            # stats.update_stat("infeasible_unconstrained")
            return None  # stats, "incomplete"
        constraint_generation_start_time = time.time()
        # First, simulate the unconstrained plan, inducing a sequence of states
        state_changes = simulate_high_level_plan(
            unconstrained_problem, unconstrained_planning_result.plan
        )
        states = [
            state
            for state in [
                non_static_atoms(state, self.unconstrained_problem)
                for state, _ in state_changes
            ]
        ]
        goal = self.unconstrained_problem.goals[0]

        if goal.is_exists():
            goal = simplify_flat_exists(self.unconstrained_problem, goal)

        static_fluents = self.unconstrained_problem.get_static_fluents()

        list_of_pddl_constraints = self.sample_constraints(states, goal, static_fluents)
        constraint_generation_time = time.time() - constraint_generation_start_time

        logger.info("Sampled constraints:\n")
        # print("Sampled constraints: ")
        for pddl_constraint in list_of_pddl_constraints:
            #    print(pddl_constraint)
            logger.info(pddl_constraint)
        logger.info("")
        logger.info(f"Generation time: {constraint_generation_time}\n")

        constrained_problem = unconstrained_problem.clone()
        for constraint in list_of_pddl_constraints:
            constrained_problem.add_trajectory_constraint(constraint)

        # Compilation + Planning with LiftedTCORE

        logger.info("Generating plan for constrained problem (with LiftedTCORE).\n")
        liftedtcore_start_time = time.time()
        try:
            compiled_lifted_problem = compile_lifted_tcore(constrained_problem)
        except RuntimeError:  # as e:
            # print(f"Seed: {self.seed} {e}")
            # stats.update_stat("unsolvable_constrained")
            return None  # stats, "incomplete"
        liftedtcore_compilation_time = time.time() - liftedtcore_start_time
        logger.info(f"LiftedTCORE compilation time: {liftedtcore_compilation_time}\n")

        lifted_planning_start_time = time.time()
        try:
            res = solve_compiled_lifted(compiled_lifted_problem)
        except RuntimeError:  # as e:
            # print(f"Seed: {self.seed} {e}")
            # stats.update_stat("unsolvable_constrained")
            return None  # stats, "incomplete"
        lifted_planning_time = time.time() - lifted_planning_start_time
        logger.info(f"Planning Time with LiftedTCORE's file: {lifted_planning_time}\n")

        if res.status != PlanGenerationResultStatus.SOLVED_OPTIMALLY:
            # stats.update_stat("unsolvable_constrained")
            # print(f"Seed {self.seed}: Constrained planning status: {res.status}")
            return None  # stats, "incomplete"

        plan = res.plan
        logger.info(f"Plan found with LiftedTCORE + sym_bd: {plan}")

        constrained_plan = plan.actions
        constrained_cost = len(constrained_plan)

        logger.info(f"Seed: {self.seed} is solvable\n")

        # Test: Do the sampled constraints lead to an optimal plan of reduced cost?
        if unconstrained_cost == constrained_cost:
            # stats.update_stat("without_cost_increase")
            logger.info(
                f"Seed: {self.seed} optimal constrained plan yields the same cost ({constrained_cost}) as the optimal unconstrained plan"
            )
            return None  # stats, "incomplete"

        logger.info("Unconstrained cost: " + str(unconstrained_cost))
        logger.info("Constrained cost: " + str(constrained_cost))

        # plans are executable by the planner but the plans are not feasible
        # unless it can be simulated (executed within the simulator)
        # is_feasible_simulation = self.is_feasible_low_level(constrained_plan)
        if not self.is_feasible_low_level(constrained_plan):
            # stats.update_stat("infeasible_constrained")
            logger.info(
                f"Seed: {self.seed} Constrained plan simulation is not feasible"
            )
            return None  # stats, "incomplete"

        # nl_states.insert(0, initial_nl_state)
        logger.info(f"Seed: {self.seed} Plan simulation is feasible")
        # stats.update_stat("feasible_constrained")

        logger.info(
            f"\nSeed: {self.seed} \n Plan: {constrained_plan}  "
            f"\n Cost: {constrained_cost}\n"
        )

        print(f"Seed {self.seed} execution time: {time.time() - seed_start_time}")

        # =====   Write into files section start ===== #

        setup_sample_dir(
            self.data_samples_dir, self.seed, self.constraint_form.constraints_no
        )
        writer = PDDLWriter(unconstrained_problem)
        writer.write_problem(unconstrained_problem_file)
        writer = PDDLWriter(constrained_problem)
        writer.write_domain(domain_file)
        writer.write_problem(problem_file)
        writer.write_plan(unconstrained_planning_result.plan, unconstrained_plan_file)
        writer = PDDLWriter(compiled_lifted_problem)
        writer.write_domain(compiled_domain_file)
        writer.write_problem(compiled_problem_file)
        writer.write_plan(plan, plan_file)

        if not hasattr(self, "observation") or self.observation is None:
            sample = Sample(seed=self.seed, initial_state=None)
        else:
            sample = Sample(
                seed=self.seed, initial_state=self.observation["object_pos_tuples"]
            )

        with open(data_file, "wb") as infile:
            pickle.dump(sample, infile)

        # =====   Write into files section end ===== #

        # =====  PDDL2NL section start ===== #

        pddl2nl_start_time = time.time()

        mapper = self.mapper_class(constrained_problem)
        system_set_prompt, domain_nl, problem_nl = mapper.get_problem_nl()

        pddl2nl_time = time.time() - pddl2nl_start_time
        logger.info(
            f"Time for Translating the Constrained Problem into NL: {pddl2nl_time}\n"
        )

        # mapper_unc = self.mapper_class(unconstrained_problem)
        # system_set_prompt_unc, domain_nl_unc, problem_nl_unc = (
        # mapper_unc.get_unconstrained_problem_nl()
        # )
        with open(nl_file, "w") as infile:
            infile.write(domain_nl)
            infile.write(problem_nl)
            # infile.write(plan_nl)

        # =====  PDDL2NL section end ===== #

        generation_time = time.time() - generation_start_time

        # =====   Update metrics for seed start ===== #
        stats.update_cost("unconstrained", unconstrained_cost)
        stats.update_cost("constrained", constrained_cost)

        stats.update_time("unconstrained_planning", unconstrained_planning_time)
        stats.update_time("constraints_generation", constraint_generation_time)
        stats.update_time("compilation", liftedtcore_compilation_time)
        stats.update_time("constrained_planning", lifted_planning_time)
        stats.update_time("pddl2nl", pddl2nl_time)
        stats.update_time("total", generation_time)

        # =====   Update metrics for seed end ===== #

        # TODO: Report average plan length

        close_logger(logger)

        return stats

    def get_llm_params(self, model_name):
        if model_name == "gpt-4.1":
            api_key = os.environ["OPENAI_API_KEY"]
            client = OpenAI(api_key=api_key)
            llm_model = "gpt-4.1"
        elif model_name == "o3":
            api_key = os.environ["OPENAI_API_KEY"]
            client = OpenAI(api_key=api_key)
            llm_model = "o3"
        elif model_name in ["gemini-2.5", "gemini_llm"]:
            api_key = os.environ["GEMINI_API_KEY"]
            # client = genai.Client(api_key=api_key)
            client = OpenAI(
                api_key=api_key,
                base_url="https://generativelanguage.googleapis.com/v1beta/openai/",
            )
            if model_name == "gemini-2.5":
                llm_model = "gemini-2.5-pro-preview-03-25"
            else:
                llm_model = "gemini-2.0-flash"

        elif model_name in ["claude_37_sonnet", "claude_llm"]:
            api_key = os.environ["ANTHROPIC_API_KEY"]
            client = Anthropic(api_key=api_key)
            llm_model = "claude-3-7-sonnet-20250219"
        elif model_name == "deepseek":
            api_key = os.environ["DEEPSEEK_API_KEY"]
            client = OpenAI(api_key=api_key, base_url="https://api.deepseek.com")
            llm_model = "deepseek-reasoner"
        elif model_name == "deepseek_llm":
            api_key = os.environ["DEEPSEEK_API_KEY"]
            client = OpenAI(api_key=api_key, base_url="https://api.deepseek.com")
            llm_model = "deepseek-chat"

        max_tokens = 8192
        if model_name in ["gemini-2.5", "gemini_llm"]:
            max_tokens = 64000
        if model_name in ["o3"]:
            max_tokens = 100000
        if model_name in ["claude_37_sonnet", "claude_llm"]:
            max_tokens = 20000
        # if model_name in ["deepseek"]:
        # This get a badrequest error because "valid range of max_tokens [1, 8192]
        # max_tokens = 32000

        temperature = 0.2
        if model_name in ["o3", "claude_37_sonnet"]:
            temperature = 1
        return client, llm_model, max_tokens, temperature

    def parse_llm_response(self, model_name, response):
        if model_name in ["claude_37_sonnet"]:
            content = response.content[0].thinking
            prompt_tokens = response.usage.input_tokens
            completion_tokens = response.usage.output_tokens
        elif model_name in ["claude_llm"]:
            content = response.content[0].text
            prompt_tokens = response.usage.input_tokens
            completion_tokens = response.usage.output_tokens
        else:
            content = response.choices[0].message.content
            prompt_tokens = response.usage.prompt_tokens
            completion_tokens = response.usage.completion_tokens

        reasoning_content = (
            response.choices[0].message.reasoning_content
            if model_name == "deepseek"
            else ""
        )

        if model_name in ["deepseek", "o3"]:
            reasoning_tokens = response.usage.completion_tokens_details.reasoning_tokens
        elif model_name in ["gemini-2.5"]:
            reasoning_tokens = response.usage.total_tokens - prompt_tokens
        else:
            reasoning_tokens = None
        return (
            content,
            prompt_tokens,
            completion_tokens,
            reasoning_content,
            reasoning_tokens,
        )

    def prompt_llm(self, model_name, system_set_prompt, problem_prompt):

        client, llm_model, max_tokens, temperature = self.get_llm_params(model_name)

        if model_name == "claude_37_sonnet":
            response = client.messages.create(  # with streaming response
                model=llm_model,
                system=system_set_prompt,
                messages=[
                    {
                        "role": "user",
                        "content": problem_prompt,
                    }
                ],
                temperature=temperature,
                max_tokens=max_tokens,
                thinking={"type": "enabled", "budget_tokens": 15000},  # 32000},
            )
        elif model_name == "claude_llm":
            response = client.messages.create(  # with streaming response
                model=llm_model,
                system=system_set_prompt,
                messages=[
                    {
                        "role": "user",
                        "content": problem_prompt,
                    }
                ],
                temperature=temperature,
                max_tokens=max_tokens,
            )
        elif model_name in ["o3", "gpt-4.1"]:
            response = client.chat.completions.create(
                model=llm_model,
                messages=[
                    {"role": "system", "content": system_set_prompt},
                    {"role": "user", "content": problem_prompt},
                ],
                temperature=temperature,
                max_completion_tokens=max_tokens,
            )
        elif model_name == "gemini_llm":
            response = client.chat.completions.create(
                model=llm_model,
                messages=[
                    {"role": "system", "content": system_set_prompt},
                    {"role": "user", "content": problem_prompt},
                ],
                temperature=temperature,
                max_tokens=max_tokens,
            )
        elif model_name:
            response = client.chat.completions.create(
                model=llm_model,
                messages=[
                    {"role": "system", "content": system_set_prompt},
                    {"role": "user", "content": problem_prompt},
                ],
                temperature=temperature,
                max_tokens=max_tokens,
                reasoning_effort="high",
            )
        """
        elif model_name in ["gemini-2.5"]:
            response = client.models.generate_content(
                model=llm_model,
                config=types.GenerateContentConfig(
                    system_instruction=system_set_prompt,
                    max_output_tokens=max_tokens,
                    temperature=temperature,
                ),
                contents=problem_prompt,
                # temperature=temperature,
                # max_completion_tokens=max_tokens,
            )
        """
        (
            content,
            prompt_tokens,
            completion_tokens,
            reasoning_content,
            reasoning_tokens,
        ) = self.parse_llm_response(model_name, response)
        return (
            content,
            prompt_tokens,
            completion_tokens,
            reasoning_content,
            reasoning_tokens,
        )

    def parse_response(self, model_name, response):
        parsed_plan = ""
        planStarted = False
        prev = ""
        for line in response.split("\n"):
            if not planStarted and "```" not in line:
                continue
            elif not planStarted:
                planStarted = True
            elif "```" in prev and "```" in line:
                continue
            elif "```" in line:
                break
            else:
                parsed_plan += f"({line})\n"
            prev = line
        return parsed_plan

    def parse_action_from_response(self, compiled_problem, model_name, response):
        lines = response.split("\n")
        if len(lines) == 1:
            action_response = lines[0]
            parsed_action = f"({lines[0]})\n"
        else:
            parsed_action = ""
            action_response = ""
            planStarted = False
            prev = ""
            for line in response.split("\n"):
                if not planStarted and "```" not in line:
                    continue
                elif not planStarted:
                    action_response += "```\n"
                    planStarted = True
                elif "```" in prev and "```" in line:
                    continue
                elif "```" in line:
                    action_response += "```\n"
                    break
                else:
                    action_response += line
                    parsed_action += f"({line})\n"
                    break
                prev = line

        reader = PDDLReader()
        action = reader.parse_plan_string(compiled_problem, parsed_action)
        return action_response, action


def run_lexicon(cfg, env_class):
    if cfg.mode == "generation":
        generate_dataset(cfg, env_class)
    elif cfg.mode == "verification":
        verify_llm_plan(cfg, env_class)
    elif cfg.mode == "simulation":
        simulate_policy(cfg, env_class)
    elif cfg.mode == "evaluation":
        evaluate_llms(cfg, env_class)
    elif cfg.mode == "evaluation-unconstrained":
        evaluate_unconstrained_llms(cfg, env_class)
    elif cfg.mode == "metrics":
        get_metrics_from_stored_llm_answers(cfg, env_class)
    elif cfg.mode == "decision-making":
        decision_making_llms(cfg, env_class)
