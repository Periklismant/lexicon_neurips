(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   carttype drawertype - receptacletype
   appletype mugtype - objecttype
   agent1 - agent
   location1 location2 - location
   cart_1 drawer_2 microwave_3 fridge_4 - receptacle
   apple_1 mug_2 - obj
 )
 (:init (receptacletype_0 cart_1 carttype) (receptacletype_0 drawer_2 drawertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 apple_1 appletype) (objecttype_0 mug_2 mugtype) (cancontain carttype mugtype) (cancontain microwavetype appletype) (cancontain microwavetype mugtype) (cancontain fridgetype appletype) (cancontain fridgetype mugtype) (pickupable apple_1) (cleanable apple_1) (heatable apple_1) (coolable apple_1) (sliceable apple_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (receptacleatlocation cart_1 location2) (receptacleatlocation drawer_2 location1) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location1) (inreceptacle apple_1 fridge_4) (inreceptacle mug_2 cart_1) (objectatlocation apple_1 location1) (objectatlocation mug_2 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 appletype) (receptacletype_0 ?r_0 fridgetype))))))
 (:constraints (sometime (and (holdsany agent1) (holds agent1 apple_1))) (sometime (or (holds agent1 apple_1) (checked drawer_2))) (sometime (checked fridge_4)) (sometime (holdsany agent1)) (sometime (checked location2)) (sometime (checked microwave_3)) (sometime (or (atlocation agent1 location2) (checked agent1))) (sometime (holds agent1 apple_1)) (sometime (or (atlocation agent1 location2) (inreceptacleobject apple_1 mug_2))) (sometime (atlocation agent1 location2)))
 (:metric minimize (total-cost))
)
