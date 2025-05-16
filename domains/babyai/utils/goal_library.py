from collections import defaultdict

from domains.babyai.utils.constants import ALL_GOALS

gdict = defaultdict()
for goal in ALL_GOALS:
    gdict[goal] = {"pddl": "", "templates": []}

gdict["goto_any"] = {
    "pddl": """
        (:goal
            (and
                (exists (?o - object)
                    (and
                        (objectType ?o {type}Type)
                        (objectColor ?o {color}Type)
                        (at ?o)
                    )
                )
            )
        )
    """,
    "templates": [
        "go to a {color} {type}",
        "visit a {color} {type}",
        "head to a {color} {type}",
        "move towards a {color} {type}.",
        "proceed to a {color} {type}",
        "make your way to a {color} {type}",
        "travel to a {color} {type}",
        "walk to a {color} {type}",
        "go towards a {color} {type}",
        "approach a {color} {type}",
        "reach a {color} {type}",
        "navigate to a {color} {type}",
        "find your way to a {color} {type}",
        "step towards a {color} {type}",
        "arrive at a {color} {type}",
        "head over to a {color} {type}",
        "make your way towards a {color} {type}",
        "get to a {color} {type}.",
    ],
    "rl_goal": "goto {color} {type}",
}

gdict["goto_specific"] = {
    "pddl": """
        (:goal
            (and
                (exists (?o - object)
                    (and
                        (objectType ?o {type}Type)
                        (objectColor ?o {color}Type)
                        (objectInRoom ?o {room})
                        (agentInRoom {room})
                        (at ?o)
                    )
                )
            )
        )
    """,
    "templates": [
        "go to the {color} {type} in {room}",
        "visit the {color} {type} in {room}",
        "head to the {color} {type} in {room}",
        "move towards the {color} {type} in {room}",
        "proceed to the {color} {type} in {room}",
        "make your way to the {color} {type} in {room}",
        "travel to the {color} {type} in {room}",
        "walk to the {color} {type} in {room}",
        "go towards the {color} {type} in {room}",
        "approach the {color} {type} in {room}",
        "reach the {color} {type} in {room}",
        "navigate to the {color} {type} in {room}",
        "find your way to the {color} {type} in {room}",
        "step towards the {color} {type} in {room}",
        "arrive at the {color} {type} in {room}",
        "head over to the {color} {type} in {room}",
        "make your way towards the {color} {type} in {room}",
        "get to the {color} {type} in {room}",
    ],
    "rl_goal": "goto {color} {type} {room}",
}

gdict["pickup_any"] = {
    "pddl": """
        (:goal
            (and
                (exists (?o - object)
                    (and
                        (objectType ?o {type}Type)
                        (objectColor ?o {color}Type)
                        (not (emptyHands))
                        (carrying ?o)
                    )
                )
            )
        )
    """,
    "templates": [
        "pick up a {color} {type}",
        "grab a {color} {type}",
        "take a {color} {type}",
        "collect a {color} {type}",
        "fetch a {color} {type}",
        "retrieve a {color} {type}",
        "get a {color} {type}",
        "snag a {color} {type}",
        "lift a {color} {type}",
        "acquire a {color} {type}",
        "gather a {color} {type}",
        "secure a {color} {type}",
        "seize a {color} {type}",
        "obtain a {color} {type}",
        "catch a {color} {type}",
        "pick a {color} {type}",
        "scoop up a {color} {type}",
        "take hold of a {color} {type}",
        "get hold of a {color} {type}",
        "take possession of a {color} {type}",
    ],
    "rl_goal": "pickup {color} {type}",
}

gdict["pickup_specific"] = {
    "pddl": """
        (:goal
            (and
                (exists (?o - object)
                    (and
                        (objectType ?o {type}Type)
                        (objectColor ?o {color}Type)
                        (not (emptyHands))
                        (carrying ?o)
                        (not (objectInRoom ?o {room}))
                        (agentInRoom {room})
                    )
                )
            )
        )
    """,
    "templates": [
        "pick up a {color} {type} from {room}",
        "grab a {color} {type} from {room}",
        "take a {color} {type} from {room}",
        "collect a {color} {type} from {room}",
        "fetch a {color} {type} from {room}",
        "retrieve a {color} {type} from {room}",
        "get a {color} {type} from {room}",
        "snag a {color} {type} from {room}",
        "lift a {color} {type} from {room}",
        "acquire a {color} {type} from {room}",
        "gather a {color} {type} from {room}",
        "secure a {color} {type} from {room}",
        "seize a {color} {type} from {room}",
        "obtain a {color} {type} from {room}",
        "catch a {color} {type} from {room}",
        "pick a {color} {type} from {room}",
        "scoop up a {color} {type} from {room}",
        "take hold of a {color} {type} from {room}",
        "get hold of a {color} {type} from {room}",
        "take possession of a {color} {type} from {room}",
    ],
    "rl_goal": "pickup {color} {type} {room}",
}

gdict["unlock_any"] = {
    "pddl": """
        (:goal
            (and
                (exists (?d - door)
                    (and
                        (objectColor ?d {color}Type)
                        (at ?d)
                        (not (locked ?d))
                    )
                )
            )
        )
    """,
    "templates": [
        "open a {color} door",
        "unlock a {color} door",
        "unlatch a {color} door",
        "access a {color} door",
        "gain entry through a {color} door",
        "open up a {color} door",
        "get through a {color} door",
        "go through a {color} door",
    ],
    "rl_goal": "open {color} {type}",
}

gdict["unlock_specific"] = {
    "pddl": """
        (:goal
            (and
                (exists (?d - door)
                    (and
                        (objectColor ?d {color}Type)
                        (adjacentRooms {room1} {room2} ?d)
                        (at ?d)
                        (not (locked ?d))
                    )
                )
            )
        )
    """,
    "templates": [
        "open a {color} door connecting {room1} and {room2}",
        "unlock a {color} door connecting {room1} and {room2}",
        "unlatch a {color} door connecting {room1} and {room2}",
        "enter through a {color} door connecting {room1} and {room2}",
        "access a {color} door connecting {room1} and {room2}",
        "gain entry through a {color} door connecting {room1} and {room2}",
        "push through a {color} door connecting {room1} and {room2}",
        "open up a {color} door connecting {room1} and {room2}",
        "get through a {color} door connecting {room1} and {room2}",
        "move through a {color} door connecting {room1} and {room2}",
        "go through a {color} door connecting {room1} and {room2}",
    ],
    "rl_goal": "open {color} {type} {room1} {room2}",
}

gdict["put_specific"] = {
    "pddl": """
        (:goal
            (and
                (exists (?o - object)
                    (and
                        (objectColor ?o {color}Type)
                        (objectType ?o {type}Type)
                        (agentInRoom {room})
                        (objectInRoom ?o {room})
                        (emptyHands)
                        (at ?o)
                    )
                )
            )
        )
    """,
    "templates": [
        "put a {color} {type} in {room}",
        "place a {color} {type} in {room}",
        "set a {color} {type} in {room}",
        "position a {color} {type} in {room}",
        "deposit a {color} {type} in {room}",
        "lay a {color} {type} in {room}",
        "drop a {color} {type} in {room}",
        "arrange a {color} {type} in {room}",
        "situate a {color} {type} in {room}",
        "leave a {color} {type} in {room}",
        "store a {color} {type} in {room}",
        "put down a {color} {type} in {room}",
        "position down a {color} {type} in {room}",
        "set down a {color} {type} in {room}",
        "place down a {color} {type} in {room}",
        "drop off a {color} {type} in {room}",
        "plant a {color} {type} in {room}",
    ],
    "rl_goal": "put {color} {type} {room}",
}

gdict["visit_all_rooms"] = {
    "pddl": """
        (:goal
            (and
                (forall (?r - room)
                    (and
                        (visited ?r)
                    )
                )
            )
        )
    """,
    "templates": [
        "visit all rooms",
        "go to all rooms",
        "check out all rooms",
        "explore all rooms",
        "tour all rooms",
        "head to all rooms",
        "inspect all rooms",
        "look into all rooms",
        "move through all rooms",
        "walk through all rooms",
        "travel to all rooms",
        "make your way to all rooms",
        "enter all rooms",
        "step into all rooms",
        "see all rooms",
        "go through all rooms",
        "navigate through all rooms",
        "pass through all rooms",
        "cover all rooms",
        "reach all rooms",
        "take a look at all rooms",
    ],
    "rl_goal": "visited all",
}

gdict["never_visit_specific_room"] = {
    "pddl": """
        (:goal
            (and
                (exists (?r1 - room)
                    (and
                        (exists (?d - door)
                            (and
                                (agentInRoom ?r1 )
                                (adjacentRooms ?r1 ?r2 ?d)
                                (not (visited {room2}))
                            )
                        )
                    )
                )
            )
        )
    """,
    "templates": [
        "avoid room {room2}",
        "do not go to room {room2}",
        "stay away from room {room2}",
        "never enter room {room2}",
        "keep out of room {room2}",
        "do not visit room {room2}",
        "steer clear of room {room2}",
        "stay clear of room {room2}",
        "never go near room {room2}",
        "do not set foot in room {room2}",
        "refrain from visiting room {room2}",
        "do not approach room {room2}",
        "keep away from room {room2}",
        "never step into room {room2}",
        "avoid entering room {room2}",
        "stay out of room {room2}",
        "do not access room {room2}",
        "never go to room {room2}",
        "do not step into room {room2}",
    ],
    "rl_goal": "never visited",
}
