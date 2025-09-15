(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   carttype drawertype - receptacletype
   appletype mugtype - objecttype
   location1 - location
   cart_1 - receptacle
 )
 (:init (receptacletype_0 cart_1 carttype) (receptacletype_0 drawer_2 drawertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 apple_1 appletype) (objecttype_0 mug_2 mugtype) (cancontain carttype mugtype) (cancontain microwavetype appletype) (cancontain microwavetype mugtype) (cancontain fridgetype appletype) (cancontain fridgetype mugtype) (pickupable apple_1) (cleanable apple_1) (heatable apple_1) (coolable apple_1) (sliceable apple_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (receptacleatlocation cart_1 location2) (receptacleatlocation drawer_2 location1) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location1) (inreceptacle apple_1 fridge_4) (inreceptacle mug_2 cart_1) (objectatlocation apple_1 location1) (objectatlocation mug_2 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 appletype) (receptacletype_0 ?r_0 fridgetype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
