from utils.utils import ConstraintType, SignType, OperationType
from pyprover import expr

# since agentInRoom(r1) implies visited(r1), adding visited in the constraints does not extend their scope.
signed_predicates_per_constraint_type = {
    ConstraintType.ALWAYS: [
        ("locked", SignType.POS),
        ("agentInRoom", SignType.NEG),
    ],
    ConstraintType.SOMETIME: [
        ("at", SignType.POS),
        ("carrying", SignType.POS),
        ("agentInRoom", SignType.POS),
        ("objectInRoom", SignType.POS),
        ("locked", SignType.NEG),
        ("emptyHands", SignType.NEG),
    ],
    ConstraintType.AT_MOST_ONCE: [
        ("at", SignType.POS),
        ("emptyHands", SignType.POS),
        ("agentInRoom", SignType.POS),
    ],
    ConstraintType.SOMETIME_BEFORE: [
        ("agentInRoom", SignType.POS),
        ("objectInRoom", SignType.POS),
        ("at", SignType.POS),
        ("carrying", SignType.POS),
        ("locked", SignType.POS),
        ("locked", SignType.NEG),
        ("emptyHands", SignType.POS),
        ("emptyHands", SignType.NEG),
    ],
    ConstraintType.SOMETIME_AFTER: [
        ("agentInRoom", SignType.POS),
        ("objectInRoom", SignType.POS),
        ("at", SignType.POS),
        ("carrying", SignType.POS),
        ("locked", SignType.POS),
        ("locked", SignType.NEG),
        ("emptyHands", SignType.POS),
        ("emptyHands", SignType.NEG),
    ],
}


domain_axioms = [
    expr(r"A obj. Objectinroom(obj,r1) & Objectinroom(obj,r2) -> r1=r2"),
    expr(r"At(x) & At(y) -> x=y"),
    expr(r"Agentinroom(x) & Agentinroom(y) -> x=y"),
    expr(r"Emptyhands -> -(E y. Carrying(y))"),
    expr(r"At(x) -> -Carrying(x)"),
    expr(r"-Carrying(empty)"),
    expr(r"A x. (Carrying(x) -> -(E y. Objectinroom(x, y)))"),
    expr(r"Carrying(x) & Carrying(y) -> x=y"),
]
