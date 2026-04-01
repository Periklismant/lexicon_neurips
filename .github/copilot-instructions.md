## Quick orientation for AI coding agents

- **Purpose:** LexiCon generates constrained planning problems (PDDL + NL) and verifies LLM-produced plans. Key flows are dataset generation (`generate_benchmark.py`) and plan verification/evaluation (`verify_plan.py`, `lexicon.py`).

- **Setup (required):** follow `environment.yml`. Typical setup commands:

  ```bash
  conda env create --name lexiconenv --file=environment.yml
  conda activate lexiconenv
  ```

- **Important filesystem expectation:** before generation the repo expects an `intermediate_sas` directory used by the SymK planner; create it at repo root: `mkdir intermediate_sas`.

- **Run commands examples:**

  - Generate benchmark problems:

    ```bash
    python3 generate_benchmark.py blocksworld 100 1 2
    ```
    Output lands under `domains/{domain}/data/data_{constraints_no}/{seed_no}`.

  - Verify an LLM plan (checks validity / optimality):

    ```bash
    python3 verify_plan.py babyai 1 1 o3
    ```

- **Where the logic lives:**

  - Top-level coordinator: `lexicon.py` — main modes (`generation`, `verification`, evaluation loops). It assembles OmegaConf cfg, instantiates domain env classes, and calls generation / verification flows.
  - Domain interfaces: `domains/<domain>/up_domain.py` (env implementation) and `domains/<domain>/mapper.py` (NL↔PDDL translations). Inspect `domains/babyai/mapper.py` and `base_mapper.py` for concrete examples of `domain_nl`, `ground_action_nl`, and `fluent_exp_nl` methods.
  - Planner/compiler helpers: `up_utils.py` (wrappers around unified_planning, `compile_lifted_tcore`, `solve_unconstrained`, `simulate_high_level_plan`) and `compiler/lifted_tcore.py` (TCORE compiler integration).

- **LLM integration & names:** LLM adapters are referenced in `lexicon.py` and domain envs (uses `openai`, `anthropic`, `google.genai`). Common model names used in the code: `deepseek`, `o3`, `gemini-2.5`, `claude_37_sonnet`, `gpt-4.1`.

- **Data & artifacts conventions:**
  - Generated problems, compiled problems, plans, responses, and stats are stored under each domain's `data/data_{constraints_no}/{seed_no}` folder (see `utils.utils` helpers like `constrained_problem_files`, `get_sample_path`).
  - LLM outputs use filenames like `{model_name}_plan`, `{model_name}_response`, `{model_name}_stats` (see `lexicon.py`).

- **Testing / validation patterns:**
  - Plan validity is checked by simulating the compiled problem (`SequentialSimulator`) rather than a simple validator so that unsatisfied preconditions and unmet goals are inspectable (see `verify_llm_plan` in `lexicon.py`).
  - When parsing LLM plans, the code sometimes falls back to edit-distance parsing (`parse_plan_with_edit_distance`) if a strict parse fails.

- **Coding conventions / patterns to follow:**
  - Domain-specific behavior is implemented via `env_class(cfg)`; prefer adding domain-specific logic in `domains/<domain>/up_domain.py` and `domains/<domain>/mapper.py` instead of changing `lexicon.py`.
  - Use `utils.utils` helpers for file paths, logging and sample I/O (avoid duplicating path logic).
  - When adding LLM experiments, append model identifiers consistently as `{model}` or `{model}@{strategy}` (see `model_name@strategy` usage in `lexicon.py`).

- **Integration points to be careful with:**
  - Unified Planning / SymK planner: `up_utils.py` selects planner `symk` and expects `intermediate_sas` writable directory. Planner failures propagate as exceptions.
  - Compiler: `compiler/lifted_tcore.py` provides the trajectory-constraints remover — changes there require re-running compilation and could affect many domains.
  - LLM APIs: environment credentials and API clients (OpenAI, Anthropic, Google GenAI) are used in domain envs — check domain env `prompt_llm`/`parse_response` implementations.

- **Where to look for examples:**
  - `generate_benchmark.py` and `verify_plan.py` show typical CLI usage.
  - `domains/babyai/mapper.py` demonstrates NL mapping; use it as a template for new domains.
  - `up_utils.py` shows planner/compile/simulate helpers to reuse.

If anything here is unclear or you want me to include extra examples (e.g., a short walkthrough of adding a new domain or adding a new LLM), tell me which area to expand.
