from sys import argv
from lexicon import run_lexicon
from domains.blocksworld.blocksworld import Blocksworld
from domains.babyai.babyai import BabyAI
from domains.logistics.logistics import Logistics
from domains.sokoban.sokoban import Sokoban
from omegaconf import DictConfig, OmegaConf


def get_generation_cfg(initial_seed, num_seeds, c):
    return {
        "mode": "generation",
        "initial_seed": initial_seed,
        "folder_no": 1,
        "num_seeds": num_seeds,
        "parallelize": False,
        # 'logs_dir': '${root_dir}/logs',  # Uncomment if needed
        "constraint_form": {
            "constraints_no": c,
            "constraint_types": {
                "always": {
                    "operations": ["and"],
                    "arguments_min": 1,
                    "arguments_max": 1,
                },
                "sometime": {
                    "operations": ["or", "and"],
                    "arguments_min": 1,
                    "arguments_max": 2,
                },
                "at_most_once": {
                    "operations": ["and"],
                    "arguments_min": 1,
                    "arguments_max": 1,
                },
                "sometime_before": {
                    "operations": ["or"],
                    "arguments_min": 1,
                    "arguments_max": 2,
                },
                "sometime_after": {
                    "operations": ["or"],  # use ['and'] if needed
                    "arguments_min": 1,
                    "arguments_max": 2,
                },
            },
        },
    }


if __name__ == "__main__":
    domain_name = argv[1]
    initial_seed = int(argv[2])
    num_seeds = int(argv[3])
    c = int(argv[4])
    if domain_name == "blocksworld":
        env = Blocksworld
    elif domain_name == "babyai":
        env = BabyAI
    elif domain_name == "logistics":
        env = Logistics
    elif domain_name == "sokoban":
        env = Sokoban
    cfg_dict = get_generation_cfg(initial_seed, num_seeds, c)
    cfg = OmegaConf.create(cfg_dict)
    run_lexicon(cfg, env)
