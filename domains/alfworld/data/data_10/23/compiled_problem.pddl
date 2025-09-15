(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   coffeetabletype garbagecantype tvstandtype towelholdertype - receptacletype
   platetype mugtype forktype appletype - objecttype
   coffeetable_1 fridge_2 garbagecan_3 tvstand_4 microwave_6 - receptacle
   apple_4 plate_5 - obj
 )
 (:init (receptacletype_0 coffeetable_1 coffeetabletype) (receptacletype_0 fridge_2 fridgetype) (receptacletype_0 garbagecan_3 garbagecantype) (receptacletype_0 tvstand_4 tvstandtype) (receptacletype_0 towelholder_5 towelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 plate_1 platetype) (objecttype_0 mug_2 mugtype) (objecttype_0 fork_3 forktype) (objecttype_0 apple_4 appletype) (objecttype_0 plate_5 platetype) (cancontain coffeetabletype platetype) (cancontain coffeetabletype mugtype) (cancontain coffeetabletype forktype) (cancontain coffeetabletype appletype) (cancontain fridgetype platetype) (cancontain fridgetype mugtype) (cancontain fridgetype appletype) (cancontain garbagecantype appletype) (cancontain microwavetype platetype) (cancontain microwavetype mugtype) (cancontain microwavetype appletype) (pickupable plate_1) (isreceptacleobject plate_1) (cleanable plate_1) (heatable plate_1) (coolable plate_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (pickupable fork_3) (cleanable fork_3) (pickupable apple_4) (cleanable apple_4) (heatable apple_4) (coolable apple_4) (sliceable apple_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation coffeetable_1 location4) (receptacleatlocation fridge_2 location2) (receptacleatlocation garbagecan_3 location2) (receptacleatlocation tvstand_4 location3) (receptacleatlocation towelholder_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle plate_1 fridge_7) (inreceptacle mug_2 coffeetable_1) (inreceptacle fork_3 coffeetable_1) (inreceptacle apple_4 coffeetable_1) (inreceptacle plate_5 microwave_6) (objectatlocation plate_1 location4) (objectatlocation mug_2 location4) (objectatlocation fork_3 location4) (objectatlocation apple_4 location4) (objectatlocation plate_5 location3) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 forktype) (receptacletype_0 ?r_0 coffeetabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 appletype) (receptacletype_0 ?r_0 coffeetabletype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
