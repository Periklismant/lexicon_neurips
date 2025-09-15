(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype sofatype coffeemachinetype - receptacletype
   cellphonetype tomatotype appletype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   towelholder_1 fridge_2 sofa_3 coffeemachine_4 coffeemachine_5 microwave_6 fridge_7 - receptacle
   cellphone_1 tomato_2 cellphone_3 apple_4 mug_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 fridge_2 fridgetype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 coffeemachine_5 coffeemachinetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 cellphone_1 cellphonetype) (objecttype_0 tomato_2 tomatotype) (objecttype_0 cellphone_3 cellphonetype) (objecttype_0 apple_4 appletype) (objecttype_0 mug_5 mugtype) (cancontain fridgetype tomatotype) (cancontain fridgetype appletype) (cancontain fridgetype mugtype) (cancontain sofatype cellphonetype) (cancontain coffeemachinetype mugtype) (cancontain microwavetype tomatotype) (cancontain microwavetype appletype) (cancontain microwavetype mugtype) (pickupable cellphone_1) (pickupable tomato_2) (cleanable tomato_2) (heatable tomato_2) (coolable tomato_2) (sliceable tomato_2) (pickupable cellphone_3) (pickupable apple_4) (cleanable apple_4) (heatable apple_4) (coolable apple_4) (sliceable apple_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation towelholder_1 location3) (receptacleatlocation fridge_2 location5) (receptacleatlocation sofa_3 location2) (receptacleatlocation coffeemachine_4 location3) (receptacleatlocation coffeemachine_5 location2) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location4) (inreceptacle cellphone_1 sofa_3) (inreceptacle tomato_2 microwave_6) (inreceptacle cellphone_3 sofa_3) (inreceptacle apple_4 microwave_6) (inreceptacle mug_5 coffeemachine_4) (objectatlocation cellphone_1 location2) (objectatlocation tomato_2 location1) (objectatlocation cellphone_3 location2) (objectatlocation apple_4 location1) (objectatlocation mug_5 location3) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 tomatotype) (receptacletype_0 ?r microwavetype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 appletype) (receptacletype_0 ?r microwavetype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
