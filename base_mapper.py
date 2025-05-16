from abc import ABC, abstractmethod
import re
from typing import List, Dict

from unified_planning.io import PDDLReader

from collections.abc import Iterable


class BaseMapper(ABC):
    def __init__(
        self,
        domain_name,
        problem,
        plan=None,
    ):
        self.domain_name = domain_name
        self.problem = problem  # reader.parse_problem(domain_file_path, problem_file_path)
        if plan:
            self.plan = plan

    @abstractmethod
    def domain_nl(self):
        pass

    @abstractmethod
    def actions_nl(self):
        pass

    @abstractmethod
    def action_preconditions_nl(self):
        pass

    @abstractmethod
    def action_effects_nl(self):
        pass

    @abstractmethod
    def fluent_exp_nl(self, fluent_exp):
        pass

    @abstractmethod
    def not_fluent_exp_nl(self, fluent_exp):
        pass

    @abstractmethod
    def ground_action_nl(self, action):
        pass

    def problem_nl(self) -> str:
        objects_desc = self.objects_nl(self.problem.all_objects)
        initial_state_desc = self.initial_state_nl(self.problem.initial_values)
        goal_desc = self.goal_nl(self.problem.goals[0])
        constraints_desc = self.constraints_nl(self.problem.trajectory_constraints)
        return objects_desc + initial_state_desc + goal_desc + constraints_desc

    def formula_nl(self, expr):
        if isinstance(expr, Iterable):
            return ", ".join(f"{self.formula_nl(fnode)}" for fnode in expr)
        if expr.is_fluent_exp():
            return self.fluent_exp_nl(expr)
        if expr.is_not():
            return self.not_fluent_exp_nl(expr.arg(0))
        if expr.is_and():
            return f'"The following conditions are all true: {self.formula_nl(expr.args)}"'
        if expr.is_or():
            return (
                f'"At least one of the following conditions is true: {self.formula_nl(expr.args)}"'
            )
        if expr.is_exists():
            return (
                '"There is'
                + " and ".join(f" a {var.type.name} {var.name}" for var in expr.variables())
                + f' such that {self.formula_nl(expr.arg(0))}"'
            )
        if expr.is_forall():
            return (
                '"For all'
                + " and ".join(f" {var.type.name} {var.name}" for var in expr.variables())
                + f', we have {self.formula_nl(expr.arg(0))}"'
            )
        if expr.is_always():
            return f'"The following expression must hold in every state: \n\t\t{self.formula_nl(expr.arg(0))}"'
        if expr.is_sometime():
            return f'"The following expression must hold in at least one state: \n\t\t{self.formula_nl(expr.arg(0))}"'
        if expr.is_at_most_once():
            return f'"The following expression must hold in at most one continuous sequence of states: \n\t\t{self.formula_nl(expr.arg(0))}"'
        if expr.is_sometime_before():
            return f'"If expression \n\t\t{self.formula_nl(expr.arg(0))}\n\t\tholds in some state, then there must be an earlier state in which the following expression is true: \n\t\t{self.formula_nl(expr.arg(1))}"'
        if expr.is_sometime_after():
            return f'"If expression \n\t\t{self.formula_nl(expr.arg(0))}\n\t\tholds in some state s, then expression\n\t\t{self.formula_nl(expr.arg(1))}\n\t\tmust hold at s or at some state after s"'
        raise TypeError(f"The type {type(expr)} of {expr} is not considered by the translator")

    def constrained_planning_definition_nl(self) -> str:
        return "Provided a planning problem, consisting of an initial state of the world, a final goal and a set of constraints, your task is to provide a valid sequence of actions that solves the planning problem, i.e., bringing about the goal of the problem while satisfying all constraints."

    def decision_making_prompt(self) -> str:
        return "You will operate one step at time. Your answers will contain one action. Afterwards, I will provide the state of the world after your action was executed. Then, you will provide another action, etc. In each response, you will delimit your one action with one top line and one bottom line containing only 3  '`' characters"

    def unconstrained_planning_definition_nl(self) -> str:
        return "Provided a planning problem, consisting of an initial state of the world and a final goal, your task is to provide a valid sequence of actions that solves the planning problem by bringing about the goal of the problem."

    def plan_format_nl(self) -> str:
        return "The format of each action in the plan should be: 'ActionName Argument1 ... ArgumentN', where each argument is an element of the domain. Write each action of a plan in a separate line. Delineate the plan with one top line and one bottom line containing only 3  '`' characters."

    def optimal_planning_definition_nl(self) -> str:
        return "You need to provide an optimal plan, i.e., a valid plan whose length is equal or less than the length of any other valid plan."

    def system_prompt_for_constrained_planning(self) -> str:
        return (
            self.constrained_planning_definition_nl()
            + self.plan_format_nl()
            + self.optimal_planning_definition_nl()
            + "\n\n"
        )

    def system_prompt_for_unconstrained_planning(self) -> str:
        return (
            self.unconstrained_planning_definition_nl()
            + self.plan_format_nl()
            + self.optimal_planning_definition_nl()
            + "\n\n"
        )

    def actions_definition_nl(self) -> str:
        return "The available actions are the following:\n"

    def action_preconditions_definition_nl(self) -> str:
        return "An action may only be performed if its preconditions are met.\nThe actions of this domain have the following preconditions:\n"

    def action_effects_definition_nl(self) -> str:
        return "The effects of an action are brought about after the action is performed.\nAn effect may be conditional, in the sense that it manifests only if some conditions hold.\n The actions of this domain have the following effects:\n"

    def objects_nl(self, objects) -> str:
        objects_desc = "The world includes the following objects:\n"
        for prob_obj in objects:
            objects_desc += f'\t"{prob_obj.type.name} {prob_obj.name}"\n'
        return objects_desc + "\n"

    def initial_state_nl(self, initial_values):
        initial_state_desc = "The original state of the world is the following:\n"
        for fluent_exp in initial_values.keys():
            if initial_values[fluent_exp].is_true():
                nl = self.fluent_exp_nl(fluent_exp)
                if len(nl) > 0:
                    initial_state_desc += "\t" + nl + "\n"
        return initial_state_desc + "\n"

    def get_state_nl(self, state):
        state_desc = "The state of the world is the following:\n"
        for fluent in state._values.keys():
            if "hold" not in fluent.fluent().name and "seen" not in fluent.fluent().name:
                if state.get_value(fluent).is_true():
                    state_desc += f"{self.fluent_exp_nl(fluent)}\n"
                # else:
                #    state_desc += f"{self.not_fluent_exp_nl(fluent)}\n"
        return state_desc

    def goal_nl(self, goal):
        goal_desc = "The task is to bring about the following situation:\n"
        goal_desc += "\t" + self.formula_nl(goal) + "\n"
        return goal_desc + "\n"

    def constraints_nl(self, constraints):
        constraints_desc = (
            "A valid plan for the abovementioned problem must abide by the following constraints:\n"
        )
        for constraint in constraints:
            constraints_desc += "\t" + self.formula_nl(constraint) + "\n"
        return constraints_desc + "\n"

    def get_plan_nl(self, plan):
        plan_desc = "The plan is the following sequence of actions:\n"

        def action_format(action_instance):
            action_name = action_instance.action.name
            params = action_instance.actual_parameters
            return f'\t{action_name} {" ".join(str(param) for param in params)}\n'

        for action_instance in plan.actions:
            plan_desc += action_format(action_instance)
        return plan_desc

    def get_problem_nl(self):
        return (
            self.system_prompt_for_constrained_planning(),
            self.domain_nl(),
            self.problem_nl(),
            # self.plan_nl(),
        )

    def get_unconstrained_problem_nl(self):
        return (
            self.system_prompt_for_unconstrained_planning(),
            self.domain_nl(),
            self.problem_nl(),
            # self.plan_nl(),
        )
