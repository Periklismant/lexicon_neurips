# LexiCon: a Benchmark for Planning under Temporal Constraints in Natural Language 

The main funcionalities of the LexiCon simulator are:
 1. Constrained planning problem generation in natural language.
 2. Automated verification for LLM-generated plans.
 
## Installation:

 1. File environment.yml contains the dependencies of this python project. Install them via conda on Ubuntu with the following command:
    ``` conda env create --name envname --file=environment.yml ```
 2. Activate your new conda environment with: 
    ``` conda activate envname ```

## Execution Scripts:

 We provide two scripts that run the aforementioned main functionalities of LexiCon:

 1. generate_benchmark.py: 
  - Input: a domain name (blocksworld, babyai, logistics, or sokoban), an initial seed integer, the number of problems the user wants to generate and the number of constraints in those problems. 
  - Output: A constrained problem for the domain (in both PDDL and NL). This is located in folder "domains/{domain_name}/data_{constraints_no}/{seed_no}"

  - Example executions:
    - ``` python3 generate_benchmark.py blocksworld 100 1 2 ```
      Starting from seed 100, construct a blocksworld problem with 2 constraints.
    - ``` python3  generate_benchmark.py logistics 50 3 4 ```
      Starting from seed 50, construct 3 logistics problems with 4 constraints each.

 1. verify_plan.py: 
  - Input: a domain name, a folder number (corresponding to the number of constraints in the generated problem), a data number (corresponding to the seed used to generate the problem) and an llm name (deepseek, o3, gemini-2.5, claude_37_sonnet), where using deepseek leads to an execution of R1.
  - Output: An indication on whether the plan stored in "domains/{domain_name}/data_{folder_no}/{data_no}/{llm}_plan" is invalid, suboptimal or optimal.

  - Example executions (on pre-generated, packed LLM plans):
    - ``` python3 verify_plan.py babyai 1 1 o3 ```
      Verifies that the plan in the corresponding directory is optimal.
    - ``` python3 verify_plan.py babyai 3 1 o3 ```
      Verifies that the plan in the corresponding directory is invalid.
    - ``` python3 verify_plan.py blocksworld 5 1 o3 ```
      Verifies that the plan in the corresponding directory is suboptimal.
## Verified kaggle dataset

