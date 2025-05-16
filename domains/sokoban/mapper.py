import re
from typing import List, Dict
import sys
import os

from base_mapper import BaseMapper


class SokobanMapper(BaseMapper):
    def __init__(
        self,
        problem,
        plan=None,
        domain_name: str = "sokoban",
    ):
        # super().__init__(domain_name, domain_file_path, problem_file_path, plan_file_path)
        super().__init__(domain_name, problem, plan)

    def domain_nl(self) -> str:
        general_desc = "The world consists of a 2D square grid. Each position on the grid may contain either the agent, a stone or be empty. Each position is flagged as either a goal position or a non-goal position. Your task is to manipulate the agent in order to move all stones to goal positions.\n\n"
        actions_desc = self.actions_nl()

        action_preconditions_desc = self.action_preconditions_nl()
        action_effects_desc = self.action_effects_nl()

        return (
            general_desc
            + actions_desc
            + action_preconditions_desc
            + action_effects_desc
        )

    def actions_nl(self) -> str:
        actions_desc = self.actions_definition_nl()
        actions_desc += '\t"move p l_from l_to d": Move agent p from location l_from to location l_to following direction d.\n'
        actions_desc += '\t"pushtogoal p s l_p l_from l_to d": Make agent p, situated at location l_p, push stone s from location l_from to goal location l_to, following direction d.\n'
        actions_desc += '\t"pushtonongoal p s l_p l_from l_to d": Make agent p, situated at location l_p, push stone s from location l_from to non-goal location l_to, following direction d.\n'
        return actions_desc + "\n"

    def action_preconditions_nl(self) -> str:
        prec_desc = self.action_preconditions_definition_nl()
        prec_desc += '\t"move p l_from l_to d": You may only perform this action if (i) agent p is at location l_from, (ii) location l_to is clear, and (iii) you can get from location l_from to location l_to following direction d.\n'
        prec_desc += '\t"pushtogoal p s l_p l_from l_to d": You may only perform this action if (i) agent p is at location l_p, (ii) stone s is at location l_from, (iii) location l_to is clear, (iv) you can get from location l_p to location l_from following direction d, (v) you can get from location l_from to location l_to following direction d, and (vi) location l_to is a goal location.\n'
        prec_desc += '\t"pushtonongoal p s l_p l_from l_to d": You may only perform this action if (i) agent p is at location l_p, (ii) stone s is at location l_from, (iii) location l_to is clear, (iv) you can get from location l_p to location l_from following direction d, (v) you can get from location l_from to location l_to following direction d, and (vi) location l_to is not a goal location.\n'
        return prec_desc + "\n"

    def action_effects_nl(self) -> str:
        effects_desc = self.action_effects_definition_nl()

        effects_desc += '\t"move p l_from l_to d": After performing this action, (i) agent p is no longer at location l_from, (ii) location l_to is no longer clear, (iii) agent p is at location l_to, and (iv) location l_from is clear.\n'
        effects_desc += '\t"pushtogoal p s l_p l_from l_to d": After performing this action, (i) agent p is no longer at location l_p, (ii) stone s is no longer at location l_from, (iii) location l_to is no longer clear, (iv) agent p is at location l_from, (v) stone s is at location l_to, (vi) location l_p is clear, and (vi) stone s is at a goal state.\n'
        effects_desc += '\t"pushtonongoal p s l_p l_from l_to d": After performing this action, (i) agent p is no longer at location l_p, (ii) stone s is no longer at location l_from, (iii) location l_to is no longer clear, (iv) agent p is at location l_from, (v) stone s is at location l_to, (vi) location l_p is clear, and (vi) stone s is at a non goal state.\n'

        return effects_desc + "\n"

    def fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() == "movedir":
            l_from = fluent_exp.args[0].object().name
            l_to = fluent_exp.args[1].object().name
            dir_name = fluent_exp.args[2].object().name
            return f'"You may move from location {l_from} to location {l_to} following direction {dir_name}"'
        elif fluent_exp.fluent().name.lower() == "isnongoal":
            loc = fluent_exp.args[0].object().name
            return f'"{loc} is not a goal location"'
        elif fluent_exp.fluent().name.lower() == "isgoal":
            loc = fluent_exp.args[0].object().name
            return f'"{loc} is a goal location"'
        elif fluent_exp.fluent().name.lower() == "clear":
            loc = fluent_exp.args[0].object().name
            return f'"Location {loc} is clear"'
        elif fluent_exp.fluent().name.lower() in ["at", "at_"]:
            thing = fluent_exp.args[0].object().name
            loc = fluent_exp.args[1].object().name
            return f'"{thing} is at location {loc}"'
        elif fluent_exp.fluent().name.lower() == "atgoal":
            thing = fluent_exp.args[0].object().name
            return f'"{thing} is at a goal location"'
        raise ValueError(
            f"The fluent of {fluent_exp} is not considered by the translator"
        )

    def not_fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() == "movedir":
            l_from = fluent_exp.args[0].object().name
            l_to = fluent_exp.args[1].object().name
            dir_name = fluent_exp.args[2].object().name
            return f'"You may not move from location {l_from} to location {l_to} following direction {dir_name}"'
        elif fluent_exp.fluent().name.lower() == "isnongoal":
            loc = fluent_exp.args[0].object().name
            return f'"{loc} is a goal location"'
        elif fluent_exp.fluent().name.lower() == "isgoal":
            loc = fluent_exp.args[0].object().name
            return f'"{loc} is not a goal location"'
        elif fluent_exp.fluent().name.lower() == "clear":
            loc = fluent_exp.args[0].object().name
            return f'"Location {loc} is not clear"'
        elif fluent_exp.fluent().name.lower() in ["at", "at_"]:
            thing = fluent_exp.args[0].object().name
            loc = fluent_exp.args[1].object().name
            return f'"{thing} is not at location {loc}"'
        elif fluent_exp.fluent().name.lower() == "atgoal":
            thing = fluent_exp.args[0].object().name
            return f'"{thing} is not at a goal location"'
        raise ValueError(
            f"The fluent of {fluent_exp} is not considered by the translator"
        )

    def ground_action_nl(self, action) -> str:
        action_name = action.action.name
        params = action.actual_parameters
        if action_name == "move":
            return f'"Agent {params[0]} moves from location {params[1]} to location {params[2]} following direction {params[3]}"'
        if action_name == "pushtogoal":
            return f'"Agent {params[0]}, being at location {params[2]}, pushes stone {params[1]} from location {params[3]} to goal location {params[4]} following direction {params[5]}"'
        if action_name == "pushtonongoal":
            return f'"Agent {params[0]}, being at location {params[2]}, pushes stone {params[1]} from location {params[3]} to non-goal location {params[4]} following direction {params[5]}"'
        raise NotImplementedError
