(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   sidetabletype laundryhampertype countertoptype handtowelholdertype - receptacletype
   tomatotype remotecontroltype appletype spatulatype cuptype - objecttype
   location1 location2 - location
   laundryhamper_2 countertop_3 handtowelholder_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   tomato_1 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 countertop_3 countertoptype) (receptacletype_0 handtowelholder_4 handtowelholdertype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tomato_1 tomatotype) (objecttype_0 remotecontrol_2 remotecontroltype) (objecttype_0 apple_3 appletype) (objecttype_0 spatula_4 spatulatype) (objecttype_0 cup_5 cuptype) (cancontain sidetabletype tomatotype) (cancontain sidetabletype remotecontroltype) (cancontain sidetabletype appletype) (cancontain sidetabletype spatulatype) (cancontain sidetabletype cuptype) (cancontain countertoptype tomatotype) (cancontain countertoptype remotecontroltype) (cancontain countertoptype appletype) (cancontain countertoptype spatulatype) (cancontain countertoptype cuptype) (cancontain microwavetype tomatotype) (cancontain microwavetype appletype) (cancontain microwavetype cuptype) (cancontain fridgetype tomatotype) (cancontain fridgetype appletype) (cancontain fridgetype cuptype) (pickupable tomato_1) (cleanable tomato_1) (heatable tomato_1) (coolable tomato_1) (sliceable tomato_1) (pickupable remotecontrol_2) (pickupable apple_3) (cleanable apple_3) (heatable apple_3) (coolable apple_3) (sliceable apple_3) (pickupable spatula_4) (cleanable spatula_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation sidetable_1 location5) (receptacleatlocation laundryhamper_2 location3) (receptacleatlocation countertop_3 location1) (receptacleatlocation handtowelholder_4 location3) (receptacleatlocation handtowelholder_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location2) (inreceptacle tomato_1 countertop_3) (inreceptacle remotecontrol_2 sidetable_1) (inreceptacle apple_3 microwave_6) (inreceptacle spatula_4 sidetable_1) (inreceptacle cup_5 microwave_6) (objectatlocation tomato_1 location1) (objectatlocation remotecontrol_2 location5) (objectatlocation apple_3 location1) (objectatlocation spatula_4 location5) (objectatlocation cup_5 location1) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 appletype) (receptacletype_0 ?r_0 countertoptype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
