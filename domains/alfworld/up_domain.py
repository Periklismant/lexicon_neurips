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
    Equals,
)
from utils.constants import (
    OBJECTS_AND_MOVABLES,
    RECEPTACLES,
    VAL_RECEPTACLE_OBJECTS,
    VAL_ACTION_OBJECTS,
    PICKUPABLES,
    MOVABLE_RECEPTACLES,
    OPENABLE,
    GOALS,
)
from unified_planning.io import PDDLReader

import unified_planning
import random
import sys


def get_alfworld_problem(seed, locationsNo=5, objectsNo=5, receptaclesNo=5):
    random.seed(seed)

    problem = Problem("alfred")

    # Types def
    checkableType = UserType("Checkable")
    objType = UserType("Obj", father=checkableType)
    agentType = UserType("Agent", father=checkableType)
    locationType = UserType("Location", father=checkableType)
    receptacleType = UserType("Receptacle", father=checkableType)
    rType = UserType("ReceptacleType")
    oType = UserType("ObjectType")

    # Constants def
    sinkbasinType = Object("sinkBasinType", rType)
    microwaveType = Object("microwaveType", rType)
    fridgeType = Object("fridgeType", rType)
    knifeType = Object("knifeType", oType)
    butterknifeType = Object("butterKnifeType", oType)

    problem.add_object(sinkbasinType)
    problem.add_object(microwaveType)
    problem.add_object(fridgeType)
    problem.add_object(knifeType)
    problem.add_object(butterknifeType)

    # Fluents def
    atLocation = Fluent("atLocation", BoolType(), a=agentType, l=locationType)
    receptacleAtLocation = Fluent(
        "receptacleAtLocation", BoolType(), r=receptacleType, l=locationType
    )
    objectAtLocation = Fluent("objectAtLocation", BoolType(), o=objType, l=locationType)
    openable = Fluent("openable", BoolType(), r=receptacleType)
    opened = Fluent("opened", BoolType(), r=receptacleType)
    inReceptacle = Fluent("inReceptacle", BoolType(), o=objType, r=receptacleType)
    isReceptacleObject = Fluent("isReceptacleObject", BoolType(), o=objType)
    inReceptacleObject = Fluent(
        "inReceptacleObject", BoolType(), innerObject=objType, outObject=objType
    )
    isReceptacleObjectFull = Fluent("isReceptacleObjectFull", BoolType(), o=objType)
    wasInReceptacle = Fluent("wasInReceptacle", BoolType(), o=objType, r=receptacleType)
    checked = Fluent("checked", BoolType(), c=checkableType)
    examined = Fluent("examined", BoolType(), l=locationType)
    receptacleTypeF = Fluent("receptacleType", BoolType(), r=receptacleType, rt=rType)
    canContain = Fluent("canContain", BoolType(), rt=rType, ot=oType)
    objectTypeF = Fluent("objectType", BoolType(), o=objType, t=oType)
    holds = Fluent("holds", BoolType(), a=agentType, o=objType)
    holdsAny = Fluent("holdsAny", BoolType(), a=agentType)
    holdsAnyReceptacleObject = Fluent("holdsAnyReceptacleObject", BoolType(), a=agentType)
    full = Fluent("full", BoolType(), r=receptacleType)
    isClean = Fluent("isClean", BoolType(), o=objType)
    cleanable = Fluent("cleanable", BoolType(), o=objType)
    isHot = Fluent("isHot", BoolType(), o=objType)
    heatable = Fluent("heatable", BoolType(), o=objType)
    isCool = Fluent("isCool", BoolType(), o=objType)
    coolable = Fluent("coolable", BoolType(), o=objType)
    pickupable = Fluent("pickupable", BoolType(), o=objType)
    moveable = Fluent("moveable", BoolType(), o=objType)
    toggleable = Fluent("toggleable", BoolType(), o=objType)
    isOn = Fluent("isOn", BoolType(), o=objType)
    isToggled = Fluent("isToggled", BoolType(), o=objType)
    sliceable = Fluent("sliceable", BoolType(), o=objType)
    isSliced = Fluent("isSliced", BoolType(), o=objType)

    problem.add_fluent(atLocation, default_initial_value=False)
    problem.add_fluent(receptacleAtLocation, default_initial_value=False)
    problem.add_fluent(objectAtLocation, default_initial_value=False)
    problem.add_fluent(openable, default_initial_value=False)
    problem.add_fluent(opened, default_initial_value=False)
    problem.add_fluent(inReceptacle, default_initial_value=False)
    problem.add_fluent(isReceptacleObject, default_initial_value=False)
    problem.add_fluent(inReceptacleObject, default_initial_value=False)
    problem.add_fluent(isReceptacleObjectFull, default_initial_value=False)
    problem.add_fluent(wasInReceptacle, default_initial_value=False)
    problem.add_fluent(checked, default_initial_value=False)
    problem.add_fluent(examined, default_initial_value=False)
    problem.add_fluent(receptacleTypeF, default_initial_value=False)
    problem.add_fluent(canContain, default_initial_value=False)
    problem.add_fluent(objectTypeF, default_initial_value=False)
    problem.add_fluent(holds, default_initial_value=False)
    problem.add_fluent(holdsAny, default_initial_value=False)
    problem.add_fluent(holdsAnyReceptacleObject, default_initial_value=False)
    problem.add_fluent(full, default_initial_value=False)
    problem.add_fluent(isClean, default_initial_value=False)
    problem.add_fluent(cleanable, default_initial_value=False)
    problem.add_fluent(isHot, default_initial_value=False)
    problem.add_fluent(heatable, default_initial_value=False)
    problem.add_fluent(isCool, default_initial_value=False)
    problem.add_fluent(coolable, default_initial_value=False)
    problem.add_fluent(pickupable, default_initial_value=False)
    problem.add_fluent(moveable, default_initial_value=False)
    problem.add_fluent(toggleable, default_initial_value=False)
    problem.add_fluent(isOn, default_initial_value=False)
    problem.add_fluent(isToggled, default_initial_value=False)
    problem.add_fluent(sliceable, default_initial_value=False)
    problem.add_fluent(isSliced, default_initial_value=False)

    look = InstantaneousAction("look", a=agentType, l=locationType)
    agent = look.a
    location = look.l
    look.add_precondition(atLocation(agent, location))
    look.add_effect(checked(location), True)

    inventory = InstantaneousAction("inventory", a=agentType)
    agent = inventory.a
    inventory.add_effect(checked(agent), True)

    locVar = Variable("l", locationType)
    examineReceptacle = InstantaneousAction("examineReceptacle", a=agentType, r=receptacleType)
    agent = examineReceptacle.a
    receptacle = examineReceptacle.r
    examineReceptacle.add_precondition(
        Exists(And(atLocation(agent, locVar), receptacleAtLocation(receptacle, locVar)), locVar)
    )
    examineReceptacle.add_effect(checked(receptacle), True)

    recVar = Variable("r", receptacleType)
    examineObject = InstantaneousAction("examineObject", a=agentType, o=objType)
    agent = examineObject.a
    obj = examineObject.o
    examineObject.add_precondition(
        Or(
            Exists(
                Exists(
                    And(
                        atLocation(agent, locVar),
                        receptacleAtLocation(recVar, locVar),
                        inReceptacle(obj, recVar),
                        Or(Not(openable(recVar)), opened(recVar)),
                    ),
                    recVar,
                ),
                locVar,
            ),
            holds(agent, obj),
        )
    )
    examineObject.add_effect(checked(obj), True)

    gotoLocation = InstantaneousAction(
        "goToLocation", a=agentType, lstart=locationType, lend=locationType  # , r=receptacleType
    )
    agent = gotoLocation.a
    location_start = gotoLocation.lstart
    location_end = gotoLocation.lend
    # receptacle = gotoLocation.r
    gotoLocation.add_precondition(
        And(atLocation(agent, location_start))
    )  # , receptacleAtLocation(receptacle, location_end))
    # )
    gotoLocation.add_effect(atLocation(agent, location_start), False)
    gotoLocation.add_effect(atLocation(agent, location_end), True)

    openObject = InstantaneousAction("openObject", a=agentType, l=locationType, r=receptacleType)
    agent = openObject.a
    location = openObject.l
    receptacle = openObject.r
    openObject.add_precondition(
        And(
            openable(receptacle),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            Not(opened(receptacle)),
        )
    )
    openObject.add_effect(opened(receptacle), True)
    openObject.add_effect(checked(receptacle), True)

    closeObject = InstantaneousAction("closeObject", a=agentType, l=locationType, r=receptacleType)
    agent = closeObject.a
    location = closeObject.l
    receptacle = closeObject.r
    closeObject.add_precondition(
        And(
            openable(receptacle),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            opened(receptacle),
        )
    )
    closeObject.add_effect(opened(receptacle), False)

    pickupObject = InstantaneousAction(
        "pickupObject", a=agentType, l=locationType, o=objType, r=receptacleType
    )
    agent = pickupObject.a
    location = pickupObject.l
    obj = pickupObject.o
    receptacle = pickupObject.r
    pickupObject.add_precondition(
        And(
            pickupable(obj),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            inReceptacle(obj, receptacle),
            Not(holdsAny(agent)),
            Or(Not(openable(receptacle)), opened(receptacle)),
        )
    )
    pickupObject.add_effect(inReceptacle(obj, receptacle), False)
    pickupObject.add_effect(holds(agent, obj), True)
    pickupObject.add_effect(holdsAny(agent), True)
    pickupObject.add_effect(objectAtLocation(obj, location), False)

    putObject = InstantaneousAction(
        "putObject", a=agentType, l=locationType, o=objType, r=receptacleType, ot=oType, rt=rType
    )
    agent = putObject.a
    location = putObject.l
    obj = putObject.o
    receptacle = putObject.r
    otype = putObject.ot
    rtype = putObject.rt
    putObject.add_precondition(
        And(
            holds(agent, obj),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            Or(Not(openable(receptacle)), opened(receptacle)),
            objectTypeF(obj, otype),
            receptacleTypeF(receptacle, rtype),
            canContain(rtype, otype),
        )
    )
    putObject.add_effect(inReceptacle(obj, receptacle), True)
    putObject.add_effect(objectAtLocation(obj, location), True)
    putObject.add_effect(holds(agent, obj), False)
    putObject.add_effect(holdsAny(agent), False)

    cleanObject = InstantaneousAction(
        "cleanObject", a=agentType, l=locationType, r=receptacleType, o=objType
    )
    agent = cleanObject.a
    location = cleanObject.l
    receptacle = cleanObject.r
    obj = cleanObject.o
    cleanObject.add_precondition(
        And(
            cleanable(obj),
            receptacleTypeF(receptacle, sinkbasinType),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            holds(agent, obj),
        )
    )
    cleanObject.add_effect(isClean(obj), True)

    heatObject = InstantaneousAction(
        "heatObject", a=agentType, l=locationType, r=receptacleType, o=objType
    )
    agent = heatObject.a
    location = heatObject.l
    receptacle = heatObject.r
    obj = heatObject.o
    heatObject.add_precondition(
        And(
            heatable(obj),
            receptacleTypeF(receptacle, microwaveType),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            holds(agent, obj),
        )
    )
    heatObject.add_effect(isHot(obj), True)
    heatObject.add_effect(isCool(obj), False)

    coolObject = InstantaneousAction(
        "coolObject", a=agentType, l=locationType, r=receptacleType, o=objType
    )
    agent = coolObject.a
    location = coolObject.l
    receptacle = coolObject.r
    obj = coolObject.o
    coolObject.add_precondition(
        And(
            coolable(obj),
            receptacleTypeF(receptacle, fridgeType),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            holds(agent, obj),
        )
    )
    coolObject.add_effect(isCool(obj), True)
    coolObject.add_effect(isHot(obj), False)

    toggleObject = InstantaneousAction(
        "toggleObject", a=agentType, l=locationType, o=objType, r=receptacleType
    )
    agent = toggleObject.a
    location = toggleObject.l
    obj = toggleObject.o
    receptacle = toggleObject.r
    toggleObject.add_precondition(
        And(
            toggleable(obj),
            atLocation(agent, location),
            receptacleAtLocation(receptacle, location),
            inReceptacle(obj, receptacle),
        )
    )
    toggleObject.add_effect(isOn(obj), False, condition=isOn(obj))
    toggleObject.add_effect(isOn(obj), True, condition=Not(isOn(obj)))
    toggleObject.add_effect(isToggled(obj), True)

    sliceObject = InstantaneousAction(
        "sliceObject", a=agentType, l=locationType, co=objType, ko=objType
    )
    agent = sliceObject.a
    location = sliceObject.l
    cobj = sliceObject.co
    kobj = sliceObject.ko
    sliceObject.add_precondition(
        And(
            sliceable(cobj),
            Or(objectTypeF(kobj, knifeType), objectTypeF(kobj, butterknifeType)),
            atLocation(agent, location),
            objectAtLocation(cobj, location),
            holds(agent, kobj),
        )
    )
    sliceObject.add_effect(isSliced(cobj), True)

    helpAction = InstantaneousAction("help", a=agentType)
    agent = helpAction.a
    helpAction.add_effect(checked(agent), True)

    problem.add_actions(
        [
            look,
            inventory,
            examineReceptacle,
            examineObject,
            gotoLocation,
            openObject,
            closeObject,
            pickupObject,
            putObject,
            cleanObject,
            heatObject,
            coolObject,
            toggleObject,
            sliceObject,
            helpAction,
        ]
    )

    def get_item_name(itemInst):
        return itemInst.name.split("_")[0]

    def get_item_type(itemInst, typesDict):
        item = get_item_name(itemInst)
        return typesDict[item]

    def get_type_name(itemType):
        return itemType.name[:-4]

    agents = [Object("agent1", agentType)]

    locations = []
    for i in range(1, locationsNo + 1):
        locations.append(Object(f"location{i}", locationType))

    receptacles = []
    receptacleTypesDict = dict()
    for i in range(1, receptaclesNo + 1):
        myReceptacle = random.choice(RECEPTACLES)
        myReceptacleInst = f"{myReceptacle}_{i}"
        if myReceptacle not in receptacleTypesDict:
            receptacleTypesDict[myReceptacle] = Object(f"{myReceptacle}Type", rType)
        receptacles.append(Object(myReceptacleInst, receptacleType))

    # Add microwave and fridge
    receptacles.append(Object(f"microwave_{receptaclesNo+1}", receptacleType))
    if "microwave" not in receptacleTypesDict:
        receptacleTypesDict["microwave"] = Object("microwaveType", rType)
    receptacles.append(Object(f"fridge_{receptaclesNo+2}", receptacleType))
    if "fridge" not in receptacleTypesDict:
        receptacleTypesDict["fridge"] = Object("fridgeType", rType)

    def isObjectPlacable(myobject):
        for receptacle in receptacles:
            if myObject in VAL_RECEPTACLE_OBJECTS[get_item_name(receptacle)]:
                return True
        return False

    receptacleTypes = list(receptacleTypesDict.values())
    ObjectsAndMovables = []
    objectTypesDict = dict()
    i = 1
    while i < objectsNo:
        while True:
            myObject = random.choice(OBJECTS_AND_MOVABLES)
            if isObjectPlacable(myObject):
                break
        myObjectInst = f"{myObject}_{i}"
        if myObject not in objectTypesDict:
            objectTypesDict[myObject] = Object(f"{myObject}Type", oType)
        ObjectsAndMovables.append(Object(myObjectInst, objType))
        i += 1

    while True:
        myObject = random.choice(MOVABLE_RECEPTACLES)
        if isObjectPlacable(myObject):
            break
    myObjectInst = f"{myObject}_{i}"
    if myObject not in objectTypesDict:
        objectTypesDict[myObject] = Object(f"{myObject}Type", oType)
    ObjectsAndMovables.append(Object(myObjectInst, objType))
    objectTypes = list(objectTypesDict.values())

    all_entities = (
        agents
        + locations
        + receptacles
        + [
            x
            for x in receptacleTypes
            if x != sinkbasinType and x != microwaveType and x != fridgeType
        ]
        + ObjectsAndMovables
        + [x for x in objectTypes if x != knifeType and x != butterknifeType]
    )

    problem.add_objects(all_entities)

    for receptacle in receptacles:
        myReceptacleType = get_item_type(receptacle, receptacleTypesDict)
        problem.set_initial_value(receptacleTypeF(receptacle, myReceptacleType), True)

    for obj in ObjectsAndMovables:
        myObjectType = get_item_type(obj, objectTypesDict)
        problem.set_initial_value(objectTypeF(obj, myObjectType), True)

    for receptacle in receptacles:
        rec = get_item_name(receptacle)
        things_it_can_contain = VAL_RECEPTACLE_OBJECTS[rec]
        for obj in ObjectsAndMovables:
            o = get_item_name(obj)
            if o in things_it_can_contain:
                problem.set_initial_value(
                    canContain(receptacleTypesDict[rec], objectTypesDict[o]), True
                )
    # print(OPENABLE)
    for obj in receptacles + ObjectsAndMovables:
        o = get_item_name(obj)
        if o in PICKUPABLES:
            problem.set_initial_value(pickupable(obj), True)
        if o in MOVABLE_RECEPTACLES:
            problem.set_initial_value(isReceptacleObject(obj), True)
        if o in VAL_ACTION_OBJECTS["cleanable"]:
            problem.set_initial_value(cleanable(obj), True)
        if o in VAL_ACTION_OBJECTS["heatable"]:
            problem.set_initial_value(heatable(obj), True)
        if o in VAL_ACTION_OBJECTS["coolable"]:
            problem.set_initial_value(coolable(obj), True)
        if o in VAL_ACTION_OBJECTS["toggleable"]:
            problem.set_initial_value(toggleable(obj), True)
        if o in VAL_ACTION_OBJECTS["sliceable"]:
            problem.set_initial_value(sliceable(obj), True)

    receptacleLocations = dict()
    for receptacle in receptacles:
        mylocation = random.choice(locations)
        receptacleLocations[receptacle] = mylocation
        problem.set_initial_value(receptacleAtLocation(receptacle, mylocation), True)

    objectsInReceptacle = dict()
    for obj in ObjectsAndMovables:
        while True:
            receptacle = random.choice(receptacles)
            rec = get_item_name(receptacle)
            o = get_item_name(obj)
            if o in VAL_RECEPTACLE_OBJECTS[rec]:
                break
        objectsInReceptacle[obj] = receptacle
        problem.set_initial_value(inReceptacle(obj, receptacle), True)

    for obj in ObjectsAndMovables:
        if obj in objectsInReceptacle:
            problem.set_initial_value(
                objectAtLocation(obj, receptacleLocations[objectsInReceptacle[obj]]), True
            )
        else:
            mylocation = random.choice(locations)
            problem.set_initial_value(objectAtLocation(obj, mylocation), True)

    agent_location = random.choice(locations)
    problem.set_initial_value(atLocation(agents[0], agent_location), True)

    def get_goal():
        goal = None
        while not goal:
            goalType = random.choice(GOALS)
            if goalType == "pick_and_place_simple":
                recVar = Variable("r", receptacleType)
                objVar = Variable("o", objType)

                myobjType = random.choice(objectTypes)
                myrecType = random.choice(receptacleTypes)

                o = get_type_name(myobjType)
                rec = get_type_name(myrecType)

                if o in VAL_RECEPTACLE_OBJECTS[rec]:
                    goal = Exists(
                        Exists(
                            And(
                                inReceptacle(objVar, recVar),
                                objectTypeF(objVar, myobjType),
                                receptacleTypeF(recVar, myrecType),
                            ),
                            objVar,
                        ),
                        recVar,
                    )
            if goalType == "pick_two_obj_and_place":
                recVar = Variable("r", receptacleType)
                obj1Var = Variable("o1", objType)
                obj2Var = Variable("o2", objType)
                myobj1Type = random.choice(objectTypes)
                myobj2Type = random.choice(objectTypes)
                myrecType = random.choice(receptacleTypes)
                o1 = get_type_name(myobj1Type)
                o2 = get_type_name(myobj2Type)
                rec = get_type_name(myrecType)

                if o1 in VAL_RECEPTACLE_OBJECTS[rec] and o2 in VAL_RECEPTACLE_OBJECTS[rec]:
                    goal = Exists(
                        Exists(
                            And(
                                inReceptacle(obj1Var, recVar),
                                objectTypeF(obj1Var, myobj1Type),
                                receptacleTypeF(recVar, myrecType),
                                Exists(
                                    And(
                                        Not(Equals(obj1Var, obj2Var)),
                                        objectTypeF(obj2Var, myobj2Type),
                                        receptacleTypeF(recVar, myrecType),
                                        inReceptacle(obj2Var, recVar),
                                    ),
                                    obj2Var,
                                ),
                            ),
                            obj1Var,
                        ),
                        recVar,
                    )

            if goalType == "look_at_obj_in_light":
                o1Var = Variable("o1", objType)
                o2Var = Variable("o2", objType)
                rVar = Variable("r", receptacleType)
                aVar = Variable("a", agentType)
                lVar = Variable("l", locationType)
                if Object("deskLampType", objType) in objectTypes:
                    objectTypeCondition = objectTypeF(o1Var, Object("deskLampType", objType))
                if Object("floorLampType", objType) in objectTypes:
                    objectTypeCondition = objectTypeF(o1Var, Object("floorLampType", objType))
                else:
                    continue
                myobjType = random.choice(objectTypes)
                goal = And(
                    Exists(
                        Exists(
                            Exists(
                                Exists(
                                    And(
                                        objectTypeCondition,
                                        toggleable(o1Var),
                                        isToggled(o1Var),
                                        receptacleAtLocation(rVar, lVar),
                                        atLocation(aVar, lVar),
                                        inReceptacle(o1Var, rVar),
                                    ),
                                    lVar,
                                ),
                                aVar,
                            ),
                            rVar,
                        ),
                        o1Var,
                    ),
                    Exists(
                        Exists(And(objectTypeF(o2Var, myobjType), holds(aVar, o2Var)), aVar), o2Var
                    ),
                )

            if goalType == "pick_heat_then_place_in_recep":
                recVar = Variable("r", receptacleType)
                objVar = Variable("o", objType)

                myobjType = random.choice(objectTypes)
                myrecType = random.choice(receptacleTypes)

                o = get_type_name(myobjType)
                rec = get_type_name(myrecType)

                if (
                    o in VAL_ACTION_OBJECTS["heatable"]
                    and o in VAL_RECEPTACLE_OBJECTS[rec]
                    and Object("microwaveType", rType) in receptacleTypes
                ):
                    goal = Exists(
                        Exists(
                            And(
                                heatable(objVar),
                                objectTypeF(objVar, myobjType),
                                receptacleTypeF(recVar, myrecType),
                                isHot(objVar),
                                inReceptacle(objVar, recVar),
                            ),
                            objVar,
                        ),
                        recVar,
                    )

            if goalType == "pick_cool_then_place_in_recep":
                recVar = Variable("r", receptacleType)
                objVar = Variable("o", objType)

                myobjType = random.choice(objectTypes)
                myrecType = random.choice(receptacleTypes)

                o = get_type_name(myobjType)
                rec = get_type_name(myrecType)

                if (
                    o in VAL_ACTION_OBJECTS["coolable"]
                    and o in VAL_RECEPTACLE_OBJECTS[rec]
                    and Object("fridgeType", rType) in receptacleTypes
                ):
                    goal = Exists(
                        Exists(
                            And(
                                coolable(objVar),
                                objectTypeF(objVar, myobjType),
                                receptacleTypeF(recVar, myrecType),
                                isCool(objVar),
                                inReceptacle(objVar, recVar),
                            ),
                            objVar,
                        ),
                        recVar,
                    )
            """
            if goalType == "pick_and_place_with_movable_recep":
                recVar = Variable("r", receptacleType)
                obj1Var = Variable("o1", objType)
                obj2Var = Variable("o2", objType)

                myobj1Type = random.choice(objectTypes)
                myobj2Type = random.choice(objectTypes)
                myrecType = random.choice(receptacleTypes)

                o1 = get_type_name(myobj1Type)
                o2 = get_type_name(myobj2Type)
                rec = get_type_name(myrecType)

                if (
                    o2 in VAL_RECEPTACLE_OBJECTS
                    and o1 in VAL_RECEPTACLE_OBJECTS[o2]
                    and o2 in VAL_RECEPTACLE_OBJECTS[rec]
                ):
                    goal = Exists(
                        And(
                            receptacleTypeF(recVar, myrecType),
                            Exists(
                                And(
                                    objectTypeF(obj1Var, myobj1Type),
                                    Exists(
                                        And(
                                            objectTypeF(obj2Var, myobj2Type),
                                            isReceptacleObject(obj2Var),
                                            inReceptacleObject(obj1Var, obj2Var),
                                            inReceptacle(obj2Var, recVar),
                                        ),
                                        obj2Var,
                                    ),
                                ),
                                obj1Var,
                            ),
                        ),
                        recVar,
                    )
            """
        return goal

    problem.add_goal(get_goal())
    problem.add_quality_metric(unified_planning.model.metrics.MinimizeSequentialPlanLength())

    return problem


if __name__ == "__main__":
    for i in range(0, 100):
        get_alfworld_problem(i)
