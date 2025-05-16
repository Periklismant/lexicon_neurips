from pyprover import (
    Or,
    And,
    Not,
    Pred,
    expr,
    Atom,
    Prop,
    Term,
    Var,
    Exists,
    proves,
    Bot,
    Implies,
    Top,
)
import time


def fluent_str_upper(fluent):
    """In pyprover, fluents start with an upper-case letter."""

    def get_nary_expression_string(op: str, args) -> str:
        p = []
        if len(args) > 0:
            p.append("(")
            p.append(str(args[0]))
            for x in args[1:]:
                p.append(op)
                p.append(str(x).lower())
            p.append(")")
        return "".join(p)

    return fluent.fluent().name.capitalize() + get_nary_expression_string(", ", fluent.args)


def up_formula_to_pyprover(formula):
    if formula.is_exists():
        return Exists(Var(formula.variables()[0].name), up_formula_to_pyprover(formula.args[0]))
    if formula.is_or():
        return Or(*[up_formula_to_pyprover(arg) for arg in formula.args])
    if formula.is_and():
        return And(*[up_formula_to_pyprover(arg) for arg in formula.args])
    if formula.is_not():
        return Not(up_formula_to_pyprover(formula.args[0]))
    if formula.is_fluent_exp():
        return expr(fluent_str_upper(formula))
    raise ValueError(f"Formula {formula} is not a valid type.")


def implies_any_direction(up_formula1, up_formula2, domain_axioms):
    formula1 = up_formula_to_pyprover(up_formula1)
    formula2 = up_formula_to_pyprover(up_formula2)
    # print(f"Testing implies_any_direction({formula1}, {formula2}")
    # print("... with no axiom.")
    # start_time = time.time()
    res = proves(Top(), Implies(formula1, formula2)) or proves(Top(), Implies(formula2, formula1))
    # print(f"Result: {res}. Time: {time.time() - start_time}")
    if res:
        return True
    for domain_axiom in domain_axioms:
        # print(domain_axiom)
        # start_time = time.time()
        res = proves(domain_axiom, Implies(formula1, formula2)) or proves(
            domain_axiom, Implies(formula2, formula1)
        )
        # print(f"Result: {res}. Time: {time.time() - start_time}")
        if res:
            return True
    return False


def implies(up_formula1, up_formula2, domain_axioms):
    formula1 = up_formula_to_pyprover(up_formula1)
    formula2 = up_formula_to_pyprover(up_formula2)
    # print(f"Testing implies({formula1}, {formula2}")
    # print("... with no axiom.")
    # start_time = time.time()
    res = proves(Top(), Implies(formula1, formula2))
    # print(f"Result: {res}. Time: {time.time() - start_time}")
    if res:
        return True
    for domain_axiom in domain_axioms:
        # print(domain_axiom)
        # start_time = time.time()
        res = proves(domain_axiom, Implies(formula1, formula2))
        # print(f"Result: {res}. Time: {time.time() - start_time}")
        if res:
            return True
    return False


def incompatible_formulas(up_formula1, up_formula2, domain_axioms):
    formula1 = up_formula_to_pyprover(up_formula1)
    formula2 = up_formula_to_pyprover(up_formula2)
    # print(f"Testing incompatible_formulas({formula1}, {formula2}")
    # print("... with no axiom.")
    # start_time = time.time()
    res = proves(Top(), Not(And(formula1, formula2)))
    # print(f"Result: {res}. Time: {time.time() - start_time}")
    if res:
        return True
    for domain_axiom in domain_axioms:
        # print(f"... with axiom {domain_axiom}")
        # start_time = time.time()
        res = proves(domain_axiom, Not(And(formula1, formula2)))
        # print(f"Result: {res}. Time: {time.time() - start_time}")
        if res:
            return True
    return False


def unsatisfiable_formula(up_formula, domain_axioms):
    formula = up_formula_to_pyprover(up_formula)

    for domain_axiom in domain_axioms:
        # print(f"... with axiom {domain_axiom}")
        # start_time = time.time()
        res = proves(domain_axiom, Not(formula))
        # print(f"Result: {res}. Time: {time.time() - start_time}")
        if res:
            return True
    return False
