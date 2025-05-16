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


def delete_hyphens(fname):
    with open(fname, "r") as f:
        lines = f.readlines()

    ftemp = "temp"
    with open(ftemp, "w") as f:
        for line in lines:
            new_line = re.sub(
                r"\b(\w+-\w+(?:-\w+)*)\b", lambda m: m.group(1).replace("-", ""), line
            )
            f.write(new_line)
    os.rename(ftemp, fname)


def get_sokoban_problem(seed=1, grid_width=5, grid_height=5, stones_no=1):
    goals_no = stones_no
    problem = Problem("Sokoban")

    thingType = UserType("Thing")
    personType = UserType("Person", father=thingType)
    stoneType = UserType("Stone", father=thingType)
    locationType = UserType("Location")
    directionType = UserType("Direction")

    moveDir = Fluent(
        "moveDir", BoolType(), l_from=locationType, l_to=locationType, d=directionType
    )
    isNongoal = Fluent("isNongoal", BoolType(), l=locationType)
    isGoal = Fluent("isGoal", BoolType(), l=locationType)
    clear = Fluent("clear", BoolType(), l=locationType)
    at = Fluent("at", BoolType(), t=thingType, l=locationType)
    atGoal = Fluent("atGoal", BoolType(), t=thingType)

    problem.add_fluent(moveDir, default_initial_value=False)
    problem.add_fluent(isNongoal, default_initial_value=True)
    problem.add_fluent(isGoal, default_initial_value=False)
    problem.add_fluent(clear, default_initial_value=True)
    problem.add_fluent(at, default_initial_value=False)
    problem.add_fluent(atGoal, default_initial_value=False)

    move = InstantaneousAction(
        "move", p=personType, l_from=locationType, l_to=locationType, d=directionType
    )
    p = move.p
    l_from = move.l_from
    l_to = move.l_to
    d = move.d
    move.add_precondition(at(p, l_from))
    move.add_precondition(clear(l_to))
    move.add_precondition(moveDir(l_from, l_to, d))
    move.add_effect(at(p, l_from), False)
    move.add_effect(clear(l_to), False)
    move.add_effect(at(p, l_to), True)
    move.add_effect(clear(l_from), True)

    pushToGoal = InstantaneousAction(
        "pushToGoal",
        p=personType,
        s=stoneType,
        l_p=locationType,
        l_from=locationType,
        l_to=locationType,
        d=directionType,
    )
    p = pushToGoal.p
    s = pushToGoal.s
    l_p = pushToGoal.l_p
    l_from = pushToGoal.l_from
    l_to = pushToGoal.l_to
    d = pushToGoal.d
    pushToGoal.add_precondition(at(p, l_p))
    pushToGoal.add_precondition(at(s, l_from))
    pushToGoal.add_precondition(clear(l_to))
    pushToGoal.add_precondition(moveDir(l_p, l_from, d))
    pushToGoal.add_precondition(moveDir(l_from, l_to, d))
    pushToGoal.add_precondition(isGoal(l_to))
    pushToGoal.add_effect(at(p, l_p), False)
    pushToGoal.add_effect(at(s, l_from), False)
    pushToGoal.add_effect(clear(l_to), False)
    pushToGoal.add_effect(at(p, l_from), True)
    pushToGoal.add_effect(at(s, l_to), True)
    pushToGoal.add_effect(clear(l_p), True)
    pushToGoal.add_effect(atGoal(s), True)

    pushToNongoal = InstantaneousAction(
        "pushToNongoal",
        p=personType,
        s=stoneType,
        l_p=locationType,
        l_from=locationType,
        l_to=locationType,
        d=directionType,
    )
    p = pushToNongoal.p
    s = pushToNongoal.s
    l_p = pushToNongoal.l_p
    l_from = pushToNongoal.l_from
    l_to = pushToNongoal.l_to
    d = pushToNongoal.d
    pushToNongoal.add_precondition(at(p, l_p))
    pushToNongoal.add_precondition(at(s, l_from))
    pushToNongoal.add_precondition(clear(l_to))
    pushToNongoal.add_precondition(moveDir(l_p, l_from, d))
    pushToNongoal.add_precondition(moveDir(l_from, l_to, d))
    pushToNongoal.add_precondition(isNongoal(l_to))
    pushToNongoal.add_effect(at(p, l_p), False)
    pushToNongoal.add_effect(at(s, l_from), False)
    pushToNongoal.add_effect(clear(l_to), False)
    pushToNongoal.add_effect(at(p, l_from), True)
    pushToNongoal.add_effect(at(s, l_to), True)
    pushToNongoal.add_effect(clear(l_p), True)
    pushToNongoal.add_effect(atGoal(s), False)

    problem.add_actions([move, pushToGoal, pushToNongoal])

    dirdown = Object("dirdown", directionType)
    dirleft = Object("dirleft", directionType)
    dirright = Object("dirright", directionType)
    dirup = Object("dirup", directionType)
    player1 = Object("player1", personType)

    problem.add_objects([dirdown, dirleft, dirright, dirup, player1])

    for x in range(1, grid_width + 1):
        for y in range(1, grid_height + 1):
            posxy = Object(f"pos{x}{y}", locationType)
            problem.add_object(posxy)
    random.seed(seed)

    def get_random_pos():
        x = random.randint(1, grid_width)
        y = random.randint(1, grid_height)
        return f"pos{x}{y}"

    def get_random_stone_pos():
        x = random.randint(2, grid_width - 1)
        y = random.randint(2, grid_height - 1)
        return f"pos{x}{y}"

    occupied_poss = []
    player_pos = get_random_pos()
    problem.set_initial_value(at(player1, problem.object(player_pos)), True)
    occupied_poss.append(player_pos)

    for i in range(1, stones_no + 1):
        while True:
            stone_pos = get_random_stone_pos()
            if stone_pos not in occupied_poss:
                occupied_poss.append(stone_pos)
                stone_i = Object(f"stone{i}", stoneType)
                problem.add_object(stone_i)
                pos_obj = problem.object(stone_pos)
                problem.set_initial_value(at(stone_i, pos_obj), True)
                break

    clear_poss = []
    for x in range(1, grid_width + 1):
        for y in range(1, grid_height + 1):
            my_pos = f"pos{x}{y}"
            posxy = Object(my_pos, locationType)
            if my_pos not in occupied_poss:
                clear_poss.append(my_pos)
                problem.set_initial_value(clear(posxy), True)

    for i in range(1, goals_no + 1):
        rand_pos = random.choice(clear_poss)
        pos_obj = problem.object(rand_pos)
        problem.set_initial_value(isGoal(pos_obj), True)
        problem.set_initial_value(isNongoal(pos_obj), False)
        problem.add_goal(atGoal(problem.object(f"stone{i}")))

    for x in range(1, grid_width + 1):
        for y in range(1, grid_height + 1):
            posxy = problem.object(f"pos{x}{y}")
            if x > 1:
                posLeft = problem.object(f"pos{x-1}{y}")
                problem.set_initial_value(moveDir(posxy, posLeft, dirleft), True)
            if x < grid_width:
                posRight = problem.object(f"pos{x+1}{y}")
                problem.set_initial_value(moveDir(posxy, posRight, dirright), True)
            if y > 1:
                posUp = problem.object(f"pos{x}{y-1}")
                problem.set_initial_value(moveDir(posxy, posUp, dirup), True)
            if y < grid_height:
                posDown = problem.object(f"pos{x}{y+1}")
                problem.set_initial_value(moveDir(posxy, posDown, dirdown), True)

    problem.add_quality_metric(
        unified_planning.model.metrics.MinimizeSequentialPlanLength()
    )
    return problem


if __name__ == "__main__":
    print(get_sokoban_problem())
