from sys import argv
from lexicon import run_lexicon
from domains.blocksworld.blocksworld import Blocksworld
from domains.babyai.babyai import BabyAI
from domains.logistics.logistics import Logistics
from domains.sokoban.sokoban import Sokoban
from omegaconf import DictConfig, OmegaConf


def get_verification_cfg(folder_no, data_no, llm):
    return {
        "mode": "verification",
        "folder_no": folder_no,
        "evaluation_data": [data_no],
        "llm": llm,
        "render": False,
        "few_shot_data": [],
        # 'logs_dir': '${root_dir}/logs',  # Uncomment if needed
    }


if __name__ == "__main__":
    domain_name = argv[1]
    folder_no = int(argv[2])
    data_no = int(argv[3])
    llm = argv[4]  # e.g., "deepseek", "o3", "gemini-2.5", "claude_37_sonnet"
    if domain_name == "blocksworld":
        env = Blocksworld
    elif domain_name == "babyai":
        env = BabyAI
    elif domain_name == "logistics":
        env = Logistics
    elif domain_name == "sokoban":
        env = Sokoban
    cfg_dict = get_verification_cfg(folder_no, data_no, llm)
    cfg = OmegaConf.create(cfg_dict)
    run_lexicon(cfg, env)
