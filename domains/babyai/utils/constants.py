from itertools import product

ALL_GOALS = [
    "goto_any",
    "goto_specific",
    "pickup_any",
    "pickup_specific",
    "unlock_any",
    "unlock_specific",
    "put_specific",
]

ALL_COLORS = ["red", "blue", "yellow", "green", "purple", "grey"]

objects = ["box", "ball"]
num_possible_objects = 5  # of a single type
variations = list([str(x) for x in range(1, num_possible_objects + 1)])
all_objects = list(product(ALL_COLORS, objects, variations))

num_possible_keys = 0  # of a single type
variations = list([str(x) for x in range(1, num_possible_keys + 1)])
all_objects.extend(list(product(ALL_COLORS, ["key"], variations)))
ALL_OBJECTS = ["_".join(elem) for elem in all_objects]

all_doors = product(ALL_COLORS, ["door"], variations)
ALL_DOORS = ["_".join(elem) for elem in all_doors]

ALL_ROOMS = ["room_1", "room_2", "room_3", "room_4"]
ADJ_ROOMS = {
    "room_1": ["room_2", "room_3"],
    "room_2": ["room_1", "room_4"],
    "room_3": ["room_1", "room_4"],
    "room_4": ["room_2", "room_3"],
}

room_combinations = []
for k, v in ADJ_ROOMS.items():
    room_combinations.extend(list(product([k], v)))

# TODO: add unblock
object_based_action_signatures = {"gotoobject ?o", "pick ?o", "drop ?o"}
door_based_action_signatures = {"toggle ?d", "gotodoor ?d"}
room_based_action_signatures = {"gotoroom ?r"}
argless_action = {"gotoempty"}

ground_object_actions = []
ground_door_actions = []
ground_room_actions = []

for action in object_based_action_signatures:
    for obj in ALL_OBJECTS:
        ground_action = action.replace("?o", obj)
        ground_object_actions.append(ground_action)

for room in ALL_ROOMS:
    for action in room_based_action_signatures:
        ground_action = action.replace("?r", room)
        ground_room_actions.append(ground_action)

for action in door_based_action_signatures:
    for door in ALL_DOORS:
        ground_action = action.replace("?d", door)
        ground_door_actions.append(ground_action)


# TODO: tune action space based on the data (train + generalization splits)
ALL_ACTIONS = []
ALL_ACTIONS.extend(ground_object_actions)
ALL_ACTIONS.extend(ground_door_actions)
ALL_ACTIONS.extend(ground_room_actions)
ALL_ACTIONS.extend(list(argless_action))

# print("Possible actions: ")
# for action in ALL_ACTIONS:
#   print(action)
# print("Number of actions: " + str(len(ALL_ACTIONS)))
