from utils.utils import ConstraintType, SignType, OperationType

# all_constraint_types defines the grammar of the logical formula that occurs with a trajectory constraint. For example (OperationType.AND_OP, 2), declares that the logical formula is a conjunction of two literals.
# signed_predicates_per_constraint_type defines the (signed) predicates of the domain that are allowed in each type of constraint.

from pyprover import expr, And

signed_predicates_per_constraint_type = {
    ConstraintType.ALWAYS: [
        ("at", SignType.NEG, ("Package", "Location")),
    ],
    ConstraintType.SOMETIME: [
        ("at", SignType.POS, ("Package", "Location")),
        (
            "in",
            SignType.POS,
            [("Package", "Truck"), ("Package", "Airplane")],
        ),
    ],
    ConstraintType.AT_MOST_ONCE: [
        ("at", SignType.POS, ("Package", "Location")),
        (
            "in",
            SignType.POS,
            [("Package", "Truck"), ("Package", "Airplane")],
        ),
    ],
    ConstraintType.SOMETIME_BEFORE: [
        ("at", SignType.POS, ("Package", "Location")),
    ],
    ConstraintType.SOMETIME_AFTER: [
        ("at", SignType.POS, ("Package", "Location")),
    ],
}


domain_axioms = [
    # expr(r"A x. A y. ((In(x,y) | At(x,y)) -> ~(E z. (~(y=z) & (In(x,z) | At(x,y)))))"),
    expr(r"A x. A y. In(p1,x) -> ~At(p1,y)"),
    expr(r"A x. A y. In(p2,x) -> ~At(p2,y)"),
    expr(r"A x. A y. At(p1,x) -> ~In(p1,y)"),
    expr(r"A x. A y. At(p2,x) -> ~In(p2,y)"),
    expr(r"A x. A y. In(p1,x) & In(p1,y) -> x=y"),
    expr(r"A x. A y. In(p2,x) & In(p2,y) -> x=y"),
    expr(r"A x. A y. At(p1,x) & At(p1,y) -> x=y"),
    expr(r"A x. A y. At(p2,x) & At(p2,y) -> x=y"),
    # expr(r"E x. In(p2,x) -> ~(E y. (~(y=x) & In(p2,y)))"),
    # expr(r"E x. At(p1,x) -> ~(E y. (~(y=x) & At(p1,y)))"),
    # expr(r"E x. At(p2,x) -> ~(E y. (~(y=x) & At(p2,y)))"),
    # expr(r"((In(p1,y) | At(p1,y)) -> ~(E z. (~(y=z) & (In(x,z) | At(x,y)))))"),
    # expr(r"A x. A y. (At(x,y) -> ~(E z. (~(y=z) & At(x,z)))"),
    # expr(r"A x. At(x,y) & At(x,z) -> y=z"),
    # expr(r"A x. At(x,y) -> ~In(x,z)"),
    # expr(r"A x. In(x,y) -> ~At(x,z)"),
]
