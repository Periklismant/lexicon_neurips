from utils.utils import ConstraintType, SignType, OperationType

# all_constraint_types defines the grammar of the logical formula that occurs with a trajectory constraint. For example (OperationType.AND_OP, 2), declares that the logical formula is a conjunction of two literals.
# signed_predicates_per_constraint_type defines the (signed) predicates of the domain that are allowed in each type of constraint.

from pyprover import expr, And

signed_predicates_per_constraint_type = {
    ConstraintType.ALWAYS: [
        ("ontable", SignType.NEG),
        ("on", SignType.NEG),
    ],
    ConstraintType.SOMETIME: [
        ("clear", SignType.POS),
        ("clear", SignType.NEG),
        ("ontable", SignType.POS),
        ("ontable", SignType.NEG),
        ("on", SignType.POS),
        ("on", SignType.NEG),
        ("holding", SignType.POS),
    ],
    ConstraintType.AT_MOST_ONCE: [
        ("ontable", SignType.POS),
        ("ontable", SignType.NEG),
        ("on", SignType.POS),
        ("on", SignType.NEG),
        ("holding", SignType.POS),
    ],
    ConstraintType.SOMETIME_BEFORE: [
        ("clear", SignType.POS),
        ("clear", SignType.NEG),
        ("ontable", SignType.POS),
        ("ontable", SignType.NEG),
        ("on", SignType.POS),
        ("on", SignType.NEG),
        ("holding", SignType.POS),
    ],
    ConstraintType.SOMETIME_AFTER: [
        ("clear", SignType.POS),
        ("clear", SignType.NEG),
        ("ontable", SignType.POS),
        ("ontable", SignType.NEG),
        ("on", SignType.POS),
        ("on", SignType.NEG),
        ("holding", SignType.POS),
    ],
}


fluent_constraints = {
    "unique_args": ["holding"],
    "key_arg": [("on", 1), ("on", 2)],
    "incompatible": [],
    "incompatible_same_arg": [(("ontable", 1), ("on", 1))],
}


domain_axioms = [
    expr(r"A x. On(y,x) & On(z,x) -> y=z"),
    expr(r"A x. On(x,y) & On(x,z) -> y=z"),
    expr(r"A x. -(On(x,x))"),
    expr(r"A x. Clear(x) -> -(E y. On(y, x))"),
    expr(r"A x. Ontable(x) -> -(E y. On(x,y))"),
    expr(r"A x. Holding(x) -> -(Ontable(x))"),
    expr(r"A x. Holding(x) -> -(E y. (On(x,y) | On(y,x)))"),
    expr(r"Handempty -> -(E x. Holding(x))"),
]

# Always("ontable", "x", "y")

# Domain constraints in Natural Language:
#
