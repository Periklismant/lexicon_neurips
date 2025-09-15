(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   coffeetabletype garbagecantype tvstandtype towelholdertype - receptacletype
   platetype mugtype forktype appletype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   coffeetable_1 fridge_2 garbagecan_3 tvstand_4 towelholder_5 microwave_6 fridge_7 - receptacle
   plate_1 mug_2 fork_3 apple_4 plate_5 - obj
 )
 (:init (receptacletype_0 coffeetable_1 coffeetabletype) (receptacletype_0 fridge_2 fridgetype) (receptacletype_0 garbagecan_3 garbagecantype) (receptacletype_0 tvstand_4 tvstandtype) (receptacletype_0 towelholder_5 towelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 plate_1 platetype) (objecttype_0 mug_2 mugtype) (objecttype_0 fork_3 forktype) (objecttype_0 apple_4 appletype) (objecttype_0 plate_5 platetype) (cancontain coffeetabletype platetype) (cancontain coffeetabletype mugtype) (cancontain coffeetabletype forktype) (cancontain coffeetabletype appletype) (cancontain fridgetype platetype) (cancontain fridgetype mugtype) (cancontain fridgetype appletype) (cancontain garbagecantype appletype) (cancontain microwavetype platetype) (cancontain microwavetype mugtype) (cancontain microwavetype appletype) (pickupable plate_1) (isreceptacleobject plate_1) (cleanable plate_1) (heatable plate_1) (coolable plate_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (pickupable fork_3) (cleanable fork_3) (pickupable apple_4) (cleanable apple_4) (heatable apple_4) (coolable apple_4) (sliceable apple_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation coffeetable_1 location4) (receptacleatlocation fridge_2 location2) (receptacleatlocation garbagecan_3 location2) (receptacleatlocation tvstand_4 location3) (receptacleatlocation towelholder_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle plate_1 fridge_7) (inreceptacle mug_2 coffeetable_1) (inreceptacle fork_3 coffeetable_1) (inreceptacle apple_4 coffeetable_1) (inreceptacle plate_5 microwave_6) (objectatlocation plate_1 location4) (objectatlocation mug_2 location4) (objectatlocation fork_3 location4) (objectatlocation apple_4 location4) (objectatlocation plate_5 location3) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 forktype) (receptacletype_0 ?r coffeetabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 appletype) (receptacletype_0 ?r coffeetabletype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
