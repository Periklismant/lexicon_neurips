# Copyright 2021-2023 AIPlan4EU project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
"""This module defines the trajectory constraints remover class."""

import unified_planning as up
import unified_planning.engines as engines
from unified_planning.exceptions import UPProblemDefinitionError
from unified_planning.engines.mixins.compiler import CompilationKind, CompilerMixin
from unified_planning.engines.results import CompilerResult
from unified_planning.model import InstantaneousAction, Action, FNode, Fluent
from unified_planning.model.walkers import ExpressionQuantifiersRemover
from unified_planning.model import Problem, ProblemKind, MinimizeActionCosts
from unified_planning.model.problem_kind_versioning import LATEST_PROBLEM_KIND_VERSION
from unified_planning.model.expression import Expression
from functools import partial
from unified_planning.engines.compilers.utils import (
    lift_action_instance,
)
from typing import List, Dict, Tuple, Optional

from unified_planning.shortcuts import (
    UserType,
    Object,
    Parameter,
    Fluent,
    FluentExp,
    BoolType,
    InstantaneousAction,
    Problem,
    Always,
    Sometime,
    Equals,
    Exists,
    And,
    OneshotPlanner,
    OptimalityGuarantee,
    Compiler,
)

from unified_planning.io import PDDLReader, PDDLWriter

import random
import time
import sys


def get_problem_from_pddl(domain_file, problem_file):
    reader = PDDLReader()
    problem = reader.parse_problem(domain_file, problem_file)
    problem.add_quality_metric(up.model.metrics.MinimizeSequentialPlanLength())
    return problem


def get_doubleblocksworld_problem(test_case=1):
    domain_file = f"pddl/{test_case}/domain.pddl"
    constrained_problem_file = f"pddl/{test_case}/problem.pddl"
    unconstrained_problem_file = f"pddl/{test_case}/problem_unconstrained.pddl"
    constrained_problem = get_problem_from_pddl(domain_file, constrained_problem_file)
    unconstrained_problem = get_problem_from_pddl(domain_file, unconstrained_problem_file)
    return constrained_problem, unconstrained_problem


NUM = "num"
CONSTRAINTS = "constraints"
HOLD = "hold"
GOAL = "goal"
SEEN_PHI = "seen-phi"
SEEN_PSI = "seen-psi"
SEPARATOR = "-"


class LiftedTCORE(engines.engine.Engine, CompilerMixin):
    """
    LiftedTCORE class: the `LiftedTCORE` takes a :class:`~unified_planning.model.Problem`
    that contains 'trajectory_constraints' and returns a new grounded 'Problem' without those constraints.

    The compiler, for each trajectory_constraints manages 'Actions' (precondition and effects) and 'Goals'.

    This `Compiler` supports only the the `TRAJECTORY_CONSTRAINTS_REMOVING` :class:`~unified_planning.engines.CompilationKind`.
    """

    def __init__(self):
        engines.engine.Engine.__init__(self)
        CompilerMixin.__init__(self, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
        self._monitoring_atom_dict: Dict["up.model.fnode.FNode", "up.model.fnode.FNode"] = {}
        self._error_on_failed_checks = False

    @property
    def name(self):
        return "LiftedTCORE"

    @staticmethod
    def supports(problem_kind):
        return problem_kind <= LiftedTCORE.supported_kind()

    @staticmethod
    def supports_compilation(compilation_kind: CompilationKind) -> bool:
        return compilation_kind == CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING

    @staticmethod
    def resulting_problem_kind(
        problem_kind: ProblemKind, compilation_kind: Optional[CompilationKind] = None
    ) -> ProblemKind:
        new_kind = problem_kind.clone()
        if new_kind.has_trajectory_constraints() or new_kind.has_state_invariants():
            new_kind.unset_constraints_kind("TRAJECTORY_CONSTRAINTS")
            new_kind.unset_constraints_kind("STATE_INVARIANTS")
            new_kind.set_conditions_kind("NEGATIVE_CONDITIONS")
            new_kind.set_conditions_kind("DISJUNCTIVE_CONDITIONS")
        return new_kind

    @staticmethod
    def supported_kind() -> ProblemKind:
        supported_kind = ProblemKind(version=LATEST_PROBLEM_KIND_VERSION)
        supported_kind.set_problem_class("ACTION_BASED")
        supported_kind.set_typing("FLAT_TYPING")
        supported_kind.set_typing("HIERARCHICAL_TYPING")
        supported_kind.set_parameters("BOOL_FLUENT_PARAMETERS")
        supported_kind.set_parameters("BOUNDED_INT_FLUENT_PARAMETERS")
        supported_kind.set_parameters("BOOL_ACTION_PARAMETERS")
        supported_kind.set_parameters("BOUNDED_INT_ACTION_PARAMETERS")
        supported_kind.set_numbers("BOUNDED_TYPES")
        supported_kind.set_fluents_type("INT_FLUENTS")
        supported_kind.set_fluents_type("REAL_FLUENTS")
        supported_kind.set_fluents_type("OBJECT_FLUENTS")
        supported_kind.set_conditions_kind("NEGATIVE_CONDITIONS")
        supported_kind.set_conditions_kind("DISJUNCTIVE_CONDITIONS")
        supported_kind.set_conditions_kind("EQUALITIES")
        supported_kind.set_conditions_kind("EXISTENTIAL_CONDITIONS")
        supported_kind.set_conditions_kind("UNIVERSAL_CONDITIONS")
        supported_kind.set_effects_kind("CONDITIONAL_EFFECTS")
        supported_kind.set_effects_kind("INCREASE_EFFECTS")
        supported_kind.set_effects_kind("DECREASE_EFFECTS")
        supported_kind.set_effects_kind("STATIC_FLUENTS_IN_BOOLEAN_ASSIGNMENTS")
        supported_kind.set_effects_kind("STATIC_FLUENTS_IN_NUMERIC_ASSIGNMENTS")
        supported_kind.set_effects_kind("STATIC_FLUENTS_IN_OBJECT_ASSIGNMENTS")
        supported_kind.set_effects_kind("FLUENTS_IN_BOOLEAN_ASSIGNMENTS")
        supported_kind.set_effects_kind("FLUENTS_IN_NUMERIC_ASSIGNMENTS")
        supported_kind.set_effects_kind("FLUENTS_IN_OBJECT_ASSIGNMENTS")
        supported_kind.set_quality_metrics("ACTIONS_COST")
        supported_kind.set_actions_cost_kind("STATIC_FLUENTS_IN_ACTIONS_COST")
        supported_kind.set_actions_cost_kind("FLUENTS_IN_ACTIONS_COST")
        supported_kind.set_quality_metrics("FINAL_VALUE")
        supported_kind.set_quality_metrics("MAKESPAN")
        supported_kind.set_quality_metrics("PLAN_LENGTH")
        supported_kind.set_quality_metrics("OVERSUBSCRIPTION")
        supported_kind.set_quality_metrics("TEMPORAL_OVERSUBSCRIPTION")
        supported_kind.set_actions_cost_kind("INT_NUMBERS_IN_ACTIONS_COST")
        supported_kind.set_actions_cost_kind("REAL_NUMBERS_IN_ACTIONS_COST")
        supported_kind.set_oversubscription_kind("INT_NUMBERS_IN_OVERSUBSCRIPTION")
        supported_kind.set_oversubscription_kind("REAL_NUMBERS_IN_OVERSUBSCRIPTION")
        supported_kind.set_simulated_entities("SIMULATED_EFFECTS")
        supported_kind.set_constraints_kind("STATE_INVARIANTS")
        supported_kind.set_constraints_kind("TRAJECTORY_CONSTRAINTS")
        return supported_kind

    def _compile(
        self,
        problem: "up.model.AbstractProblem",
        compilation_kind: "up.engines.CompilationKind",
    ) -> CompilerResult:
        """
        Takes an instance of a :class:`~unified_planning.model.Problem` and the `TRAJECTORY_CONSTRAINTS_REMOVING` :class:`~unified_planning.engines.CompilationKind`
        and returns a `CompilerResult` where the problem without trajectory_constraints.

        :param problem: The instance of the `Problem` that contains the trajectory constraints.
        :param compilation_kind: The `CompilationKind` that must be applied on the given problem;
            only `TRAJECTORY_CONSTRAINTS_REMOVING` is supported by this compiler
        :return: The resulting `CompilerResult` data structure.
        """
        assert isinstance(problem, Problem)
        env = problem.environment
        # expression_quantifier_remover = ExpressionQuantifiersRemover(env)
        # grounding_result = engines.compilers.grounder.Grounder().compile(
        #    problem, CompilationKind.GROUNDING
        # )
        # assert isinstance(grounding_result.problem, Problem)
        # grounded_problem = grounding_result.problem
        new_problem = problem.clone()
        assert isinstance(new_problem, Problem)
        new_problem.name = f"{self.name}_{problem.name}"
        Init = new_problem.initial_values
        C = []
        for c in new_problem.trajectory_constraints:
            # if c.is_forall():
            # for all groundings
            # C.append(cground)
            # if new_c.is_and():
            # C.extend(new_c.args)
            # else:
            C.append(c)
        # create a list that contains trajectory_constraints
        # trajectory_constraints can contain quantifiers and need to be remove
        # relevancy_dict = self._build_relevancy_dict(env, C)
        A_prime: List["up.model.InstantaneousAction"] = list()
        I_prime, F_prime = self._get_monitoring_atoms(env, C, Init, new_problem)
        G_prime = env.expression_manager.And(
            [self._monitoring_atom_dict[c] for c in self._get_landmark_constraints(C)]
        )
        # trace_back_map: Dict[Action, Tuple[Action, List[FNode]]] = {}
        # assert isinstance(grounding_result.map_back_action_instance, partial)
        # map_grounded_action = grounding_result.map_back_action_instance.keywords["map"]
        for a in new_problem.actions:
            # map_value = map_grounded_action[a]
            # assert isinstance(a, InstantaneousAction)
            effects_to_add: List["up.model.effect.Effect"] = []
            # create an empty list to store the new effects for each trajectory constraints
            # relevant_constraints = self._get_relevant_constraints(a, relevancy_dict)
            for c in C:
                # manage the action for each trajectory_constraints that is relevant
                if c.is_always():
                    precondition, to_add = self._manage_always_compilation(env, c.args[0], a)
                elif c.is_at_most_once():
                    precondition, to_add = self._manage_amo_compilation(
                        env, c.args[0], self._monitoring_atom_dict[c], a, effects_to_add
                    )
                elif c.is_sometime_before():
                    precondition, to_add = self._manage_sb_compilation(
                        env,
                        c.args[0],
                        c.args[1],
                        self._monitoring_atom_dict[c],
                        a,
                        effects_to_add,
                    )
                elif c.is_sometime():
                    self._manage_sometime_compilation(
                        env, c.args[0], self._monitoring_atom_dict[c], a, effects_to_add
                    )
                elif c.is_sometime_after():
                    self._manage_sa_compilation(
                        env,
                        c.args[0],
                        c.args[1],
                        self._monitoring_atom_dict[c],
                        a,
                        effects_to_add,
                    )
                else:
                    raise Exception(f"ERROR This compiler cannot handle this constraint = {c}")
                if c.is_always() or c.is_at_most_once() or c.is_sometime_before():
                    if to_add and not precondition.is_true():
                        a.add_precondition(precondition)
            for eff in effects_to_add:
                a._add_effect_instance(eff)
            if env.expression_manager.FALSE() not in a.preconditions:
                A_prime.append(a)
            # trace_back_map[a] = map_value
        # create new problem to return
        # adding new fluents, goal, initial values and actions
        G_new = (env.expression_manager.And(new_problem.goals, G_prime)).simplify()
        new_problem.clear_goals()
        new_problem.add_goal(G_new)
        new_problem.clear_trajectory_constraints()
        for fluent in F_prime:
            new_problem.add_fluent(fluent)
        new_problem.clear_actions()
        for action in A_prime:
            new_problem.add_action(action)
        for init_val in I_prime:
            new_problem.set_initial_value(
                up.model.Fluent(f"{init_val}", env.type_manager.BoolType()), True
            )

        new_problem.clear_quality_metrics()
        for qm in problem.quality_metrics:
            if qm.is_minimize_action_costs():
                assert isinstance(qm, MinimizeActionCosts)
                new_costs: Dict[Action, up.model.Expression] = {}
                for na in new_problem.actions:
                    cost = qm.get_action_cost(problem.action(na.name))
                    if cost is not None:
                        new_costs[na] = cost

                new_problem.add_quality_metric(
                    MinimizeActionCosts(new_costs, environment=new_problem.environment)
                )
            else:
                new_problem.add_quality_metric(qm)

        return new_problem

    def _manage_sa_compilation(self, env, phi, psi, m_atom, a, E):
        # print("Sometime After case: ")
        # print(f"Formula: {phi}.\n Action: {a}")
        R1 = (self._regression(env, phi, a)).simplify()
        # print(f"R(phi, a) = {R1}")
        # print(f"Formula: {psi}.\n Action: {a}")
        R2 = (self._regression(env, psi, a)).simplify()
        # print(f"R(psi, a) = {R2}.")
        if phi != R1 or psi != R2:
            cond = (env.expression_manager.And(R1, env.expression_manager.Not(R2))).simplify()
            self._add_cond_eff(env, E, cond, env.expression_manager.Not(m_atom))
        if psi != R2:
            self._add_cond_eff(env, E, R2, m_atom)

    def _manage_sometime_compilation(self, env, phi, m_atom, a, E):
        # print("Sometime case: ")
        # print(f"Formula: {phi}.\n Action: {a}.")
        R = (self._regression(env, phi, a)).simplify()
        # print(f"R(phi, a) = {R}.\n")
        if R != phi:
            self._add_cond_eff(env, E, R, m_atom)

    def _manage_sb_compilation(self, env, phi, psi, m_atom, a, E):
        # print("Sometime before: ")
        # print(f"Formula: {phi}.\n Action: {a}")
        R_phi = (self._regression(env, phi, a)).simplify()
        # print(f"R(phi, a) = {R_phi}.")
        if R_phi == phi:
            added_precond = (None, False)
        else:
            rho = (env.expression_manager.Or(env.expression_manager.Not(R_phi), m_atom)).simplify()
            added_precond = (rho, True)
        # print(f"Formula: {psi}.\n Action: {a}")
        R_psi = (self._regression(env, psi, a)).simplify()
        # print(f"R(psi, a) = {R_phi}.")
        if R_psi != psi:
            self._add_cond_eff(env, E, R_psi, m_atom)
        return added_precond

    def _manage_amo_compilation(self, env, phi, m_atom, a, E):
        # print("At most once: ")
        # print(f"Formula: {phi}.\n Action: {a}")
        R = (self._regression(env, phi, a)).simplify()
        # print(f"R(phi, a) = {R}.")
        if R == phi:
            return None, False
        else:
            rho = (
                env.expression_manager.Or(
                    env.expression_manager.Not(R),
                    env.expression_manager.Not(m_atom),
                    phi,
                )
            ).simplify()
            self._add_cond_eff(env, E, R, m_atom)
            return rho, True

    def _manage_always_compilation(self, env, phi, a):
        # print("Always: ")
        # print(f"Formula: {phi}.\n Action: {a}")
        R = (self._regression(env, phi, a)).simplify()
        # print(f"R(phi, a) = {R}.")
        if R == phi:
            return None, False
        else:
            return R, True

    # in the list E are added new effects based on the type of constraint
    def _add_cond_eff(self, env, E, cond, eff):
        if not cond.simplify().is_false():
            if eff.is_not():
                E.append(
                    up.model.Effect(
                        condition=cond,
                        fluent=eff.args[0],
                        value=env.expression_manager.FALSE(),
                    )
                )
            else:
                E.append(
                    up.model.Effect(
                        condition=cond,
                        fluent=eff,
                        value=env.expression_manager.TRUE(),
                    )
                )

    def _get_relevant_constraints(self, a, relevancy_dict):
        relevant_constrains = []
        for eff in a.effects:
            constr = relevancy_dict.get(eff.fluent, [])
            for c in constr:
                if c not in relevant_constrains:
                    relevant_constrains.append(c)
        return relevant_constrains

    def _evaluate_constraint(self, env, constr, init_values):
        if constr.is_sometime():
            return HOLD, constr.args[0].substitute(init_values).simplify()
        elif constr.is_sometime_after():
            return (
                HOLD,
                env.expression_manager.Or(
                    constr.args[1].substitute(init_values),
                    env.expression_manager.Not(constr.args[0].substitute(init_values)),
                ).simplify(),
            )
        elif constr.is_sometime_before():
            return (
                SEEN_PSI,
                constr.args[1].substitute(init_values).simplify(),
            )
        elif constr.is_at_most_once():
            return (
                SEEN_PHI,
                constr.args[0].substitute(init_values).simplify(),
            )
        elif constr.is_bool_constant():
            return None, constr
        else:
            return None, constr.args[0].substitute(init_values).simplify()

    def _get_monitoring_atoms(self, env, C, Init, problem):
        monitoring_atoms = []
        monitoring_atoms_counter = 0
        initial_state_prime = []
        for constr in C:
            if constr.is_always():
                if constr.args[0].substitute(Init).simplify().is_false():
                    raise UPProblemDefinitionError(
                        "PROBLEM NOT SOLVABLE: an always is violated in the initial state"
                    )
            else:
                type, init_state_value = self._evaluate_constraint(env, constr, Init)
                fluent = up.model.Fluent(
                    f"{type}{SEPARATOR}{monitoring_atoms_counter}",
                    env.type_manager.BoolType(),
                )
                monitoring_atoms.append(fluent)
                monitoring_atom = env.expression_manager.FluentExp(fluent)
                self._monitoring_atom_dict[constr] = monitoring_atom
                if init_state_value.is_true():
                    initial_state_prime.append(monitoring_atom)
                if constr.is_sometime_before():
                    if constr.args[0].substitute(Init).simplify().is_true():
                        raise UPProblemDefinitionError(
                            "PROBLEM NOT SOLVABLE: a sometime-before is violated in the initial state"
                        )
                # I added this because the monitoring fluents need to has an initial value in the compiled problem
                problem.set_initial_value(monitoring_atom, init_state_value.is_true())
                monitoring_atoms_counter += 1
        return initial_state_prime, monitoring_atoms

    def _build_relevancy_dict(self, env, C):
        relevancy_dict: Dict[Fluent, List[FNode]] = {}
        for c in C:
            for atom in env.free_vars_extractor.get(c):
                conditions_list = relevancy_dict.setdefault(atom, [])
                conditions_list.append(c)
        return relevancy_dict

    def _get_landmark_constraints(self, C):
        for constr in C:
            if constr.is_sometime() or constr.is_sometime_after():
                yield constr

    def _gamma_substitution(self, env, literal, action):
        negated_literal = env.expression_manager.Not(expression=literal)
        gamma1 = self._gamma(env, literal, action)
        gamma2 = env.expression_manager.Not(self._gamma(env, negated_literal, action))
        conjunction = env.expression_manager.And(literal, gamma2)
        return env.expression_manager.Or(gamma1, conjunction)

    def _unification(self, eff_fluentexp, lit_fluentexp, x_vars):
        """Returns xi=[(var, var/obj), ..., (var, var/obj)], implying that the fluent expressions are unified with xi,
        or None if the fluent expressions cannot be unified."""
        if eff_fluentexp.fluent() != lit_fluentexp.fluent() or len(eff_fluentexp.args) != len(
            lit_fluentexp.args
        ):
            return None
        xi = dict()
        for i in range(len(eff_fluentexp.args)):
            f1arg = eff_fluentexp.args[i]
            f2arg = lit_fluentexp.args[i]
            if f1arg.is_object_exp() and f2arg.is_object_exp() and f1arg != f2arg:
                # print(f"Args: {f1arg} and {f2arg} are different Objects")
                return None
            elif (
                f1arg.is_parameter_exp()
                and f2arg.is_object_exp()
                and f2arg.object().type.is_subtype(f1arg.parameter().type)
            ):
                # print(f"Parameter: {f1arg} can be unified with Constraint Object: {f2arg}")
                xi[f1arg] = f2arg
            elif (
                f1arg.is_variable_exp()
                and f2arg.is_object_exp()
                and f2arg.object().type.is_subtype(f1arg.variable().type)
            ):
                # print(f"Effect Variable: {f1arg} can be unified with Constraint Object: {f2arg}")
                xi[f1arg] = f2arg
            elif (
                f1arg.is_parameter_exp()
                and f2arg.is_parameter_exp()
                and f1arg.parameter().type.is_subtype(f2arg.parameter().type)
                and f1arg.parameter() in x_vars
            ):
                # print(
                #    f"Constraint Parameter: {f2arg} can be unified with Action Parameter: {f1arg}"
                # )
                xi[f2arg] = f1arg
            elif (  # f1arg is in z_vars
                f1arg.is_parameter_exp()
                and f2arg.is_parameter_exp()
                and f2arg.parameter().type.is_subtype(f1arg.parameter().type)
            ):
                # print(
                #    f"Universal Effect Parameter: {f1arg} can be unified with Constraint Parameter: {f2arg}"
                # )
                xi[f1arg] = f2arg
            else:  # Case: unification failed due to type incompatibility (?)
                return None
        return xi

    def _gamma(self, env, literal, action):
        disjunction = []
        x_vars = action.parameters
        # print(f"Constraint literal: {literal}")
        # print()
        for eff in action.effects:
            z_vars = list()
            uni = None
            if eff.is_forall():
                z_vars.extend(list(eff.forall))
            if eff.value.is_true() and literal.is_fluent_exp():
                uni = self._unification(eff.fluent, literal, x_vars)
            elif eff.value.is_false() and literal.is_not():
                uni = self._unification(eff.fluent, literal.args[0], x_vars)
            if uni is None:
                continue
            z_free = []  # list(set(z_vars) - set(list(uni.keys())))
            unification_variables = [var.variable() for var in uni if var.is_variable_exp()]
            for z_var in z_vars:
                if z_var not in unification_variables:
                    z_free.append(z_var)

            # print(f"X vars: {x_vars}")
            # print(f"Z vars: {z_vars}")
            # print(f"Unification: {uni}")
            # print(f"Z free: {z_free}")
            # print()

            cond = eff.condition
            for param in uni:
                if param.is_parameter_exp() and param.parameter() in x_vars:
                    cond = And(cond, Equals(param, uni[param]))
                elif (
                    param.is_variable_exp()
                ):  # Universal effect variable or constraint variable (?)
                    cond = cond.substitute({param: uni[param]})
                else:
                    raise ValueError(f"{param} is not an operator parameter or an effect variable")
            if len(z_free) > 0:
                for z_var in z_free:
                    cond = Exists(cond, z_var)
            disjunction.append(cond)

            # if literal == eff:
            #    if cond.is_true():
            #        return env.expression_manager.TRUE()
            #    disjunction.append(cond)
        # print(f"Gamma: {disjunction}")
        # print()
        if not disjunction:
            return env.expression_manager.FALSE()
        return env.expression_manager.Or(disjunction)

    def _regression(self, env, phi, action):
        if phi.is_false() or phi.is_true():
            return phi
        elif phi.is_fluent_exp():
            return self._gamma_substitution(env, phi, action)
        elif phi.is_or():
            return env.expression_manager.Or(
                self._regression(env, component, action) for component in phi.args
            )
        elif phi.is_and():
            return env.expression_manager.And(
                self._regression(env, component, action) for component in phi.args
            )
        elif phi.is_not():
            return env.expression_manager.Not(self._regression(env, phi.arg(0), action))
        elif phi.is_forall():
            return env.expression_manager.Forall(
                self._regression(env, phi.arg(0), action), phi.variables()[0]
            )
        elif phi.is_exists():
            return env.expression_manager.Exists(
                self._regression(env, phi.arg(0), action), phi.variables()[0]
            )
        else:
            raise up.exceptions.UPUsageError("This compiler cannot handle this expression")
