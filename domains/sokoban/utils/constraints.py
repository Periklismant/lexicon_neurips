from utils.utils import ConstraintType, SignType, OperationType

# all_constraint_types defines the grammar of the logical formula that occurs with a trajectory constraint. For example (OperationType.AND_OP, 2), declares that the logical formula is a conjunction of two literals.
# signed_predicates_per_constraint_type defines the (signed) predicates of the domain that are allowed in each type of constraint.

from pyprover import expr, And

signed_predicates_per_constraint_type = {
    ConstraintType.ALWAYS: [
        ("clear", SignType.POS),
        ("at", SignType.NEG),
    ],
    ConstraintType.SOMETIME: [
        ("clear", SignType.NEG),
        ("at", SignType.POS),
    ],
    ConstraintType.AT_MOST_ONCE: [
        ("clear", SignType.NEG),
        ("at", SignType.POS),
    ],
    ConstraintType.SOMETIME_BEFORE: [
        ("clear", SignType.NEG),
        ("at", SignType.POS),
    ],
    ConstraintType.SOMETIME_AFTER: [
        ("clear", SignType.NEG),
        ("at", SignType.POS),
    ],
}


domain_axioms = [
    expr(r"A x. At(x,l) & At(x, l2) -> l1=l2"),
    expr(r"A x. ((A y. (A d. (~Movedir(y,x,d)))) -> ~Clear(x))"),
    expr(r"A x. ((A y. (A d. (~Movedir(y,x,d)))) -> ~(E z. At(z, x)))"),
]
