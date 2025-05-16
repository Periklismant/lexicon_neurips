from omegaconf import DictConfig
import hydra
import os
import sys
import gymnasium as gym

from lexicon import LexiCon, run_lexicon

from domains.babyai.utils.constraints import (
    signed_predicates_per_constraint_type,
    domain_axioms,
)
from domains.babyai.utils.game_state import get_task_representations
from domains.babyai.utils.pddl_wrapper import PDDLObsWrapper
from domains.babyai.utils.babyai_patches import (
    gen_grid,
    validate_instrs,
    gen_mission,
    reset_via_load,
    connect_all,
    add_distractors,
    place_obj,
)

from utils.utils import (
    ActionSpace,
    Sample,
    plot_grid,
    InfeasiblePlan,
    close_logger,
    constrained_problem_files,
    unconstrained_problem_files,
)

from typing import Optional

from minigrid.core.roomgrid import RoomGrid
from minigrid.envs.babyai.core.levelgen import LevelGen
from minigrid.envs.babyai.core.roomgrid_level import RoomGridLevel
from minigrid.minigrid_env import MiniGridEnv
from domains.babyai.up_domain import get_minigrid_problem

from domains.babyai.mapper import BabyAIMapper


class BabyAI(LexiCon):

    def __init__(self, cfg):
        super().__init__(cfg)
        self.signed_predicates_per_constraint_type = (
            signed_predicates_per_constraint_type
        )
        self.domain_axioms = domain_axioms

        self.mapper_class = BabyAIMapper

        self.render = False

    def _initialize_env(self):
        # using monkey_patching
        if self.mode in [
            "simulation",
            "evaluation",
            "evaluation-unconstrained",
            "metrics",
            "verification",
        ]:
            RoomGrid._gen_grid = gen_grid
            RoomGridLevel.validate_instrs = validate_instrs
            LevelGen.gen_mission = gen_mission
            MiniGridEnv.reset = reset_via_load
        elif self.mode == "generation":
            RoomGrid.connect_all = connect_all
            RoomGrid.add_distractors = add_distractors
            MiniGridEnv.place_obj = place_obj
        env = gym.make(
            "BabyAI-MiniBossLevel-v0", render_mode="rgb_array", highlight=False
        )
        self.env = PDDLObsWrapper(env)

    def reset(self, seed: Optional[int], data: Optional[Sample] = None):
        self.env.prev_obs = None
        if self.mode in [
            "simulation",
            "evaluation",
            "evaluation-unconstrained",
            "metrics",
            "verification",
        ]:
            RoomGrid.initial_state = data.initial_state
            observation, info = self.env.reset(seed=seed)
            self.observation = observation
            # nl_task = data.nl_task
            # rl_goal = data.rl_goal  # this rl_goal is not str, rather of class Goal
            # self.problem = data.problem
            self.time_step = 0
            if self.render:
                plot_grid(self.env)
        elif self.mode == "generation":
            # generate problem file
            observation, info = self.env.reset(seed=seed)
            self.observation = observation
            # here rl_goal is of type str
        nl_task, rl_goal = get_task_representations(observation, seed)
        self.observation["mission"] = nl_task
        self.env.mission = nl_task
        self.env.goal = rl_goal
        self.seed = seed
        self.unconstrained_problem = get_minigrid_problem(observation, rl_goal)
        # print("Observation: ")
        # for key, element in self.observation.items():
        # print(key)
        # print(element)
        # print()
        # goal = self.unconstrained_problem.goals[0]
        # print(goal)
        # ground_goal = simplify_flat_exists(self.unconstrained_problem, goal)
        # print(ground_goal)
        # simplifier = QuantifierSimplifier(
        # self.unconstrained_problem.environment, self.unconstrained_problem
        # )
        # simplified_goal = simplifier.qsimplify(goal, self.unconstrained_problem.initial_values, {})
        # print(simplified_goal)
        return observation, info, nl_task

    def is_feasible_low_level(self, plan):
        # map plan to simulator syntax
        # nl_states = []
        # done = False
        simulator_plan = self.env.map_plan2simulator(plan)
        for action in simulator_plan:
            try:
                # observation, _, terminated, truncated, _ = self.env.step(action)
                self.env.step(action)
                # done = terminated or truncated
                # nl_states.append(observation["nl_grid_description"])
                # if done:
                # return True, simulator_plan, nl_states
            except InfeasiblePlan as e:
                print(f"Infeasible plan: {e.message}")
                return False  # , simulator_plan, nl_states
        return True  # , simulator_plan, nl_states

    def is_feasible_low_level_action(self, action):
        print(action)
        # simulator_action = self.env.map_compiledpddl2simulator(action)
        simulator_action = self.env.map_pddl2simulator(action)
        print(simulator_action)
        try:
            self.env.step(simulator_action)
        except InfeasiblePlan as e:
            print(f"Infeasible plan: {e.message}")
            return False
        return True

    def set_domain_name(self):
        self.domain = "babyai"

    def get_problem_and_plan_nl(self):
        domain_file, problem_file, plan_file = constrained_problem_files(
            self.data_samples_dir, self.seed
        )
        mapper = BabyAIMapper(domain_file, problem_file, plan_file)

        return mapper.domain_nl(), mapper.problem_nl(), mapper.plan_nl()


def main(cfg: DictConfig):
    run_lexicon(cfg, BabyAI)


if __name__ == "__main__":
    main()
