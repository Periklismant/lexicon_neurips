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


def get_double_blocksworld_problem():
    domain_file = "domains/blocksworld/pddl/double_blocksworld.pddl"
    problem_file = "domains/blocksworld/pddl/problem.pddl"
    reader = PDDLReader()
    problem = reader.parse_problem(domain_file, problem_file)
    problem.add_quality_metric(unified_planning.model.metrics.MinimizeSequentialPlanLength())
    return problem


def get_blocksworld_problem(num_blocks=5, seed=None):
    problem = Problem("BlocksWorld")

    random.seed(seed)

    blockType = UserType("Block")

    clear = Fluent("clear", BoolType(), obj=blockType)
    onTable = Fluent("ontable", BoolType(), obj=blockType)
    handEmpty = Fluent("handEmpty", BoolType())
    holding = Fluent("holding", BoolType(), obj=blockType)
    on = Fluent("on", BoolType(), obj1=blockType, obj2=blockType)

    problem.add_fluent(clear, default_initial_value=True)
    problem.add_fluent(onTable, default_initial_value=False)
    problem.add_fluent(handEmpty, default_initial_value=True)
    problem.add_fluent(holding, default_initial_value=False)
    problem.add_fluent(on, default_initial_value=False)

    pickup = InstantaneousAction("pickup", obj=blockType)
    obj = pickup.obj
    pickup.add_precondition(clear(obj))
    pickup.add_precondition(onTable(obj))
    pickup.add_precondition(handEmpty)
    pickup.add_effect(holding(obj), True)
    pickup.add_effect(clear(obj), False)
    pickup.add_effect(onTable(obj), False)
    pickup.add_effect(handEmpty, False)

    putdown = InstantaneousAction("putdown", obj=blockType)
    obj = putdown.obj
    putdown.add_precondition(holding(obj))
    putdown.add_effect(clear(obj), True)
    putdown.add_effect(handEmpty, True)
    putdown.add_effect(onTable(obj), True)
    putdown.add_effect(holding(obj), False)

    stack = InstantaneousAction("stack", obj=blockType, underObj=blockType)
    obj = stack.obj
    underObj = stack.underObj
    stack.add_precondition(clear(underObj))
    stack.add_precondition(holding(obj))
    stack.add_effect(handEmpty, True)
    stack.add_effect(clear(obj), True)
    stack.add_effect(on(obj, underObj), True)
    stack.add_effect(clear(underObj), False)
    stack.add_effect(holding(obj), False)

    unstack = InstantaneousAction("unstack", obj=blockType, underObj=blockType)
    obj = unstack.obj
    underObj = unstack.underObj
    unstack.add_precondition(on(obj, underObj))
    unstack.add_precondition(clear(obj))
    unstack.add_precondition(handEmpty)
    unstack.add_effect(holding(obj), True)
    unstack.add_effect(clear(underObj), True)
    unstack.add_effect(on(obj, underObj), False)
    unstack.add_effect(clear(obj), False)
    unstack.add_effect(handEmpty, False)

    problem.add_actions([pickup, putdown, stack, unstack])

    num_per_color = {
        "red": 0,
        "blue": 0,
        "green": 0,
        "yellow": 0,
        "orange": 0,
        "grey": 0,
        "purple": 0,
        "black": 0,
        "white": 0,
        "brown": 0,
    }
    block_colors = [random.choice(list(num_per_color.keys())) for _ in range(num_blocks)]
    blocks = []
    for color in block_colors:
        num_per_color[color] += 1
        blocks.append(Object(f"{color}_block_{num_per_color[color]}", blockType))
    problem.add_objects(blocks)

    positions = ["table"]
    for block in blocks:
        position = random.choice(positions)
        if position == "table":
            problem.set_initial_value(onTable(block), True)
        else:
            problem.set_initial_value(on(block, position), True)
            problem.set_initial_value(clear(position), False)
            positions.remove(position)
        positions.append(block)

    def not_holds_initially(goal):
        """return True if the goal is not implied by the initial state"""
        return problem.initial_values[goal].is_false()

    while True:
        fluent = random.choice(problem.fluents)
        args = []
        i = 0
        while i < fluent.arity:
            myblock = random.choice(problem.all_objects)
            if myblock not in args:
                args.append(myblock)
                i += 1
        goal = FluentExp(fluent, args)
        if not_holds_initially(goal):
            break

    problem.add_goal(goal)

    problem.add_quality_metric(unified_planning.model.metrics.MinimizeSequentialPlanLength())

    return problem


if __name__ == "__main__":
    problem = get_double_blocksworld_problem()
    print(problem)
    print(problem.kind)
