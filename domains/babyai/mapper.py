import re
from typing import List, Dict
import sys
import os

from base_mapper import BaseMapper


class BabyAIMapper(BaseMapper):
    def __init__(
        self,
        problem,
        plan=None,
        domain_name: str = "babyai",
    ):
        super().__init__(domain_name, problem, plan)

    def domain_nl(self) -> str:
        general_desc = "You are an agent navigating a 2D gridworld, which consists of 4 rooms. The rooms are arranged in a square formation: room_1 is on the north-west, room_2 is on the south-west, room_3 is on the north-east and room_4 is on the south-east. There are 4 doors connecting the following room pairs: room_1-room_2, room_1-room_3, room_2-room_4, room_3-room_4. The rooms of the gridworld may include two types of objects: boxes and balls. Each door, box and ball in the gridworld has a color.\n\n"
        planning_desc = self.constrained_planning_definition_nl()
        actions_desc = self.actions_nl()

        action_preconditions_desc = self.action_preconditions_nl()
        action_effects_desc = self.action_effects_nl()

        return (
            general_desc
            + planning_desc
            + actions_desc
            + action_preconditions_desc
            + action_effects_desc
        )

    def actions_nl(self) -> str:
        actions_desc = self.actions_definition_nl()
        gotoobject_desc = '\t"gotoobject x r": Go in front of to object x in room r.\n'
        gotoempty_desc = '\t"gotoempty": Go in front of an empty position of the room, which does not contain any object.\n'
        gotodoor_desc = '\t"gotodoor d r1 r2": Go in front of door d, connecting room r1 to room r2.\n'
        gotoroom_desc = (
            '\t"gotoroom r1 r2 d": Go to room r2 from room r1 using door d.\n'
        )
        pick_desc = '\t"pick x r": Pick up object x in room r.\n'
        drop_desc = '\t"drop x r": Drop object x in room r.\n'
        toggle_desc = (
            '\t"toggle d": Unlock door d if is locked. Lock door d if is unlocked.\n'
        )
        return (
            actions_desc
            + gotoobject_desc
            + gotoempty_desc
            + gotodoor_desc
            + gotoroom_desc
            + pick_desc
            + drop_desc
            + toggle_desc
            + "\n"
        )

    def action_preconditions_nl(self) -> str:
        prec_desc = self.action_preconditions_definition_nl()

        gotoobject_desc = '\t"goto object": you may only go in front of an object x if you are in the same room as x.\n'
        gotoempty_desc = (
            '\t"goto empty": you may go in front of an empty position anytime.\n'
        )
        gotodoor_desc = '\t"goto door": you may only go in front of a door d if (i) you are in a room which door d is connecting with another room, and (ii) there is no object blocking the position in front of d in the room you are currently in.\n'
        gotoroom_desc = '\t"goto room": you may only go in a room r if (i) you are currently in a room r0 that is adjacent to r, and (ii) the door that is connecting r0 and r is unlocked\n.'
        pick_desc = '\t"pick": you may only pick up an object x if (i) you are in the same room as x, and (ii) you are currently not holding any object.\n'
        drop_desc = '\t"drop": you may only drop an object x if (i) you are currently holding x, and (ii) the position in front of you is empty.\n'
        toggle_desc = (
            '\t"toggle": you may only toggle a door d if you are in front of d.\n'
        )

        return (
            prec_desc
            + gotoobject_desc
            + gotoempty_desc
            + gotodoor_desc
            + gotoroom_desc
            + pick_desc
            + drop_desc
            + toggle_desc
            + "\n"
        )

    def action_effects_nl(self) -> str:
        effects_desc = self.action_effects_definition_nl()
        gotoobject_desc = '\t"goto object": After performing this action regarding an object x, (i) if you were in front of some object or door x0, then you are no longer in front of x0 and (ii) you are in front of object x.\n'
        gotoempty_desc = '\t"goto empty": After performing this action, (i) if you were in front of some object or door x0, then you are no longer in front of x0 and (ii) you are in front of an empty position.\n'
        gotodoor_desc = '\t"goto door": After performing this action regarding a door d, (i) if you were in front of some object or door x0, then you are no longer in front of x0 and (ii) you are in front of door d.\n'
        gotoroom_desc = '\t"goto room": After performing this action in order to go from room r1 to room r2, (i) you are no longer in r1, (ii) you are in r2, (iii) you have visited r2, (iv) if you were in front of some object or door x0, then you are no longer in front of x0.\n'
        pick_desc = '\t"pick": After performing this action regarding an object x, (i) you are no longer in front of x, (ii) your hands are no longer empty, (iii) you are carrying x, (iv) x is no longer in the room, and (v) if x was blocking some door, then it is no longer blocking that door.\n'
        drop_desc = '\t"drop": After performing this action regarding an object x, (i) you are no longer carrying x, (ii) you are in front of x, (iii) your hands are empty, and (iv) object x is situated in the room you are currently in.\n'
        toggle_desc = '\t"toggle": After performing this action on a door d, (i) if d was locked, then it becomes unlocked, and (ii) if d was unlocked, then it becomes locked.\n\n'

        return (
            effects_desc
            + gotoobject_desc
            + gotoempty_desc
            + gotodoor_desc
            + gotoroom_desc
            + pick_desc
            + drop_desc
            + toggle_desc
            + "\n"
        )

    def fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() == "agentinroom":
            room_name = fluent_exp.args[0]._content.payload.name
            return f'"you are in {room_name}"'
        elif fluent_exp.fluent().name.lower() == "objectinroom":
            object_name, room_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"{object_name} is in {room_name}"'
        elif fluent_exp.fluent().name.lower() == "at_":
            obj_or_door_name = fluent_exp.args[0]._content.payload.name
            return f'"you are in front of {obj_or_door_name}"'
        elif fluent_exp.fluent().name.lower() == "carrying":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"you are holding {object_name}"'
        elif fluent_exp.fluent().name.lower() == "locked":
            door_name = fluent_exp.args[0]._content.payload.name
            return f'"{door_name} is locked"'
        elif fluent_exp.fluent().name.lower() == "blocked":
            door_name = fluent_exp.args[0]._content.payload.name
            object_name = fluent_exp.args[1]._content.payload.name
            room_name = fluent_exp.args[2]._content.payload.name
            return f'"{door_name} is being blocked by {object_name} in {room_name}"'
        elif fluent_exp.fluent().name.lower() == "visited":
            room_name = fluent_exp.args[0]._content.payload.name
            return f'"you have visited {room_name}"'
        elif fluent_exp.fluent().name.lower() == "emptyhands":
            return '"you are not holding any object"'
        elif fluent_exp.fluent().name.lower() == "objectcolor":
            object_name, color_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"{object_name} is {color_name[:-4]}"'
        elif fluent_exp.fluent().name.lower() == "adjacentrooms":
            room1_name, room2_name, door_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
                fluent_exp.args[2]._content.payload.name,
            )
            return f'"{room1_name} and {room2_name} are connected via {door_name}"'
        return ""
        # raise ValueError(f"The fluent of {fluent_exp} is not considered by the translator")

    def not_fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() == "agentinroom":
            room_name = fluent_exp.args[0]._content.payload.name
            return f'"you are not in {room_name}"'
        elif fluent_exp.fluent().name.lower() == "objectinroom":
            object_name, room_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"{object_name} is not in {room_name}"'
        elif fluent_exp.fluent().name.lower() == "at_":
            obj_or_door_name = fluent_exp.args[0]._content.payload.name
            return f'"you are not in front of {obj_or_door_name}"'
        elif fluent_exp.fluent().name.lower() == "carrying":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"you are not holding {object_name}"'
        elif fluent_exp.fluent().name.lower() == "locked":
            door_name = fluent_exp.args[0]._content.payload.name
            return f'"{door_name} is not locked"'
        elif fluent_exp.fluent().name.lower() == "blocked":
            door_name = fluent_exp.args[0]._content.payload.name
            object_name = fluent_exp.args[1]._content.payload.name
            room_name = fluent_exp.args[2]._content.payload.name
            return f'"{door_name} is not being blocked by {object_name} in {room_name}"'
        elif fluent_exp.fluent().name.lower() == "visited":
            room_name = fluent_exp.args[0]._content.payload.name
            return f'"you have not visited {room_name}"'
        elif fluent_exp.fluent().name.lower() == "emptyhands":
            return '"you are holding some object"'
        elif fluent_exp.fluent().name.lower() == "objectcolor":
            object_name, color_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"{object_name} is not {color_name[:-4]}"'
        elif fluent_exp.fluent().name.lower() == "adjacentrooms":
            room1_name, room2_name, door_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
                fluent_exp.args[2]._content.payload.name,
            )
            return f'"{room1_name} and {room2_name} are not connected via {door_name}"'
        return ""
        # raise ValueError(f"The fluent of {fluent_exp} is not considered by the translator")

    def ground_action_nl(self, action) -> str:
        action_name = action.action.name
        params = action.actual_parameters
        if action_name == "gotoobject":
            return f'"Go in front of object {params[0]} in {params[1]}"'
        if action_name == "gotoempty":
            return '"Go in front of an empty position"'
        if action_name == "gotodoor":
            return f'"Go in front of {params[0]} in {params[1]}"'
        if action_name == "gotoroom":
            return f'"Move from {params[0]} to {params[1]} using {params[2]}"'
        if action_name == "pick":
            return f'"Pick up {params[0]} from {params[1]}"'
        if action_name == "drop":
            return f'"Drop {params[0]} in {params[1]}"'
        if action_name == "toggle":
            return f'"Toggle {params[0]}"'
        raise ValueError(f"Action {action} undefined.")
