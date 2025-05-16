from omegaconf import DictConfig
import hydra
import os
import sys
import gymnasium as gym

from lexicon import LexiCon, run_lexicon

from utils.utils import ActionSpace, Sample, plot_grid, InfeasiblePlan, close_logger

from typing import Optional

from domains.sokoban.up_domain import get_sokoban_problem

from domains.sokoban.utils.constraints import (
    signed_predicates_per_constraint_type,
    domain_axioms,
)

from domains.sokoban.mapper import SokobanMapper


class Sokoban(LexiCon):

    def __init__(self, cfg):
        super().__init__(cfg)
        self.signed_predicates_per_constraint_type = (
            signed_predicates_per_constraint_type
        )
        self.domain_axioms = domain_axioms
        self.mapper_class = SokobanMapper
        self.render = False

    def _initialize_env(self):
        return

    def reset(self, seed: Optional[int], data: Optional[Sample] = None):
        self.seed = seed
        self.unconstrained_problem = get_sokoban_problem(seed=seed)

    def is_feasible_low_level(self, plan):
        return True  # , simulator_plan, nl_states

    def is_feasible_low_level_action(self, action):
        return True

    def set_domain_name(self):
        self.domain = "sokoban"


def main(cfg: DictConfig):
    run_lexicon(cfg, Sokoban)


if __name__ == "__main__":
    main()
