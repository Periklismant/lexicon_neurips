(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bedtype countertoptype stoveburnertype coffeemachinetype ottomantype - receptacletype
   remotecontroltype saltshakertype tomatotype glassbottletype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bed_1 countertop_2 stoveburner_3 coffeemachine_4 ottoman_5 microwave_6 fridge_7 - receptacle
   remotecontrol_1 saltshaker_2 tomato_3 glassbottle_4 plate_5 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 countertop_2 countertoptype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 remotecontrol_1 remotecontroltype) (objecttype_0 saltshaker_2 saltshakertype) (objecttype_0 tomato_3 tomatotype) (objecttype_0 glassbottle_4 glassbottletype) (objecttype_0 plate_5 platetype) (cancontain countertoptype remotecontroltype) (cancontain countertoptype saltshakertype) (cancontain countertoptype tomatotype) (cancontain countertoptype glassbottletype) (cancontain countertoptype platetype) (cancontain ottomantype remotecontroltype) (cancontain microwavetype tomatotype) (cancontain microwavetype glassbottletype) (cancontain microwavetype platetype) (cancontain fridgetype tomatotype) (cancontain fridgetype glassbottletype) (cancontain fridgetype platetype) (pickupable remotecontrol_1) (pickupable saltshaker_2) (pickupable tomato_3) (cleanable tomato_3) (heatable tomato_3) (coolable tomato_3) (sliceable tomato_3) (pickupable glassbottle_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation bed_1 location3) (receptacleatlocation countertop_2 location2) (receptacleatlocation stoveburner_3 location4) (receptacleatlocation coffeemachine_4 location5) (receptacleatlocation ottoman_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location5) (inreceptacle remotecontrol_1 countertop_2) (inreceptacle saltshaker_2 countertop_2) (inreceptacle tomato_3 countertop_2) (inreceptacle glassbottle_4 microwave_6) (inreceptacle plate_5 countertop_2) (objectatlocation remotecontrol_1 location2) (objectatlocation saltshaker_2 location2) (objectatlocation tomato_3 location2) (objectatlocation glassbottle_4 location2) (objectatlocation plate_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o tomatotype) (receptacletype_0 ?r countertoptype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
