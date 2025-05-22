# LexiCon: a Benchmark for Planning under Temporal Constraints in Natural Language 

The main funcionalities of the LexiCon simulator are:
 1. Constrained planning problem generation in natural language.
 2. Automated verification for LLM-generated plans.
 
## Installation
 1. Install conda on an Ubuntu machine.
 2. Clone our repository and move into its main directory.
 3. Create a conda enviroment with the dependencies in environment.yml with the following command:
    ``` conda env create --name lexiconenv --file=environment.yml ```
 4. Activate your new conda environment with: 
    ``` conda activate lexiconenv ```
 5. Make sure that the following packages are installed:  [`anthropic==0.51.0`
`dotmap==1.3.30` `gym==0.26.2` `gymnasium==1.0.0` `hydra-core==1.3.2`
`matplotlib==3.7.1` `minigrid==3.0.0` `numpy==2.2.6` `omegaconf==2.3.0`
`openai==1.81.0` `protobuf==6.31.0` `pyprover==0.6.2` `tqdm==4.67.1`
`unified_planning==1.2.0`]

All the instructions that follow require that you have the lexiconenv environment activated.

## Execution Scripts

 We provide two scripts that run the aforementioned main functionalities of LexiCon:

 1. generate_benchmark.py: 
  - Input:
    - a domain name (`blocksworld`, `babyai`, `logistics`, or `sokoban`),
    - an integer denoting the random seed for generating the first problem in the benchmark,
    - the number of problems to be generated, and
    - the number of constraints in each problem. 
  - Output:
    - a constrained problem for the domain (in both PDDL and NL), located in folder ```domains/{domain_name}/data/data_{constraints_no}/{seed_no}```

  - Execution steps:
    - Move into the root directory of this repository.
    - Construct a directory with the name `intermediate_sas`, which is a required folder for the `SymK` planner to store intermediate computations, with the following command:
      - ```mkdir intermediate_sas```
    - Run the following command (with appropriate argument values):     
      - ```python3 generate_benchmark.py {domain_name} {initial_seed} {problems_no} {constraints_no}```
      
  - Example executions:
    - ``` python3 generate_benchmark.py blocksworld 100 1 2 ```
      Starting from seed 100, construct a blocksworld problem with 2 constraints.
    - ``` python3  generate_benchmark.py logistics 50 3 4 ```
      Starting from seed 50, construct 3 logistics problems with 4 constraints each.

 1. verify_plan.py: 
  - Input:
    - a domain name,
    - a folder number (corresponding to the number of constraints in the generated problem),
    - a data number (corresponding to the seed used to generate the problem), and
    - an llm name (`deepseek`, `o3`, `gemini-2.5`, `claude_37_sonnet`), where using `deepseek` leads to an execution of R1.
  - Output:
    - an indication on whether the plan stored in ```domains/{domain_name}/data/data_{folder_no}/{data_no}/{llm}_plan``` is invalid, suboptimal or optimal.
     
  - Execution steps:
    - Move into the root directory of this repository.
    - Run the following command (with appropriate argument values):     
      - ```python3 verify_plan.py {domain_name} {folder_no} {data_no} {llm}```
     
  - Example executions (on pre-generated, packed LLM plans):
    - ``` python3 verify_plan.py babyai 1 1 o3 ```
      Verifies that the plan in the corresponding directory is optimal.
    - ``` python3 verify_plan.py babyai 3 1 o3 ```
      Verifies that the plan in the corresponding directory is invalid.
    - ``` python3 verify_plan.py blocksworld 5 1 o3 ```
      Verifies that the plan in the corresponding directory is suboptimal.
      
## Verified Kaggle Dataset
   [https://www.kaggle.com/datasets/periklismant/lexicon-benchmarks](https://www.kaggle.com/datasets/periklismant/lexicon-benchmarks).
   We include the verification report of the Croissant file in the root directory.

## Documentation
   This code is part of a paper submission in NeurIPS 2025. For instructions on reproducing the experiments in our paper using this repository, see Appendix C.3 in the supplementary material of our submission. 

## Feedback 
  For more information and feedback, do not hesitate sending us an [email](mailto:periklis.mantenoglou@oru.se) or adding an issue in this repository.
