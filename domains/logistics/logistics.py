from omegaconf import DictConfig
import hydra
import os
import sys
import gymnasium as gym

from lexicon import LexiCon, run_lexicon

from utils.utils import ActionSpace, Sample, plot_grid, InfeasiblePlan, close_logger

from typing import Optional

from domains.logistics.up_domain import get_logistics_problem

from domains.logistics.utils.constraints import (
    signed_predicates_per_constraint_type,
    domain_axioms,
)

from domains.logistics.mapper import LogisticsMapper


class Logistics(LexiCon):

    def __init__(self, cfg):
        super().__init__(cfg)
        self.signed_predicates_per_constraint_type = (
            signed_predicates_per_constraint_type
        )
        self.domain_axioms = domain_axioms
        self.mapper_class = LogisticsMapper
        self.render = False

    def _initialize_env(self):
        return

    def reset(self, seed: Optional[int], data: Optional[Sample] = None):
        self.seed = seed
        self.unconstrained_problem = get_logistics_problem(seed=seed)

    def is_feasible_low_level(self, plan):
        return True  # , simulator_plan, nl_states

    def is_feasible_low_level_action(self, action):
        return True

    def set_domain_name(self):
        self.domain = "logistics"


def main(cfg: DictConfig):
    run_lexicon(cfg, Logistics)


if __name__ == "__main__":
    main()
