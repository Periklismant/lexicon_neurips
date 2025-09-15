(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bedtype countertoptype stoveburnertype coffeemachinetype ottomantype - receptacletype
   remotecontroltype saltshakertype tomatotype glassbottletype platetype - objecttype
   location1 location3 location4 - location
   bed_1 countertop_2 stoveburner_3 coffeemachine_4 ottoman_5 microwave_6 fridge_7 - receptacle
   glassbottle_4 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 countertop_2 countertoptype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 remotecontrol_1 remotecontroltype) (objecttype_0 saltshaker_2 saltshakertype) (objecttype_0 tomato_3 tomatotype) (objecttype_0 glassbottle_4 glassbottletype) (objecttype_0 plate_5 platetype) (cancontain countertoptype remotecontroltype) (cancontain countertoptype saltshakertype) (cancontain countertoptype tomatotype) (cancontain countertoptype glassbottletype) (cancontain countertoptype platetype) (cancontain ottomantype remotecontroltype) (cancontain microwavetype tomatotype) (cancontain microwavetype glassbottletype) (cancontain microwavetype platetype) (cancontain fridgetype tomatotype) (cancontain fridgetype glassbottletype) (cancontain fridgetype platetype) (pickupable remotecontrol_1) (pickupable saltshaker_2) (pickupable tomato_3) (cleanable tomato_3) (heatable tomato_3) (coolable tomato_3) (sliceable tomato_3) (pickupable glassbottle_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation bed_1 location3) (receptacleatlocation countertop_2 location2) (receptacleatlocation stoveburner_3 location4) (receptacleatlocation coffeemachine_4 location5) (receptacleatlocation ottoman_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location5) (inreceptacle remotecontrol_1 countertop_2) (inreceptacle saltshaker_2 countertop_2) (inreceptacle tomato_3 countertop_2) (inreceptacle glassbottle_4 microwave_6) (inreceptacle plate_5 countertop_2) (objectatlocation remotecontrol_1 location2) (objectatlocation saltshaker_2 location2) (objectatlocation tomato_3 location2) (objectatlocation glassbottle_4 location2) (objectatlocation plate_5 location2) (atlocation agent1 location1) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 tomatotype) (receptacletype_0 ?r_0 countertoptype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
