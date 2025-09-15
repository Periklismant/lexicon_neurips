from utils.utils import ConstraintType, SignType, OperationType

# all_constraint_types defines the grammar of the logical formula that occurs with a trajectory constraint. For example (OperationType.AND_OP, 2), declares that the logical formula is a conjunction of two literals.
# signed_predicates_per_constraint_type defines the (signed) predicates of the domain that are allowed in each type of constraint.

from pyprover import expr, And

signed_predicates_per_constraint_type = {
    ConstraintType.ALWAYS: [
        ("objectAtLocation", SignType.NEG),
        # ("inReceptacleObject", SignType.NEG),
        ("holds", SignType.NEG),
    ],
    ConstraintType.SOMETIME: [
        ("atLocation", SignType.POS),
        ("objectAtLocation", SignType.POS),
        # ("inReceptacleObject", SignType.POS),
        ("holds", SignType.POS),
        # ("holdsAny", SignType.POS),
        # ("holdsAnyReceptacleObject", SignType.POS),
        ("checked", SignType.POS),
        # ("isClean", SignType.POS),
        # ("isHot", SignType.POS),
        # ("isCool", SignType.POS),
        # ("isOn", SignType.POS),
        # ("isToggled", SignType.POS),
        # ("sliced", SignType.POS),
    ],
    ConstraintType.AT_MOST_ONCE: [
        ("atLocation", SignType.POS),
        ("objectAtLocation", SignType.POS),
        # ("inReceptacleObject", SignType.POS),
        # ("holdsAny", SignType.POS),
        # ("holdsAnyReceptacleObject", SignType.POS),
        ("checked", SignType.POS),
        # ("isClean", SignType.POS),
        # ("isHot", SignType.POS),
        # ("isCool", SignType.POS),
        # ("isOn", SignType.POS),
        # ("isToggled", SignType.POS),
        # ("sliced", SignType.POS),
    ],
    ConstraintType.SOMETIME_BEFORE: [
        ("atLocation", SignType.POS),
        ("objectAtLocation", SignType.POS),
        # ("inReceptacleObject", SignType.POS),
        ("holds", SignType.POS),
        # ("holdsAny", SignType.POS),
        # ("holdsAnyReceptacleObject", SignType.POS),
        ("checked", SignType.POS),
        # ("isClean", SignType.POS),
        # ("isHot", SignType.POS),
        # ("isCool", SignType.POS),
        # ("isOn", SignType.POS),
        # ("isToggled", SignType.POS),
        # ("sliced", SignType.POS),
    ],
    ConstraintType.SOMETIME_AFTER: [
        ("atLocation", SignType.POS),
        ("objectAtLocation", SignType.POS),
        # ("inReceptacleObject", SignType.POS),
        ("holds", SignType.POS),
        # ("holdsAny", SignType.POS),
        # ("holdsAnyReceptacleObject", SignType.POS),
        ("checked", SignType.POS),
        # ("isClean", SignType.POS),
        # ("isHot", SignType.POS),
        # ("isCool", SignType.POS),
        # ("isOn", SignType.POS),
        # ("isToggled", SignType.POS),
        # ("sliced", SignType.POS),
    ],
}


domain_axioms = [
    expr(r"Atlocation(l1) & Atlocation(l2) -> l1=l2"),
    expr(r"A o. Objectatlocation(o,l1) & Objectatlocation(o,l2) -> l1=l2"),
    expr(r"A o. Inreceptacle(o,r1) & Inreceptacle(o,r2) -> r1=r2"),
    # expr(
    # r"Inreceptacleobject(o,r) -> Receptacletype(r,rtype) & Objecttype(o,otype) & Cancontain(rtype, otype)"
    # ),
    expr(r"A a. Holds(a,o1) & Holds(a,o2) -> o1=o2"),
    # expr(r"A o. -Cleanable(o) & Isclean(o) -> False"),
    # expr(r"A o. Ishot(o) -> Heatable(o)"),
    # expr(r"A o. -Coolable(o) -> -Iscool(o)"),
    # expr(r"A o. -Toggleable(o) -> -Ison(o)"),
    # expr(r"A o. -Toggleable(o) -> -Istoggled(o)"),
    # expr(r"A o. -Sliceable(o) -> -Issliced(o)"),
]
