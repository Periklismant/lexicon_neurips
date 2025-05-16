import re
from typing import List, Dict
import sys
import os

from base_mapper import BaseMapper


class LogisticsMapper(BaseMapper):
    def __init__(
        self,
        problem,
        plan=None,
        domain_name: str = "logistics",
    ):
        # super().__init__(domain_name, domain_file_path, problem_file_path, plan_file_path)
        super().__init__(domain_name, problem, plan)

    def domain_nl(self) -> str:
        general_desc = "The world consists of cities, where each city may include multiple locations. One location of each city is an airport. The world may also include trucks, airplanes and packages. Trucks may move between locations in a city, while airplanes may move between airports. Trucks and airplanes may carry packages.  You are a logistician that suggests plans to bring packages to specific locations. \n\n"
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
        actions_desc += '\t"loadtruck p t l": Load package p in truck t. Both p and t are in location l.\n'
        actions_desc += '\t"loadairplane p ap l": Load package p in airplane ap. Both p and ap are in location l.\n'
        actions_desc += (
            '\t"unloadtruck p t l": Unload package p from truck t in location l.\n'
        )
        actions_desc += '\t"loadairplane p ap l": Unload package p from airplane ap in location l.\n'
        actions_desc += '\t"drivetruck t l_from l_to c": Drive truck t from location l_from to location l_to in city c.\n'
        actions_desc += '\t"flyairplane ap l_from l_to": Fly airplane ap from location l_from to location l_to.\n'

        return actions_desc + "\n"

    def action_preconditions_nl(self) -> str:
        prec_desc = self.action_preconditions_definition_nl()

        prec_desc += '\t"loadtruck": You may only load package p in a truck t if p and t are in the same location l.\n'
        prec_desc += '\t"loadairplane": You may only load package p in a airplane ap if ap and t are in the same location l.\n'
        prec_desc += '\t"unloadtruck": You may only unload package p from a truck t in a location l if (i) t is situated in l, and (ii) p is in t.\n'
        prec_desc += '\t"unloadairplane": You may only unload package p from a airplane ap in a location l if (i) ap is situated in l, and (ii) p is in ap.\n'
        prec_desc += '\t"drivetruck": You may only move a truck t from location l_from to location l_to in a city c if (i) t is situated in l_from, and (ii) l_from and l_to are locations of c.\n'
        prec_desc += '\t"flyairplane": You may only fly an airplane ap from location l_from to location l_to if ap is situated in l_from.\n'
        return prec_desc + "\n"

    def action_effects_nl(self) -> str:
        effects_desc = self.action_effects_definition_nl()
        effects_desc += '\t"loadtruck": After loading a package p in a truck t at a location l, (i) p is no longer situated in l, and (ii) p is in t.\n'
        effects_desc += '\t"loadairplane": After loading a package p in an airplane ap at location l, (i) p is no longer situated in l, and (ii) p is in ap.\n'
        effects_desc += '\t"unloadtruck": After unloading a package p from a truck t in a location l, (i) p is no longer in t, and (ii) p is situated in l.\n'
        effects_desc += '\t"unloadairplane": After unloading a package p from an airplane ap in a location l, (i) p is no longer in ap, and (ii) p is situated in l.\n'
        effects_desc += '\t"drivetruck": After moving a truck t from location l_from to location l_to in a city c, (i) t is no longer situated in l_from, and (ii) t is situated in l_to.\n'
        effects_desc += '\t"flyairplane": After flying an airplane ap from location l_from to location l_to, (i) ap is no longer situated in l_from, and (ii) ap is situated in l_to.\n'

        return effects_desc + "\n"

    def fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() in ["at_", "at"]:
            package_name = fluent_exp.args[0].object().name
            location_name = fluent_exp.args[1].object().name
            return f'"Package {package_name} is in location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "in":
            package_name = fluent_exp.args[0].object().name
            vehicle_name = fluent_exp.args[1].object().name
            return f'"Package {package_name} is in {vehicle_name}"'
        elif fluent_exp.fluent().name.lower() == "incity":
            location_name = fluent_exp.args[0].object().name
            city_name = fluent_exp.args[1].object().name
            return f'"Location {location_name} is in city {city_name}"'
        raise ValueError(
            f"The fluent of {fluent_exp} is not considered by the translator"
        )

    def not_fluent_exp_nl(self, fluent_exp):
        if fluent_exp.fluent().name.lower() == "at_":
            package_name = fluent_exp.args[0].object().name
            location_name = fluent_exp.args[1].object().name
            return f'"Package {package_name} is not in location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "in":
            package_name = fluent_exp.args[0].object().name
            vehicle_name = fluent_exp.args[1].object().name
            return f'"Package {package_name} is not in {vehicle_name}"'
        elif fluent_exp.fluent().name.lower() == "incity":
            location_name = fluent_exp.args[0].object().name
            city_name = fluent_exp.args[1].object().name
            return f'"Location {location_name} is not in city {city_name}"'
        raise ValueError(
            f"The fluent of {fluent_exp} is not considered by the translator"
        )

    def ground_action_nl(self, action) -> str:
        action_name = action.action.name
        params = action.actual_parameters
        if action_name == "loadtruck":
            return f'"Load package {params[0]} in truck {params[1]} at location {params[2]}"'
        if action_name == "loadairplane":
            return f'"Load package {params[0]} in airplane {params[1]} at location {params[2]}"'
        if action_name == "unloadtruck":
            return f'"Unload package {params[0]} from truck {params[1]} at location {params[2]}"'
        if action_name == "unloadairplane":
            return f'"Unload package {params[0]} from airplane {params[1]} at location {params[2]}"'
        if action_name == "drivetruck":
            return f'"Drive truck {params[0]} from location {params[1]} to location {params[2]} in city {params[3]}"'
        if action_name == "flyairplane":
            return f'"Fly airplane {params[0]} from location {params[1]} to location {params[2]}"'
        raise NotImplementedError
