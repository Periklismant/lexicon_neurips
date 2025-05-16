import unified_planning

from unified_planning.shortcuts import (
    UserType,
    Object,
    Fluent,
    BoolType,
    InstantaneousAction,
    Variable,
    Forall,
    Not,
    And,
    Or,
    Problem,
    Exists,
    OneshotPlanner,
    Always,
    Sometime,
    AtMostOnce,
    SometimeBefore,
    SometimeAfter,
    CompilationKind,
    Compiler,
    OptimalityGuarantee,
    get_environment,
    SequentialSimulator,
    PlanValidator,
)
from compiler.lifted_tcore import LiftedTCORE

from utils.utils import ConstraintType, OperationType, SignType
from itertools import product
from typing import List, Dict
import time

get_environment().credits_stream = None

planner_name = "symk"


def add_constraints_to_problem(problem, list_of_pddl_constraints):

    lexicon_to_up_dict = {
        ConstraintType.ALWAYS: Always,
        ConstraintType.SOMETIME: Sometime,
        ConstraintType.AT_MOST_ONCE: AtMostOnce,
        ConstraintType.SOMETIME_BEFORE: SometimeBefore,
        ConstraintType.SOMETIME_AFTER: SometimeAfter,
        OperationType.AND_OP: And,
        OperationType.OR_OP: Or,
        SignType.NEG: Not,
    }

    def lexicon_to_up_literal(lit):
        up_predicate = problem.fluent(lit.predicate)
        up_arguments = []
        for arg in lit.arguments:
            up_arguments.append(problem.object(arg))
        return up_predicate(*up_arguments)

    def lexicon_to_up_formula(formula):
        literals = []
        for lit in formula.literals:
            if lit.sign == SignType.NEG:
                literals.append(Not(lexicon_to_up_literal(lit)))
            else:
                literals.append(lexicon_to_up_literal(lit))
        return lexicon_to_up_dict[formula.operation](*literals)

    for pddl_constraint in list_of_pddl_constraints:
        if pddl_constraint.type in [
            ConstraintType.ALWAYS,
            ConstraintType.SOMETIME,
            ConstraintType.AT_MOST_ONCE,
        ]:
            pddl_formula = pddl_constraint.args[0]
            formula = lexicon_to_up_formula(pddl_formula)
            problem.add_trajectory_constraint(
                lexicon_to_up_dict[pddl_constraint.type](formula)
            )
        else:
            pddl_formula1, pddl_formula2 = pddl_constraint.args
            formula1 = lexicon_to_up_formula(pddl_formula1)
            formula2 = lexicon_to_up_formula(pddl_formula2)
            problem.add_trajectory_constraint(
                lexicon_to_up_dict[pddl_constraint.type](formula1, formula2)
            )
    return problem


def solve_unconstrained(problem):
    global planner_name
    try:
        with OneshotPlanner(
            name=planner_name, optimality_guarantee=OptimalityGuarantee.SOLVED_OPTIMALLY
        ) as planner:
            # planner_start_time = time.time()
            res = planner.solve(problem)
            # print(f"Planning time: {time.time() - planner_start_time}")
            # print(f"Plan length: {len(res.plan.actions)}")
        return res
    except Exception as e:
        raise RuntimeError(
            f"Error while solving unconstrained planning problem: {e}"
        ) from e


def compile_lifted_tcore(problem):
    try:
        with LiftedTCORE() as tcr_compiler:
            tcr_result = tcr_compiler.compile(
                problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
            )
        return tcr_result
    except Exception as e:
        raise RuntimeError(
            f"Error while compiling constrained planning problem: {e}"
        ) from e


def solve_compiled_lifted(compiled_problem):
    global planner_name
    try:
        with OneshotPlanner(
            name=planner_name, optimality_guarantee=OptimalityGuarantee.SOLVED_OPTIMALLY
        ) as planner:
            res = planner.solve(compiled_problem)
            return res
    except Exception as e:
        raise RuntimeError(
            f"Error while solving constrained planning problem: {e}"
        ) from e


def compile_tcore(problem):
    try:
        with Compiler(name="up_trajectory_constraints_remover") as tcr_compiler:
            tcr_result = tcr_compiler.compile(
                problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
            )
        return tcr_result
    except Exception as e:
        raise RuntimeError(
            f"Error while compiling constrained planning problem: {e}"
        ) from e


def solve_compiled_grounded(tcore_result):
    global planner_name
    problem = tcore_result.problem
    try:
        with OneshotPlanner(
            name=planner_name, optimality_guarantee=OptimalityGuarantee.SOLVED_OPTIMALLY
        ) as planner:
            res = planner.solve(problem)
            if (
                res.status
                == unified_planning.engines.results.PlanGenerationResultStatus.SOLVED_OPTIMALLY
            ):
                lifted_plan = res.plan.replace_action_instances(
                    tcore_result.map_back_action_instance
                )
                return res, lifted_plan
            else:
                return res, None
    except Exception as e:
        raise RuntimeError(
            f"Error while solving constrained planning problem: {e}"
        ) from e


def simulate_high_level_plan(problem, plan):
    with SequentialSimulator(problem) as simulator:
        state = simulator.get_initial_state()
        state_changes = [(state, None)]
        for action in plan.actions:
            state = simulator.apply(state, action)
            state_changes.append((state, action))
        condensed_state_changes = []
        for state, action in state_changes:
            state._condense_state()
            true_fluent_state = [f for f, v in state._values.items() if v.is_true()]
            condensed_state_changes.append((true_fluent_state, action))
        return condensed_state_changes


def validate_high_level_plan(problem, plan):
    with PlanValidator(problem_kind=problem.kind) as validator:
        result = validator.validate(problem, plan)
        return result
