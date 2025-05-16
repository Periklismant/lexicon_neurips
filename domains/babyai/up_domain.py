import unified_planning
from unified_planning.shortcuts import (
    UserType,
    Object,
    Fluent,
    BoolType,
    InstantaneousAction,
    Variable,
    Forall,
    Not,
    And,
    Or,
    Problem,
    Exists,
    OneshotPlanner,
    Always,
    Sometime,
    AtMostOnce,
    SometimeBefore,
    SometimeAfter,
    CompilationKind,
    Compiler,
    OptimalityGuarantee,
    get_environment,
    SequentialSimulator,
    PlanValidator,
)


def get_minigrid_problem(observation, goal_struct):
    problem = Problem("Minigrid")

    objectOrDoor = UserType("ObjectOrDoor")
    objectType = UserType("Object", father=objectOrDoor)
    doorType = UserType("Door", father=objectOrDoor)
    roomType = UserType("Room")
    colorType = UserType("Color")
    keyType = UserType("Key", father=objectType)
    ballType = UserType("Ball", father=objectType)
    boxType = UserType("Box", father=objectType)
    emptyType = UserType("Empty", father=objectType)

    types_dict = {
        "BallType": ballType,
        "KeyType": keyType,
        "BoxType": boxType,
        "EmptyType": emptyType,
        "door": doorType,
        "color": colorType,
        "key": keyType,
        "box": boxType,
        "ball": ballType,
    }

    agentInRoom = Fluent("agentInRoom", BoolType(), room=roomType)
    objectInRoom = Fluent("objectInRoom", BoolType(), obj=objectType, room=roomType)
    objectColor = Fluent("objectColor", BoolType(), objectOrDoor=objectOrDoor, color=colorType)
    at = Fluent("at", BoolType(), objectOrDoor=objectOrDoor)
    carrying = Fluent("carrying", BoolType(), obj=objectType)
    locked = Fluent("locked", BoolType(), door=doorType)
    adjacentRooms = Fluent(
        "adjacentRooms", BoolType(), room1=roomType, room2=roomType, door=doorType
    )
    blocked = Fluent("blocked", BoolType(), door=doorType, obj=objectType, room=roomType)
    visited = Fluent("visited", BoolType(), room=roomType)
    emptyHands = Fluent("emptyHands", BoolType())

    problem.add_fluent(agentInRoom, default_initial_value=False)
    problem.add_fluent(objectInRoom, default_initial_value=False)
    problem.add_fluent(objectColor, default_initial_value=False)
    problem.add_fluent(at, default_initial_value=False)
    problem.add_fluent(carrying, default_initial_value=False)
    problem.add_fluent(locked, default_initial_value=False)
    problem.add_fluent(adjacentRooms, default_initial_value=False)
    problem.add_fluent(blocked, default_initial_value=False)
    problem.add_fluent(visited, default_initial_value=False)
    problem.add_fluent(emptyHands, default_initial_value=False)

    empty = Object("empty", emptyType)

    problem.add_object(empty)

    o = Variable("o", objectType)
    d = Variable("d", doorType)

    gotoObject = InstantaneousAction("gotoObject", obj=objectType, room=roomType)
    obj = gotoObject.obj
    room = gotoObject.room
    gotoObject.add_precondition(objectInRoom(obj, room))
    gotoObject.add_precondition(agentInRoom(room))
    gotoObject.add_effect(at(o), False, condition=at(o), forall=[o])
    gotoObject.add_effect(at(d), False, condition=at(d), forall=[d])
    gotoObject.add_effect(at(obj), True)

    gotoEmpty = InstantaneousAction("gotoEmpty")
    gotoEmpty.add_effect(at(o), False, condition=at(o), forall=[o])
    gotoEmpty.add_effect(at(d), False, condition=at(d), forall=[d])
    gotoEmpty.add_effect(at(empty), True)

    gotoDoor = InstantaneousAction("gotoDoor", door=doorType, room1=roomType, room2=roomType)
    door = gotoDoor.door
    room1 = gotoDoor.room1
    room2 = gotoDoor.room2
    gotoDoor.add_precondition(adjacentRooms(room1, room2, door))
    gotoDoor.add_precondition(agentInRoom(room1))
    gotoDoor.add_precondition(Forall(Not(blocked(door, o, room1)), o))
    gotoDoor.add_effect(at(o), False, condition=at(o), forall=[o])
    gotoDoor.add_effect(at(d), False, condition=at(d), forall=[d])
    gotoDoor.add_effect(at(door), True)

    gotoRoom = InstantaneousAction("gotoRoom", room1=roomType, room2=roomType, door=doorType)
    room1 = gotoRoom.room1
    room2 = gotoRoom.room2
    door = gotoRoom.door
    gotoRoom.add_precondition(agentInRoom(room1))
    gotoRoom.add_precondition(adjacentRooms(room1, room2, door))
    gotoRoom.add_precondition(Not(locked(door)))
    gotoRoom.add_effect(agentInRoom(room1), False)
    gotoRoom.add_effect(agentInRoom(room2), True)
    gotoRoom.add_effect(visited(room2), True)
    gotoRoom.add_effect(at(o), False, condition=at(o), forall=[o])
    gotoRoom.add_effect(at(d), False, condition=at(d), forall=[d])

    pick = InstantaneousAction("pick", obj=objectType, room=roomType)
    obj = pick.obj
    room = pick.room
    pick.add_precondition(agentInRoom(room))
    pick.add_precondition(objectInRoom(obj, room))
    pick.add_precondition(at(obj))
    pick.add_precondition(emptyHands)
    pick.add_effect(at(obj), False)
    pick.add_effect(emptyHands, False)
    pick.add_effect(carrying(obj), True)
    pick.add_effect(objectInRoom(obj, room), False)
    pick.add_effect(blocked(d, obj, room), False, condition=blocked(d, obj, room), forall=[d])

    drop = InstantaneousAction("drop", obj=objectType, room=roomType)
    obj = drop.obj
    room = drop.room
    drop.add_precondition(agentInRoom(room))
    drop.add_precondition(carrying(obj))
    drop.add_precondition(Not(emptyHands))
    drop.add_precondition(at(empty))
    drop.add_effect(carrying(obj), False)
    drop.add_effect(at(obj), True)
    drop.add_effect(at(empty), False)
    drop.add_effect(emptyHands, True)
    drop.add_effect(objectInRoom(obj, room), True)

    toggle = InstantaneousAction("toggle", door=doorType)
    door = toggle.door
    toggle.add_precondition(at(door))
    toggle.add_effect(locked(door), True, condition=Not(locked(door)))
    toggle.add_effect(locked(door), False, condition=locked(door))

    problem.add_actions([gotoObject, gotoEmpty, gotoDoor, gotoRoom, pick, drop, toggle])

    objects = []
    for obj, obj_type_str in observation["object_types"]:
        if obj != "empty":
            obj_type = types_dict[obj_type_str]
            objects.append(Object(obj, obj_type))

    doors = []
    for door in observation["doors"]:
        doors.append(Object(door, doorType))

    rooms = []
    for room in observation["rooms"]:
        rooms.append(Object(room, roomType))

    colors = []
    for color in observation["ctypes"]:
        colors.append(Object(color, colorType))

    all_entities = objects + doors + rooms + colors

    problem.add_objects(all_entities)

    def object_of_str(obj_str):
        for entity in all_entities:
            if entity.name == obj_str:
                return entity
        print(f"{obj_str} is not an object of the domain")
        exit(1)

    def color_of_str(color_str):
        color_str = color_str.title() + "Type"
        for color in colors:
            if color.name == color_str:
                return color
        print(f"{color_str} is not a color of the domain")
        exit(1)

    agentRoom = object_of_str(observation["agent_room"])

    problem.set_initial_value(agentInRoom(agentRoom), True)

    for obj_str, room_str in observation["object_in_rooms"]:
        problem.set_initial_value(
            objectInRoom(object_of_str(obj_str), object_of_str(room_str)), True
        )

    for obj_str, obj_color in observation["object_colors"]:
        problem.set_initial_value(
            objectColor(object_of_str(obj_str), object_of_str(obj_color)), True
        )

    problem.set_initial_value(emptyHands(), True)

    for door in doors:
        problem.set_initial_value(locked(door), True)

    for room1, room2, door in observation["all_adjacent_rooms"]:
        problem.set_initial_value(
            adjacentRooms(object_of_str(room1), object_of_str(room2), object_of_str(door)), True
        )

    for room in observation["visited"]:
        problem.set_initial_value(visited(object_of_str(room)), True)

    def get_goal(goal_struct):
        task = goal_struct.task
        color = color_of_str(goal_struct.color)
        type = types_dict[goal_struct.type]
        if task == "goto":
            var = Variable("v", type)
            if goal_struct.source_room is None:
                return Exists(And(objectColor(var, color), at(var)), var)
            else:
                room = object_of_str(goal_struct.source_room)
                return Exists(
                    And(
                        objectColor(var, color), objectInRoom(var, room), agentInRoom(room), at(var)
                    ),
                    var,
                )
        if task == "pickup":
            var = Variable("v", type)
            if goal_struct.source_room is None:
                return Exists(And(objectColor(var, color), carrying(var)), var)
            else:
                room = object_of_str(goal_struct.source_room)
                return Exists(And(objectColor(var, color), carrying(var), agentInRoom(room)), var)
        if task == "put":
            var = Variable("v", type)
            room = object_of_str(goal_struct.dest_room)
            return Exists(
                And(
                    objectColor(var, color),
                    agentInRoom(room),
                    objectInRoom(var, room),
                    emptyHands(),
                    at(var),
                ),
                var,
            )
        if task == "open":
            door = Variable("d", doorType)
            if goal_struct.between_rooms is None:
                return Exists(And(objectColor(door, color), at(door), Not(locked(door))), door)
            else:
                room_str1, room_str2 = goal_struct.between_rooms
                room1 = object_of_str(room_str1)
                room2 = object_of_str(room_str2)
                return Exists(
                    And(
                        objectColor(door, color),
                        adjacentRooms(room1, room2, door),
                        at(door),
                        Not(locked(door)),
                    ),
                    door,
                )
        print(f"{task} is not a supported task.")
        exit(1)

    problem_goal = get_goal(goal_struct)
    problem.add_goal(problem_goal)

    problem.add_quality_metric(unified_planning.model.metrics.MinimizeSequentialPlanLength())

    return problem
