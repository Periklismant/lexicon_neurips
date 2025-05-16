from unified_planning.shortcuts import (
    UserType,
    Object,
    Fluent,
    FluentExp,
    BoolType,
    InstantaneousAction,
    Problem,
)
from unified_planning.io import PDDLReader

import unified_planning
import random
import re
import os


def get_logistics_problem(seed=1, cities_no=2, city_size=5, packages_no=2):
    airplanes_no = cities_no
    trucks_no = cities_no
    problem = Problem("Logistics")

    objType = UserType("Obj")
    truckType = UserType("Truck", father=objType)
    airplaneType = UserType("Airplane", father=objType)
    packageType = UserType("Package", father=objType)
    locationType = UserType("Location")
    airportType = UserType("Airport", father=locationType)
    cityType = UserType("City")

    at = Fluent("at", BoolType(), obj=objType, loc=locationType)
    inFluent = Fluent("in", BoolType(), obj1=objType, obj2=objType)
    inCity = Fluent("inCity", BoolType(), obj=locationType, city=cityType)

    problem.add_fluent(at, default_initial_value=False)
    problem.add_fluent(inFluent, default_initial_value=False)
    problem.add_fluent(inCity, default_initial_value=False)

    loadTruck = InstantaneousAction("loadTruck", obj=packageType, truck=truckType, loc=locationType)
    obj = loadTruck.obj
    truck = loadTruck.truck
    loc = loadTruck.loc
    loadTruck.add_precondition(at(truck, loc))
    loadTruck.add_precondition(at(obj, loc))
    loadTruck.add_effect(at(obj, loc), False)
    loadTruck.add_effect(inFluent(obj, truck), True)

    loadAirplane = InstantaneousAction(
        "loadAirplane", obj=packageType, airplane=airplaneType, loc=locationType
    )
    obj = loadAirplane.obj
    airplane = loadAirplane.airplane
    loc = loadAirplane.loc
    loadAirplane.add_precondition(at(obj, loc))
    loadAirplane.add_precondition(at(airplane, loc))
    loadAirplane.add_effect(at(obj, loc), False)
    loadAirplane.add_effect(inFluent(obj, airplane), True)

    unloadTruck = InstantaneousAction("unloadTruck", obj=objType, truck=truckType, loc=locationType)
    obj = unloadTruck.obj
    truck = unloadTruck.truck
    loc = unloadTruck.loc
    unloadTruck.add_precondition(at(truck, loc))
    unloadTruck.add_precondition(inFluent(obj, truck))
    unloadTruck.add_effect(inFluent(obj, truck), False)
    unloadTruck.add_effect(at(obj, loc), True)

    unloadAirplane = InstantaneousAction(
        "unloadAirplane", obj=objType, airplane=airplaneType, loc=locationType
    )
    obj = unloadAirplane.obj
    airplane = unloadAirplane.airplane
    loc = unloadAirplane.loc
    unloadAirplane.add_precondition(inFluent(obj, airplane))
    unloadAirplane.add_precondition(at(airplane, loc))
    unloadAirplane.add_effect(inFluent(obj, airplane), False)
    unloadAirplane.add_effect(at(obj, loc), True)

    driveTruck = InstantaneousAction(
        "driveTruck", truck=truckType, loc_from=locationType, loc_to=locationType, city=cityType
    )
    truck = driveTruck.truck
    loc_from = driveTruck.loc_from
    loc_to = driveTruck.loc_to
    city = driveTruck.city
    driveTruck.add_precondition(at(truck, loc_from))
    driveTruck.add_precondition(inCity(loc_from, city))
    driveTruck.add_precondition(inCity(loc_to, city))
    driveTruck.add_effect(at(truck, loc_from), False)
    driveTruck.add_effect(at(truck, loc_to), True)

    flyAirplane = InstantaneousAction(
        "flyAirplane", airplane=airplaneType, loc_from=airportType, loc_to=airportType
    )
    airplane = flyAirplane.airplane
    loc_from = flyAirplane.loc_from
    loc_to = flyAirplane.loc_to
    flyAirplane.add_precondition(at(airplane, loc_from))
    flyAirplane.add_effect(at(airplane, loc_from), False)
    flyAirplane.add_effect(at(airplane, loc_to), True)

    problem.add_actions(
        [loadTruck, loadAirplane, unloadTruck, unloadAirplane, driveTruck, flyAirplane]
    )

    for i in range(1, airplanes_no + 1):
        problem.add_object(Object(f"a{i}", airplaneType))

    for i in range(1, cities_no + 1):
        problem.add_object(Object(f"c{i}", cityType))

    for i in range(1, trucks_no + 1):
        problem.add_object(Object(f"t{i}", truckType))

    for i in range(1, cities_no + 1):
        for j in range(1, city_size + 1):
            if j == 1:
                problem.add_object(Object(f"l{i}_1", airportType))
            else:
                problem.add_object(Object(f"l{i}_{j}", locationType))

    for i in range(1, packages_no + 1):
        problem.add_object(Object(f"p{i}", packageType))

    for i in range(1, cities_no + 1):
        city = problem.object(f"c{i}")
        for j in range(1, city_size + 1):
            location = problem.object(f"l{i}_{j}")
            problem.set_initial_value(inCity(location, city), True)

    random.seed(seed)

    for i in range(1, trucks_no + 1):
        city_id = i
        # city_id = random.choice(range(1, cities_no + 1))
        location_id = random.choice(range(1, city_size + 1))
        location_object = problem.object(f"l{city_id}_{location_id}")
        truck_object = problem.object(f"t{i}")
        problem.set_initial_value(at(truck_object, location_object), True)

    for i in range(1, packages_no + 1):
        city_id = random.choice(range(1, cities_no + 1))
        location_id = random.choice(range(1, city_size + 1))
        location_object = problem.object(f"l{city_id}_{location_id}")
        package_object = problem.object(f"p{i}")
        problem.set_initial_value(at(package_object, location_object), True)

    for i in range(1, airplanes_no + 1):
        # city_id = random.choice(range(1, cities_no + 1))
        city_id = i
        location_object = problem.object(f"l{city_id}_1")
        airplane_object = problem.object(f"a{i}")
        problem.set_initial_value(at(airplane_object, location_object), True)

    for i in range(1, packages_no + 1):
        city_id = random.choice(range(1, cities_no + 1))
        location_id = random.choice(range(1, city_size + 1))
        location_object = problem.object(f"l{city_id}_{location_id}")
        package_object = problem.object(f"p{i}")
        problem.add_goal(at(package_object, location_object))

    problem.add_quality_metric(unified_planning.model.metrics.MinimizeSequentialPlanLength())

    return problem


if __name__ == "__main__":
    print(get_logistics_problem())
