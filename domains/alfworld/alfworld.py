from omegaconf import DictConfig
import hydra
import os
import sys
import gymnasium as gym

sys.path.append(os.environ["LEXICON"])

from lexicon import LexiCon, run_lexicon

from typing import Optional

from up_domain import get_alfworld_problem

from utils.constraints import (
    signed_predicates_per_constraint_type,
    domain_axioms,
)

from utils.utils import (
    Sample,
    constrained_problem_files,
)


from mapper import AlfWorldMapper


class AlfWorld(LexiCon):

    def __init__(self, cfg):
        super().__init__(cfg)
        self.signed_predicates_per_constraint_type = signed_predicates_per_constraint_type
        self.domain_axioms = domain_axioms
        self.mapper_class = AlfWorldMapper

        self.render = False

    def _initialize_env(self):
        return

    def reset(self, seed: Optional[int], data: Optional[Sample] = None):
        self.seed = seed
        self.unconstrained_problem = get_alfworld_problem(seed)

    def is_feasible_low_level(self, plan):
        return True  # , simulator_plan, nl_states

    def is_feasible_low_level_action(self, action):
        return True

    def set_domain_name(self):
        self.domain = "alfworld"

    def get_problem_and_plan_nl(self):
        domain_file, problem_file, plan_file = constrained_problem_files(
            self.data_samples_dir, self.seed
        )
        mapper = AlfWorldMapper(domain_file, problem_file, plan_file)

        return mapper.domain_nl(), mapper.problem_nl(), mapper.plan_nl()


@hydra.main(
    version_base=None, config_path=os.path.join(os.environ["LEXICON"], "cfg"), config_name="config"
)
def main(cfg: DictConfig):
    run_lexicon(cfg, AlfWorld)


if __name__ == "__main__":
    main()
