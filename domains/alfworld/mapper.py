import re
from typing import List, Dict
import sys
import os

sys.path.append(os.environ["LEXICON"])

from base_mapper import BaseMapper


class AlfWorldMapper(BaseMapper):
    def __init__(
        self,
        problem,
        plan=None,
        domain_name: str = "alfworld",
    ):
        super().__init__(domain_name, problem, plan)

    def domain_nl(self) -> str:
        general_desc = "You are an agent navigating locations inside a house. Each location is a room that may contain several objects and object receptacles. It is possible to pickup some objects and place them into appropriate receptacles. Moreover, it may be possible for you to heat, cool, toggle and slice some of the objects or look at them under a light. Your task is to bring about some object-receptacle configuration, or heat, cool or look at some object under a light.\n\n"
        actions_desc = self.actions_nl()

        action_preconditions_desc = self.action_preconditions_nl()
        action_effects_desc = self.action_effects_nl()

        return general_desc + actions_desc + action_preconditions_desc + action_effects_desc

    def actions_nl(self) -> str:
        actions_desc = self.actions_definition_nl()
        look_desc = '\t"look a l": Agent a checks location l.\n'
        inventory_desc = '\t"inventory a": Agent a checks its inventory.\n'
        examine_receptacle_desc = '\t"examinereceptacle a r": Agent a checks receptacle r.\n'
        examine_object_desc = '\t"examineobject a o": Agent a checks object o.\n'
        goto_location_desc = (
            '\t"gotolocation a ls le": Agent a moves from location ls to location le.\n'
        )
        open_object_desc = '\t"openobject a l r": Agent a opens receptacle r at location l.\n'
        close_object_desc = '\t"closeobject a l r": Agent a closes receptacle r at location l.\n'
        pickup_object_desc = '\t"pickupobject a l o r": Agent a picks up object o which is in receptacle r at location l.\n'
        put_object_desc = '\t"putobject a l o r ot rt": Agent a puts object o (whose type is ot) in receptacle r (whose type is rt) at location l.\n'
        clean_object_desc = (
            '\t"cleanobject a l r o": Agent a cleans object o in receptacle r at location l.\n'
        )
        heat_object_desc = (
            '\t"heatobject a l r o": Agent a heats object o in receptacle r at location l.\n'
        )
        cool_object_desc = (
            '\t"coolobject a l r o": Agent a cools object o in receptacle r at location l.\n'
        )
        toggle_object_desc = (
            '\t"toggleobject a l o r": Agent a toggles object o in receptacle r at location l.\n'
        )
        slice_object_desc = (
            '\t"sliceobject a l co ko": Agent a slices object co using object ko at location l.\n'
        )
        help_desc = '\t"help a": Agent a checks itself.\n'

        return (
            actions_desc
            + look_desc
            + inventory_desc
            + examine_receptacle_desc
            + examine_object_desc
            + goto_location_desc
            + open_object_desc
            + close_object_desc
            + pickup_object_desc
            + put_object_desc
            + clean_object_desc
            + heat_object_desc
            + cool_object_desc
            + toggle_object_desc
            + slice_object_desc
            + help_desc
            + "\n"
        )

    def action_preconditions_nl(self) -> str:
        prec_desc = self.action_preconditions_definition_nl()

        look_desc = (
            '\t"look": you may only perform this action with you (agent a) are in location l.\n'
        )
        inventory_desc = '\t"inventory": you may perform this anytime.\n'
        examine_receptacle_desc = '\t"examinereceptacle": you may only perform this action if there is a location l such that you (agent a) are in l and receptacle r is in l.\n'
        examine_object_desc = '\t"examineobject": you may perform this action if there is a location l and a receptacle r such that you (agent a) are in l, r is in l, object o is in r, and r is opened or is not openable. The only other possibility to perform this action is to be holding object o.\n'
        goto_location_desc = '\t"gotolocation": you may only perform this action if you (agent a) are in location ls.\n'
        open_object_desc = '\t"openobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, r is openable and r is not opened.\n'
        close_object_desc = '\t"closeobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, r is openable and r is opened.\n'
        pickup_object_desc = '\t"pickupobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, object o is in r, you are not holding anything, o is pickupable, and r is opened or not openable.\n'
        put_object_desc = '\t"putobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, you are holding object o, r is opened or not openable, o is of type ot, r is of type rt and receptacles of type rt may contain objects of type ot.\n'
        clean_object_desc = '\t"cleanobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, you are holding object o, o is cleanable, and r is a sink basin according to its type.\n'
        heat_object_desc = '\t"heatobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, you are holding object o, o is heatable, and r is a microwave according to its type.\n'
        cool_object_desc = '\t"coolobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, you are holding object o, o is coolable, and r is a fridge according to its type.\n'
        toggle_object_desc = '\t"toggleobject": you may only perform this action if you (agent a) are in location l, receptacle r is in l, you are holding object o and o is togglable.\n'
        slice_object_desc = '\t"sliceobject": you may only perform this action if you (agent a) are in location l, object co is in l, you are holding object ko, co is sliceable, and ko is a knife or a butterknife according to its type.\n'

        help_desc = '\t"help": you may perform this anytime.\n'

        return (
            prec_desc
            + look_desc
            + inventory_desc
            + examine_receptacle_desc
            + examine_object_desc
            + goto_location_desc
            + open_object_desc
            + close_object_desc
            + pickup_object_desc
            + put_object_desc
            + clean_object_desc
            + heat_object_desc
            + cool_object_desc
            + toggle_object_desc
            + slice_object_desc
            + help_desc
            + "\n"
        )

    def action_effects_nl(self) -> str:
        effects_desc = self.action_effects_definition_nl()

        look_desc = '\t"look": after performing this action location l is checked.\n'
        inventory_desc = '\t"inventory": after performing this action agent a is checked.\n'
        examine_receptacle_desc = (
            '\t"examinereceptacle": after performing this action receptacle r is checked.\n'
        )
        examine_object_desc = (
            '\t"examineobject": after performing this action object o is checked.\n'
        )
        goto_location_desc = '\t"gotolocation": after performing this action (i) agent a is no longer at location ls and (ii) agent a is at location le.\n'

        open_object_desc = '\t"openobject": after performing this action (i) receptacle r is opened and (ii) receptacle r is checked.\n'
        close_object_desc = (
            '\t"closeobject": after performing this action receptacle r is no longer opened.\n'
        )
        pickup_object_desc = '\t"pickupobject": after performing this action (i) object o is no longer in receptacle r, (ii) you are holding object o, and (iii) object o is not longer in location l.\n'
        put_object_desc = '\t"putobject": after performing this action (i) object o is in receptacle r, (ii) object o is in location l, and (iii) you are not holding any object.\n'
        clean_object_desc = '\t"cleanobject": after performing this action object o is clean.\n'
        heat_object_desc = '\t"heatobject": after performing this action object o is hot.\n'
        cool_object_desc = '\t"coolobject": after performing this action object o is cool.\n'
        toggle_object_desc = '\t"toggleobject": after performing this action (i) object o is turned on, if it was previously off, (ii) object o is turned off, if it was previously on, and (iii) object o is considered "toggled".\n'
        slice_object_desc = '\t"sliceobject": after performing this action object o is sliced.\n'
        help_desc = '\t"helpobject": after performing this action agent a is checked.\n'

        return (
            effects_desc
            + look_desc
            + inventory_desc
            + examine_receptacle_desc
            + examine_object_desc
            + goto_location_desc
            + open_object_desc
            + close_object_desc
            + pickup_object_desc
            + put_object_desc
            + clean_object_desc
            + heat_object_desc
            + cool_object_desc
            + toggle_object_desc
            + slice_object_desc
            + help_desc
            + "\n"
        )

    def fluent_exp_nl(self, fluent_exp):
        if fluent_exp.is_equals():
            print("is equals")
            entity1, entity2 = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"{entity1} is the same as {entity2}"'

        if fluent_exp.fluent().name.lower() == "atlocation":
            agent_name = fluent_exp.args[0]._content.payload.name
            location_name = fluent_exp.args[1]._content.payload.name
            return f'"agent {agent_name} is at location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "receptacleatlocation":
            receptacle_name, location_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"receptacle {receptacle_name} is at location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "objectatlocation":
            object_name, location_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"object {object_name} is at location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "openable":
            receptacle_name = fluent_exp.args[0]._content.payload.name
            return f'"Receptacle {receptacle_name} is openable"'
        elif fluent_exp.fluent().name.lower() == "opened":
            receptacle_name = fluent_exp.args[0]._content.payload.name
            return f'"Receptacle {receptacle_name} is opened"'
        elif fluent_exp.fluent().name.lower() == "inreceptacle":
            object_name, receptacle_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"object {object_name} is in receptacle {receptacle_name}"'
        elif fluent_exp.fluent().name.lower() == "checked":
            name = fluent_exp.args[0]._content.payload.name
            return f'"{name} is checked"'
        elif fluent_exp.fluent().name.lower() == "receptacletype_0":
            receptacle_name, receptacle_type_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"receptacle {receptacle_name} has type {receptacle_type_name}"'
        elif fluent_exp.fluent().name.lower() == "cancontain":
            receptacle_type_name, object_type_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"Receptacles of type {receptacle_type_name} may contain objects of type {object_type_name}"'
        elif fluent_exp.fluent().name.lower() == "objecttype_0":
            object_name, object_type_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"object {object_name} has type {object_type_name}"'
        elif fluent_exp.fluent().name.lower() == "holds":
            agent_name, object_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"Agent {agent_name} is holding object {object_name}"'
        elif fluent_exp.fluent().name.lower() == "holdsany":
            agent_name = fluent_exp.args[0]._content.payload.name
            return f'"Agent {agent_name} is holding something"'
        elif fluent_exp.fluent().name.lower() == "isclean":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is clean"'
        elif fluent_exp.fluent().name.lower() == "cleanable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} can be cleaned"'
        elif fluent_exp.fluent().name.lower() == "ishot":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is hot"'
        elif fluent_exp.fluent().name.lower() == "heatable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} can be heated"'
        elif fluent_exp.fluent().name.lower() == "iscool":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is cool"'
        elif fluent_exp.fluent().name.lower() == "coolable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} can be cooled"'
        elif fluent_exp.fluent().name.lower() == "pickupable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} can be picked up"'
        elif fluent_exp.fluent().name.lower() == "toggleable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} can be toggled"'
        elif fluent_exp.fluent().name.lower() == "ison":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is on"'
        elif fluent_exp.fluent().name.lower() == "istoggled":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is toggled"'
        elif fluent_exp.fluent().name.lower() == "issliced":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is sliced"'
        elif fluent_exp.fluent().name.lower() == "sliceable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} can be sliced"'

        return ""
        # raise ValueError(f"The fluent of {fluent_exp} is not considered by the translator")

    def not_fluent_exp_nl(self, fluent_exp):
        if fluent_exp.is_equals():
            entity1, entity2 = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"{entity1} is different from {entity2}"'
        elif fluent_exp.fluent().name.lower() == "atlocation":
            agent_name = fluent_exp.args[0]._content.payload.name
            location_name = fluent_exp.args[1]._content.payload.name
            return f'"agent {agent_name} is not at location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "receptacleatlocation":
            receptacle_name, location_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"receptacle {receptacle_name} is not at location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "objectatlocation":
            object_name, location_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"object {object_name} is not at location {location_name}"'
        elif fluent_exp.fluent().name.lower() == "openable":
            receptacle_name = fluent_exp.args[0]._content.payload.name
            return f'"Receptacle {receptacle_name} is not openable"'
        elif fluent_exp.fluent().name.lower() == "opened":
            receptacle_name = fluent_exp.args[0]._content.payload.name
            return f'"Receptacle {receptacle_name} is not opened"'
        elif fluent_exp.fluent().name.lower() == "inreceptacle":
            object_name, receptacle_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"object {object_name} is not in receptacle {receptacle_name}"'
        elif fluent_exp.fluent().name.lower() == "checked":
            name = fluent_exp.args[0]._content.payload.name
            return f'"{name} is not checked"'
        elif fluent_exp.fluent().name.lower() == "receptacletype_0":
            receptacle_name, receptacle_type_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"receptacle {receptacle_name} does not have type {receptacle_type_name}"'
        elif fluent_exp.fluent().name.lower() == "cancontain":
            receptacle_type_name, object_type_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"Receptacles of type {receptacle_type_name} may not contain objects of type {object_type_name}"'
        elif fluent_exp.fluent().name.lower() == "objecttype_0":
            object_name, object_type_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"object {object_name} does not have type {object_type_name}"'
        elif fluent_exp.fluent().name.lower() == "holds":
            agent_name, object_name = (
                fluent_exp.args[0]._content.payload.name,
                fluent_exp.args[1]._content.payload.name,
            )
            return f'"Agent {agent_name} is not holding object {object_name}"'
        elif fluent_exp.fluent().name.lower() == "holdsany":
            agent_name = fluent_exp.args[0]._content.payload.name
            return f'"Agent {agent_name} is not holding anything"'
        elif fluent_exp.fluent().name.lower() == "isclean":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is not clean"'
        elif fluent_exp.fluent().name.lower() == "cleanable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} cannot be cleaned"'
        elif fluent_exp.fluent().name.lower() == "ishot":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is not hot"'
        elif fluent_exp.fluent().name.lower() == "heatable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} cannot be heated"'
        elif fluent_exp.fluent().name.lower() == "iscool":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is not cool"'
        elif fluent_exp.fluent().name.lower() == "coolable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} cannot be cooled"'
        elif fluent_exp.fluent().name.lower() == "pickupable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} cannot be picked up"'
        elif fluent_exp.fluent().name.lower() == "toggleable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} cannot be toggled"'
        elif fluent_exp.fluent().name.lower() == "ison":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is not on"'
        elif fluent_exp.fluent().name.lower() == "istoggled":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is not toggled"'
        elif fluent_exp.fluent().name.lower() == "issliced":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} is not sliced"'
        elif fluent_exp.fluent().name.lower() == "sliceable":
            object_name = fluent_exp.args[0]._content.payload.name
            return f'"Object {object_name} cannot be sliced"'

        return ""

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
