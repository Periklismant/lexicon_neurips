(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bedtype countertoptype stoveburnertype coffeemachinetype ottomantype - receptacletype
   alarmclocktype tennisrackettype winebottletype kettletype pantype - objecttype
   location2 - location
   bed_1 countertop_2 coffeemachine_4 ottoman_5 microwave_6 fridge_7 - receptacle
   tennisracket_2 kettle_4 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 countertop_2 countertoptype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 alarmclock_1 alarmclocktype) (objecttype_0 tennisracket_2 tennisrackettype) (objecttype_0 winebottle_3 winebottletype) (objecttype_0 kettle_4 kettletype) (objecttype_0 pan_5 pantype) (cancontain bedtype tennisrackettype) (cancontain countertoptype alarmclocktype) (cancontain countertoptype tennisrackettype) (cancontain countertoptype winebottletype) (cancontain countertoptype kettletype) (cancontain countertoptype pantype) (cancontain stoveburnertype kettletype) (cancontain stoveburnertype pantype) (cancontain fridgetype winebottletype) (cancontain fridgetype pantype) (pickupable alarmclock_1) (pickupable tennisracket_2) (pickupable winebottle_3) (pickupable kettle_4) (cleanable kettle_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation bed_1 location3) (receptacleatlocation countertop_2 location2) (receptacleatlocation stoveburner_3 location4) (receptacleatlocation coffeemachine_4 location5) (receptacleatlocation ottoman_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location5) (inreceptacle alarmclock_1 countertop_2) (inreceptacle tennisracket_2 countertop_2) (inreceptacle winebottle_3 countertop_2) (inreceptacle kettle_4 countertop_2) (inreceptacle pan_5 stoveburner_3) (objectatlocation alarmclock_1 location2) (objectatlocation tennisracket_2 location2) (objectatlocation winebottle_3 location2) (objectatlocation kettle_4 location2) (objectatlocation pan_5 location4) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 kettletype) (receptacletype_0 ?r_0 countertoptype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
