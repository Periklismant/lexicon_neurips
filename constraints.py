import time
import os
from itertools import product

from utils.utils import (
    ConstraintType,
    delete_planner_outputs,
    SignType,
    sample_one,
)

from utils.logic_utils import (
    implies_any_direction,
    incompatible_formulas,
    unsatisfiable_formula,
    implies,
)

from unified_planning.model.fluent import get_all_fluent_exp

from unified_planning.shortcuts import Not, Or


def non_static_atoms(atoms, problem):
    return [atom for atom in atoms if atom.fluent().name not in problem.get_static_fluents()]


def ground_atoms_of_predicate(predicate, possible_arg_types, problem):
    ground_atoms = []
    if possible_arg_types is not None and not isinstance(possible_arg_types, list):
        possible_arg_types = [possible_arg_types]
    for f in problem.fluents:
        if f.name == predicate:
            for f_exp in get_all_fluent_exp(problem, f):
                # print(f"Fluent Exp: {f_exp}")
                # print(f"Arg Types: {arg_types}")
                # print()
                if possible_arg_types is None:
                    ground_atoms.append(f_exp)
                    continue
                for arg_types in possible_arg_types:
                    valid_types = True
                    for i in range(len(f_exp.args)):
                        arg = f_exp.args[i]
                        req_type = problem.user_type(arg_types[i])
                        # print(f"Argument: {arg} with type: {arg.type}")
                        isCompatible = req_type.is_compatible(arg.type)
                        # print(f"Is compatible with {arg}? {isCompatible}")
                        # print()
                        if not isCompatible:
                            valid_types = False
                            break
                    if valid_types:
                        ground_atoms.append(f_exp)
                        break
                # if valid_types:
                # ground_atoms.append(f_exp)
    # print(f"Ground Atoms: {ground_atoms}")
    return ground_atoms


def simplify_flat_exists(problem, expression):
    if expression.is_exists():
        vars = expression.variables()
        formula = expression.args[0]
        type_list = [v.type for v in vars]
        possible_objects = [list(problem.objects(t)) for t in type_list]
        ground_terms = []
        for o in product(*possible_objects):
            subs = dict(zip(vars, list(o)))
            ground_term = formula.substitute(subs)
            skip = False
            for literal in ground_term.args:
                if (
                    literal.is_fluent_exp()
                    and literal.fluent() in problem.get_static_fluents()
                    and problem.initial_values[literal].is_false()
                ):
                    skip = True
            if not skip:
                ground_terms.append(ground_term)
        return Or(*ground_terms)
    return expression


def always_compatible(always_constraint, other_constraint, domain_axioms):
    formula1 = always_constraint.args[0]
    # print(f"Constraint 1: Always({formula1})")
    if other_constraint.is_always():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Always({formula2})")
        if implies_any_direction(formula1, formula2, domain_axioms) or incompatible_formulas(
            formula1, formula2, domain_axioms
        ):
            return False
        return True
    if other_constraint.is_sometime():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Sometime({formula2})")
        if implies(formula1, formula2, domain_axioms) or incompatible_formulas(
            formula1, formula2, domain_axioms
        ):
            return False
        return True
    if other_constraint.is_at_most_once():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: AtMostOnce({formula2})")
        if implies(formula1, formula2, domain_axioms) or incompatible_formulas(
            formula1, formula2, domain_axioms
        ):
            return False
        return True
    if other_constraint.is_sometime_before():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeBefore({formula21}, {formula22})")
        if (
            implies(formula1, formula21, domain_axioms)
            or implies(formula1, formula22, domain_axioms)
            or incompatible_formulas(formula1, formula21, domain_axioms)
            or incompatible_formulas(formula1, formula22, domain_axioms)
        ):
            return False
        return True
    if other_constraint.is_sometime_after():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeAfter({formula21}, {formula22})")
        if (
            implies(formula1, formula22, domain_axioms)
            or incompatible_formulas(formula1, formula21, domain_axioms)
            or incompatible_formulas(formula1, formula22, domain_axioms)
        ):
            return False
        return True
    raise ValueError("{constraint2} is not a valid constraint")


def sometime_compatible(sometime_constraint, other_constraint, domain_axioms):
    formula1 = sometime_constraint.args[0]
    # print(f"Constraint 1: Sometime({formula1})")
    if other_constraint.is_always():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Always({formula2})")
        if implies(formula2, formula1, domain_axioms) or incompatible_formulas(
            formula1, formula2, domain_axioms
        ):
            return False
        return True
    if other_constraint.is_sometime():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Sometime({formula2})")
        # if implies_any_direction(formula1, formula2, domain_axioms):
        #    return False
        return True
    if other_constraint.is_at_most_once():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: AtMostOnce({formula2})")
        return True
    if other_constraint.is_sometime_before():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeBefore({formula21}, {formula22})")
        return True
    if other_constraint.is_sometime_after():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeAfter({formula21}, {formula22})")
        return True
    raise ValueError("{constraint2} is not a valid constraint")


def at_most_once_compatible(at_most_once_constraint, other_constraint, domain_axioms):
    formula1 = at_most_once_constraint.args[0]
    # print(f"Constraint 1: AtMostOnce({formula1})")
    if other_constraint.is_always():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Always({formula2})")
        if implies(formula2, formula1, domain_axioms) or incompatible_formulas(
            formula1, formula2, domain_axioms
        ):
            return False
        return True
    if other_constraint.is_sometime():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Sometime({formula2})")
        return True
    if other_constraint.is_at_most_once():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: AtMostOnce({formula2})")
        if implies_any_direction(formula1, formula2, domain_axioms):
            return False
        return True
    if other_constraint.is_sometime_before():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeBefore({formula21}, {formula22})")
        return True
    if other_constraint.is_sometime_after():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeAfter({formula21}, {formula22})")
        return True
    raise ValueError("{constraint2} is not a valid constraint")


def sometime_before_compatible(sometime_before_constraint, other_constraint, domain_axioms):
    formula11, formula12 = sometime_before_constraint.args
    # print(f"Constraint 1: SometimeBefore({formula11}, {formula12})")
    if other_constraint.is_always():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Always({formula2})")
        if (
            implies(formula2, formula11, domain_axioms)
            or implies(formula2, formula12, domain_axioms)
            or incompatible_formulas(formula2, formula11, domain_axioms)
            or incompatible_formulas(formula2, formula12, domain_axioms)
        ):
            return False
        return True
    if other_constraint.is_sometime():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Sometime({formula2})")
        return True
    if other_constraint.is_at_most_once():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: AtMostOnce({formula2})")
        return True
    if other_constraint.is_sometime_before():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeBefore({formula21}, {formula22})")
        if implies(formula12, formula21, domain_axioms) and implies(
            formula22, formula11, domain_axioms
        ):
            return False
        return True
    if other_constraint.is_sometime_after():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeAfter({formula21}, {formula22})")
        return True
    raise ValueError("{constraint2} is not a valid constraint")


def sometime_after_compatible(sometime_after_constraint, other_constraint, domain_axioms):
    formula11, formula12 = sometime_after_constraint.args
    # print(f"Constraint 1: SometimeAfter({formula11}, {formula12})")
    if other_constraint.is_always():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Always({formula2})")
        if (
            implies(formula2, formula12, domain_axioms)
            or incompatible_formulas(formula2, formula11, domain_axioms)
            or incompatible_formulas(formula2, formula12, domain_axioms)
        ):
            return False
        return True
    if other_constraint.is_sometime():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: Sometime({formula2})")
        return True
    if other_constraint.is_at_most_once():
        formula2 = other_constraint.args[0]
        # print(f"Constraint 2: AtMostOnce({formula2})")
        return True
    if other_constraint.is_sometime_before():
        formula21, formula22 = other_constraint.args
        # print(f"Constraint 2: SometimeBefore({formula21}, {formula22})")
        return True
    if other_constraint.is_sometime_after():
        formula21, formula22 = other_constraint.args
        ##print(f"Constraint 2: SometimeAfter({formula21}, {formula22})")
        if implies(formula12, formula21, domain_axioms) and implies(
            formula22, formula11, domain_axioms
        ):
            return False
        return True
    raise ValueError("{constraint2} is not a valid constraint")
    pass


def constraints_are_compatible(constraint1, constraint2, domain_axioms):
    if constraint1.is_always():
        return always_compatible(constraint1, constraint2, domain_axioms)
    if constraint1.is_sometime():
        return sometime_compatible(constraint1, constraint2, domain_axioms)
    if constraint1.is_at_most_once():
        return at_most_once_compatible(constraint1, constraint2, domain_axioms)
    if constraint1.is_sometime_before():
        return sometime_before_compatible(constraint1, constraint2, domain_axioms)
    if constraint1.is_sometime_after():
        return sometime_after_compatible(constraint1, constraint2, domain_axioms)
    raise ValueError("{constraint1} is not a valid constraint")


def holds_at_start(literal, problem):
    if literal.is_fluent_exp() and problem.initial_values[literal].is_true():
        return True
    if literal.is_not() and problem.initial_values[literal.args[0]].is_false():
        return True
    return False


def goal_implies_literal(goal, literal):

    def term_implies_literal(term, literal):
        for lit in term.args:
            if literal == lit:
                return True
        return False

    if goal.is_or():
        for term in goal.args:
            if term_implies_literal(term, literal):
                return True
        return False
    if goal.is_and():
        if term_implies_literal(goal, literal):
            return True
        return False
    return literal == goal

    return False


def literal_implies_goal(literal, goal, static_fluents):

    def literal_implies_term(literal, term):
        dynamic_literals = []
        for lit in term.args:
            if (
                lit.is_not()
                and lit.args[0].fluent() not in static_fluents
                or lit.is_fluent_exp()
                and lit.fluent() not in static_fluents
            ):
                dynamic_literals.append(lit)

        if len(dynamic_literals) == 1 and literal == dynamic_literals[0]:
            return True
        return False

    if goal.is_or():
        for term in goal.args:
            if literal_implies_term(literal, term):
                return True
        return False
    if goal.is_and():
        if literal_implies_term(literal, goal):
            return True
        return False
    return literal == goal


def bad_always_constraint(problem, goal, literal):
    """A literal should not be in an always constraint if:
         1. its complement is implied by the goal.
         2. it does not hold in the initial state.
    Note that 2. implies that the literal cannot be the same as the goal,
    since the goal does not hold in the initial state.
    """

    def term_contains_complement(term, literal):
        for lit in term.args:
            if lit == Not(literal):
                return True
        return False

    if not holds_at_start(literal, problem):
        return True
    if goal.is_or():
        for term in goal.args:
            if term_contains_complement(term, literal) and holds_at_start(literal, problem):
                return True
        return False
    elif goal.is_and():  # i.e., there was one substitution
        if term_contains_complement(goal, literal) and holds_at_start(literal, problem):
            return True
        return False
    elif goal.is_not() or goal.is_fluent_exp():
        return goal == Not(literal)
    return False


def bad_sometime_constraint(problem, literal):
    return False


def bad_at_most_once_constraint(problem, literal):
    return False


def bad_sometime_before_constraint(problem, literal1, literal2):
    if literal1 == literal2:
        return True
    return False


def bad_sometime_after_constraint(problem, literal1, literal2):
    if literal1 == literal2:
        return True
    return False


def literals_are_compatible(literal1, literal2, domain_axioms):
    """If the domain axioms imply that Not(And(literal1, literal2)), then the literals are incompatible."""
    if literal1 == literal2 or literal1 == Not(literal2):
        return False
    return not incompatible_formulas(literal1, literal2, domain_axioms)


def literal_is_unsatisfiable(literal, domain_axioms):
    return unsatisfiable_formula(literal, domain_axioms)


def get_literal(ground_atom, sign):
    if sign == SignType.NEG:
        return Not(ground_atom)
    else:
        return ground_atom


def get_signed_ground_atom(literal):
    if literal.is_not():
        return Not(literal), SignType.NEG
    else:
        return literal, SignType.POS


def sample_literal_for_arity_one_constraint(
    constraint_type,
    problem,
    states,
    goal,
    static_fluents,
    signed_predicates_per_constraint_type,
    domain_axioms,
    verbose=False,
):

    if len(signed_predicates_per_constraint_type[constraint_type]) == 0:
        return None

    # print(constraint_type)
    for _ in range(0, 5):
        if constraint_type == ConstraintType.ALWAYS:
            predicate, sign, arg_types = (
                *sample_one(signed_predicates_per_constraint_type[ConstraintType.ALWAYS]),
                None,
            )[:3]
            ground_atom = sample_one(ground_atoms_of_predicate(predicate, arg_types, problem))
            literal = get_literal(ground_atom, sign)
            if (
                literal_implies_goal(literal, goal, static_fluents)
                or bad_always_constraint(problem, goal, literal)
                or literal_is_unsatisfiable(literal, domain_axioms)
            ):
                continue
            if sign == SignType.POS and not all(ground_atom in atom_set for atom_set in states):
                # possible_literals_per_constraint_type[ConstraintType.ALWAYS].add(literal)
                return literal
            if sign == SignType.NEG and any(ground_atom in atom_set for atom_set in states):
                # possible_literals_per_constraint_type[ConstraintType.ALWAYS].add(literal)
                return literal
        elif constraint_type == ConstraintType.SOMETIME:
            predicate, sign, arg_types = (
                *sample_one(signed_predicates_per_constraint_type[ConstraintType.SOMETIME]),
                None,
            )[:3]
            ground_atom = sample_one(ground_atoms_of_predicate(predicate, arg_types, problem))
            literal = get_literal(ground_atom, sign)
            if (
                literal_implies_goal(literal, goal, static_fluents)
                or goal_implies_literal(goal, literal)
                or bad_sometime_constraint(problem, literal)
                or literal_is_unsatisfiable(literal, domain_axioms)
            ):
                continue

            if sign == SignType.POS and not any(ground_atom in atom_set for atom_set in states):
                return literal
                # possible_literals_per_constraint_type[ConstraintType.SOMETIME].add(literal)
            elif sign == SignType.NEG and all(ground_atom in atom_set for atom_set in states):
                return literal
                # possible_literals_per_constraint_type[ConstraintType.SOMETIME].add(literal)

        elif constraint_type == ConstraintType.AT_MOST_ONCE:
            predicate, sign, arg_types = (
                *sample_one(signed_predicates_per_constraint_type[ConstraintType.AT_MOST_ONCE]),
                None,
            )[:3]
            ground_atom = sample_one(ground_atoms_of_predicate(predicate, arg_types, problem))
            literal = get_literal(ground_atom, sign)
            if (
                literal_implies_goal(literal, goal, static_fluents)
                or bad_at_most_once_constraint(problem, literal)
                or literal_is_unsatisfiable(literal, domain_axioms)
            ):
                continue
            happened_once = False
            happens_now = False
            for atoms in states:
                if ground_atom in atoms:
                    if happens_now:
                        continue
                    elif happened_once:
                        return literal
                    else:
                        happened_once = True
                        happens_now = True
                else:
                    happens_now = False
    return None


def literal_never_holds_in_states(literal, states):
    ground_atom, sign = get_signed_ground_atom(literal)
    if sign == SignType.POS:
        return all(ground_atom not in state for state in states)
    if sign == SignType.NEG:
        return all(ground_atom in state for state in states)


def sample_first_literal_for_arity_two_constraint(
    constraint_type,
    problem,
    states,
    goal,
    static_fluents,
    signed_predicates_per_constraint_type,
    domain_axioms,
):
    # print(constraint_type)
    for _ in range(0, 5):
        if constraint_type == ConstraintType.SOMETIME_BEFORE:
            predicate, sign, arg_types = (
                *sample_one(signed_predicates_per_constraint_type[ConstraintType.SOMETIME_BEFORE]),
                None,
            )[:3]
            ground_atom = sample_one(ground_atoms_of_predicate(predicate, arg_types, problem))
            literal = get_literal(ground_atom, sign)
            if (
                literal_implies_goal(literal, goal, static_fluents)
                or holds_at_start(literal, problem)
                or literal_never_holds_in_states(literal, states)
                or literal_is_unsatisfiable(literal, domain_axioms)
            ):
                continue
            return literal
        elif constraint_type == ConstraintType.SOMETIME_AFTER:
            predicate, sign, arg_types = (
                *sample_one(signed_predicates_per_constraint_type[ConstraintType.SOMETIME_AFTER]),
                None,
            )[:3]
            ground_atom = sample_one(ground_atoms_of_predicate(predicate, arg_types, problem))
            literal = get_literal(ground_atom, sign)
            if (
                literal_implies_goal(literal, goal, static_fluents)
                or goal_implies_literal(goal, literal)
                or ground_atom in states[len(states) - 1]
                or literal_never_holds_in_states(literal, states)
                or literal_is_unsatisfiable(literal, domain_axioms)
            ):
                continue
            return literal
    return None


def sample_second_literal_for_arity_two_constraint(
    constraint_type,
    first_literal,
    problem,
    states,
    goal,
    static_fluents,
    signed_predicates_per_constraint_type,
    domain_axioms,
):

    # print(constraint_type)
    ground_atom, sign = get_signed_ground_atom(first_literal)

    if constraint_type == ConstraintType.SOMETIME_BEFORE:

        earliest_state = None
        for ind, atoms in enumerate(states):
            if (ground_atom in atoms and sign == SignType.POS) or (
                ground_atom not in atoms and sign == SignType.NEG
            ):
                earliest_state = ind
                break

        if not earliest_state:
            return None

        for i in range(5):
            sampled_predicate, sampled_sign, sampled_arg_types = (
                *sample_one(signed_predicates_per_constraint_type[ConstraintType.SOMETIME_BEFORE]),
                None,
            )[:3]
            sampled_ground_atom = sample_one(
                ground_atoms_of_predicate(sampled_predicate, sampled_arg_types, problem)
            )
            sampled_literal = get_literal(sampled_ground_atom, sampled_sign)
            if (
                not literal_implies_goal(sampled_literal, goal, static_fluents)
                and not goal_implies_literal(goal, sampled_literal)
                and not bad_sometime_before_constraint(problem, first_literal, sampled_literal)
                and not literal_is_unsatisfiable(sampled_literal, domain_axioms)
            ):
                if sampled_sign == SignType.POS and not any(
                    sampled_ground_atom in atom_set for atom_set in states[:earliest_state]
                ):
                    return sampled_literal
                    # possible_literals_per_constraint_type[ConstraintType.SOMETIME_BEFORE][
                    # literal
                    # ].add(sampled_literal)
                elif sampled_sign == SignType.NEG and all(
                    sampled_ground_atom in atom_set for atom_set in states[:earliest_state]
                ):
                    # possible_literals_per_constraint_type[ConstraintType.SOMETIME_BEFORE][
                    # literal
                    # ].add(sampled_literal)
                    return sampled_literal
        return None

    elif constraint_type == ConstraintType.SOMETIME_AFTER:

        latest_state = None
        for ind, atoms in enumerate(reversed(states)):
            if (ground_atom in atoms and sign == SignType.POS) or (
                ground_atom not in atoms and sign == SignType.NEG
            ):
                latest_state = len(states) - ind - 1
                break
        if not latest_state:
            return None
        for _ in range(5):
            sampled_predicate, sampled_sign, sampled_arg_types = (
                *sample_one(signed_predicates_per_constraint_type[ConstraintType.SOMETIME_AFTER]),
                None,
            )[:3]
            sampled_ground_atom = sample_one(
                ground_atoms_of_predicate(sampled_predicate, sampled_arg_types, problem)
            )
            sampled_literal = get_literal(sampled_ground_atom, sampled_sign)
            if (
                # not any(sampled_ground_atom in atom_set for atom_set in states[latest_state:])
                not literal_implies_goal(first_literal, goal, static_fluents)
                and not bad_sometime_after_constraint(problem, first_literal, sampled_literal)
                and not literal_is_unsatisfiable(sampled_literal, domain_axioms)
            ):
                if sampled_sign == SignType.POS and not any(
                    sampled_ground_atom in atom_set for atom_set in states[latest_state:]
                ):
                    return sampled_literal
                    # possible_literals_per_constraint_type[ConstraintType.SOMETIME_AFTER][
                    #    literal
                    # ].add(sampled_literal)
                elif sampled_sign == SignType.NEG and all(
                    sampled_ground_atom in atom_set for atom_set in states[latest_state:]
                ):
                    return sampled_literal
                    # possible_literals_per_constraint_type[ConstraintType.SOMETIME_AFTER][
                    # literal
                    # ].add(sampled_literal)
        return None
