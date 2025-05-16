import random
from collections import Counter

from domains.babyai.utils.constants import ALL_GOALS
from domains.babyai.utils.goal_library import gdict
from utils.utils import Goal


def objects_in_room_string(objects_in_room: list, target_room: str):
    # utility function that builds a NL room string from objects in the room
    objs_in_target_room = [
        " ".join(obj.split("_")[:2])
        for obj, room_id in objects_in_room
        if room_id == target_room
    ]
    # Count occurrences of each item
    item_counts = Counter(objs_in_target_room)
    # Format the output string
    formatted_list = []
    for item, count in item_counts.items():
        # Pluralize the item if the count is greater than 1
        if count > 1:
            formatted_item = f"{count} {item}s"
        else:
            formatted_item = f"{count} {item}"
        formatted_list.append(formatted_item)

    return "room containing " + ", ".join(formatted_list)


def get_goal_representation(goal_str) -> Goal:
    # map goal
    goal_parsed = goal_str.split(" ")
    if goal_parsed[0] == "goto":
        if len(goal_parsed) == 3:  # goto any
            goal = Goal(
                task="goto",
                color=goal_parsed[1],
                type=goal_parsed[2],
                source_room=None,
                dest_room=None,
                between_rooms=None,
            )
        else:
            # goto specific
            goal = Goal(
                task="goto",
                color=goal_parsed[1],
                type=goal_parsed[2],
                source_room=goal_parsed[3],
                dest_room=goal_parsed[3],
                between_rooms=None,
            )
    elif goal_parsed[0] == "pickup":
        if len(goal_parsed) == 3:
            # pickup any
            goal = Goal(
                task="pickup",
                color=goal_parsed[1],
                type=goal_parsed[2],
                source_room=None,
                dest_room=None,
                between_rooms=None,
            )
        else:
            # pickup specific
            goal = Goal(
                task="pickup",
                color=goal_parsed[1],
                type=goal_parsed[2],
                source_room=goal_parsed[3],
                dest_room=goal_parsed[3],
                between_rooms=None,
            )
    elif goal_parsed[0] == "put":
        assert len(goal_parsed) == 4
        # put specific
        goal = Goal(
            task="put",
            color=goal_parsed[1],
            type=goal_parsed[2],
            source_room=None,
            dest_room=goal_parsed[3],
            between_rooms=None,
        )
    elif goal_parsed[0] == "open":
        if len(goal_parsed) == 3:
            # unlock any
            goal = Goal(
                task="open",
                color=goal_parsed[1],
                type=goal_parsed[2],
                source_room=None,
                dest_room=None,
                between_rooms=None,
            )
        else:
            # unlock specific
            between_rooms = (goal_parsed[-2], goal_parsed[-1])
            goal = Goal(
                task="open",
                color=goal_parsed[1],
                type=goal_parsed[2],
                source_room=None,
                dest_room=None,
                between_rooms=between_rooms,
            )
    else:
        raise NotImplementedError

    return goal


def get_task_representations(observation, seed):
    random.seed(seed)
    room_independent_goals = ["goto_any", "pickup_any", "unlock_any"]
    single_room_based_goals = ["goto_specific", "pickup_specific", "put_specific"]
    multi_based_goals = ["unlock_specific"]
    # room2_based_goals = ['never_visit_specific_room']
    sampled_goal = random.sample(ALL_GOALS, 1)[0]
    room, room1, room2 = None, None, None
    room_task_str, room1_task_str, room2_task_str = None, None, None

    if sampled_goal in room_independent_goals:
        if sampled_goal == "unlock_any":
            target_object = random.sample(observation["doors"][1:], 1)[0]
        else:
            target_object = random.sample(observation["objects"][1:], 1)[0]
        # print('debug')
    elif sampled_goal in single_room_based_goals:
        if sampled_goal == "put_specific":
            # sample without replacement
            # therefore, pick and place rooms are different
            # the object should be put in a different room
            pick_room, put_room = random.sample(observation["rooms"], 2)
            assert (
                pick_room != put_room
            ), "\nSource and destination rooms should be different for put tasks.\n"
            objects_in_room = [
                object_name
                for (object_name, object_room) in observation["object_in_rooms"]
                if object_room == pick_room
            ]
            while len(objects_in_room) == 0:
                pick_room, put_room = random.sample(observation["rooms"], 2)
                objects_in_room = [
                    object_name
                    for (object_name, object_room) in observation["object_in_rooms"]
                    if object_room == pick_room
                ]
            target_object = random.sample(objects_in_room, 1)[0]
            room = put_room
        else:
            room = random.sample(observation["rooms"], 1)[0]
            objects_in_room = [
                object_name
                for (object_name, object_room) in observation["object_in_rooms"]
                if object_room == room
            ]
            # room_task_str = PddlGameState.objects_in_room_string(observation["object_in_rooms"], room)
            while room == observation["agent_room"] or len(objects_in_room) == 0:
                room = random.sample(observation["rooms"], 1)[0]
                objects_in_room = [
                    object_name
                    for (object_name, object_room) in observation["object_in_rooms"]
                    if object_room == room
                ]
            target_object = random.sample(objects_in_room, 1)[0]
        room_task_str = objects_in_room_string(observation["object_in_rooms"], room)
    else:  # multi room based goals
        room1, room2, target_object = random.sample(
            observation["all_adjacent_rooms"], 1
        )[0]
        room1_task_str = objects_in_room_string(observation["object_in_rooms"], room1)
        room2_task_str = objects_in_room_string(observation["object_in_rooms"], room2)

    target_color, target_type, _ = target_object.split("_")

    rl_goal_str = gdict[sampled_goal]["rl_goal"].format(
        type=target_type,
        color=target_color,
        room=room if sampled_goal in single_room_based_goals else "",
        room1=room1 if sampled_goal in multi_based_goals else "",
        room2=room2 if sampled_goal in multi_based_goals else "",
    )
    sampled_template = random.sample(gdict[sampled_goal]["templates"], 1)[0]
    nl_task = sampled_template.format(
        type=target_type,
        color=target_color,
        room=room_task_str if sampled_goal in single_room_based_goals else "",
        room1=room1_task_str if sampled_goal in multi_based_goals else "",
        room2=room2_task_str if sampled_goal in multi_based_goals else "",
    )
    rl_goal = get_goal_representation(rl_goal_str)
    return nl_task, rl_goal
