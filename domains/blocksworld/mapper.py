import re
from typing import List, Dict
import sys
import os

from base_mapper import BaseMapper


class BlocksworldMapper(BaseMapper):
    def __init__(
        self,
        problem,
        plan=None,
        domain_name: str = "blocksworld",
    ):
        # super().__init__(domain_name, domain_file_path, problem_file_path, plan_file_path)
        super().__init__(domain_name, problem, plan)

    def domain_nl(self) -> str:
        general_desc = "Blocksworld consists of a table and a set of blocks, where each block may be placed directly on the table or on top of another block. All blocks have the same size and there is no limit on the height of a tower of blocks or on the number of blocks on the table. You are a robotic arm that can hold at most one block at a time.\n\n"
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
        pickup_desc = '\t"pickup x": Pick up block x from the table.\n'
        putdown_desc = '\t"putdown x": Place block x on the table.\n'
        stack_desc = '\t"stack x y": Place block x on top of block y.\n'
        unstack_desc = '\t"unstack x y": Pick up block x from the top of block y.\n'
        return (
            actions_desc + pickup_desc + putdown_desc + stack_desc + unstack_desc + "\n"
        )

    def action_preconditions_nl(self) -> str:
        prec_desc = self.action_preconditions_definition_nl()
        pickup_desc = '\t"pickup": You may only perform this action on a block b if: (i) there is no block on top of b, i.e., block b is "clear", (ii) b is placed on the table, and (iii) you are currently not holding any block.\n'
        putdown_desc = '\t"putdown": You may only perform this action on a block b if you are currently holding block b.\n'
        stack_desc = '\t"stack": You may only perform this action on some blocks b1 and b2 if (i) you are currently holding block b1, and (ii) block b2 does not have any block on top of it, i.e., b2 is "clear".\n'
        unstack_desc = '\t"unstack": You may only perform this action on some blocks b1 and b2 if (i) block b1 is on top of block b2 (ii) block b1 does not have any block on top of it, i.e., b1 is "clear", and (iii) you are not currently holding any block.\n'
        return prec_desc + pickup_desc + putdown_desc + stack_desc + unstack_desc + "\n"

    def action_effects_nl(self) -> str:
        effects_desc = self.action_effects_definition_nl()
        pickup_desc = '\t"pickup": After performing this action on a block b, (i) you are holding b and (ii) b is no longer on the table.\n'
        putdown_desc = '\t"putdown": After performing this action on a block b, (i) b is on the table, (ii) there is no block on top of b, i.e., b is "clear", and (iii) you are no longer holding b, or any other block.\n'
        stack_desc = '\t"stack": After performing this action on some blocks b1 and b2, (i) b1 is on top of b2, (ii) b1 is "clear", (iii) b2 is no longer "clear" and (iv) you are no longer holding b1, or any other block.\n'
        unstack_desc = '\t"unstack": After performing this action on some blocks b1 and b2, (i) b1 is not longer on top of b2, (ii) b2 is "clear", and (iii) you are holding b1.\n'

        return (
            effects_desc + pickup_desc + putdown_desc + stack_desc + unstack_desc + "\n"
        )

    def fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() == "ontable":
            block_name = fluent_exp.args[0].object().name
            return f'"{block_name} is on the table"'
        elif fluent_exp.fluent().name.lower() == "on":
            block1_name, block2_name = (
                fluent_exp.args[0].object().name,
                fluent_exp.args[1].object().name,
            )
            return f'"{block1_name} is on top of {block2_name}"'
        elif fluent_exp.fluent().name.lower() == "clear":
            block_name = fluent_exp.args[0].object().name
            return f'"there is no block on top of {block_name}, i.e., {block_name} is clear"'
        elif fluent_exp.fluent().name.lower() == "handempty":
            return '"you are not holding any block"'
        elif fluent_exp.fluent().name.lower() == "holding":
            block_name = fluent_exp.args[0].object().name
            return f'"you are holding {block_name}"'
        raise ValueError(
            f"The fluent of {fluent_exp} is not considered by the translator"
        )

    def not_fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() == "ontable":
            block_name = fluent_exp.args[0].object().name
            return f'"{block_name} is not on the table"'
        elif fluent_exp.fluent().name.lower() == "on":
            block1_name, block2_name = (
                fluent_exp.args[0].object().name,
                fluent_exp.args[1].object().name,
            )
            return f'"{block1_name} is not on top of {block2_name}"'
        elif fluent_exp.fluent().name.lower() == "clear":
            block_name = fluent_exp.args[0].object().name
            return f'"there is a block on top of {block_name}, i.e., {block_name} is not clear"'
        elif fluent_exp.fluent().name.lower() == "handempty":
            return '"you are holding some block"'
        elif fluent_exp.fluent().name.lower() == "holding":
            block_name = fluent_exp.args[0].object().name
            return f'"you are not holding {block_name}"'
        raise ValueError(
            f"The fluent of {fluent_exp} is not considered by the translator"
        )

    def ground_action_nl(self, action) -> str:
        action_name = action.action.name
        params = action.actual_parameters
        if action_name == "pickup":
            return f'"Pick {params[0]} up from the table"'
        if action_name == "putdown":
            return f'"Put {params[0]} down on the table"'
        if action_name == "stack":
            return f'"Stack {params[0]} on top of {params[1]}"'
        if action_name == "unstack":
            return f'"Pick {params[0]} up from the top of {params[1]}"'
        raise NotImplementedError
