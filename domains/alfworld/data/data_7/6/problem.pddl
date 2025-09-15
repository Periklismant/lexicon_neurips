(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   diningtabletype bathtubbasintype garbagecantype drawertype coffeetabletype - receptacletype
   mugtype platetype pentype saltshakertype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   diningtable_1 bathtubbasin_2 garbagecan_3 drawer_4 coffeetable_5 microwave_6 fridge_7 - receptacle
   mug_1 plate_2 pen_3 saltshaker_4 cup_5 - obj
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 garbagecan_3 garbagecantype) (receptacletype_0 drawer_4 drawertype) (receptacletype_0 coffeetable_5 coffeetabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 mug_1 mugtype) (objecttype_0 plate_2 platetype) (objecttype_0 pen_3 pentype) (objecttype_0 saltshaker_4 saltshakertype) (objecttype_0 cup_5 cuptype) (cancontain diningtabletype mugtype) (cancontain diningtabletype platetype) (cancontain diningtabletype pentype) (cancontain diningtabletype saltshakertype) (cancontain diningtabletype cuptype) (cancontain garbagecantype pentype) (cancontain drawertype pentype) (cancontain drawertype saltshakertype) (cancontain coffeetabletype mugtype) (cancontain coffeetabletype platetype) (cancontain coffeetabletype pentype) (cancontain coffeetabletype saltshakertype) (cancontain coffeetabletype cuptype) (cancontain microwavetype mugtype) (cancontain microwavetype platetype) (cancontain microwavetype cuptype) (cancontain fridgetype mugtype) (cancontain fridgetype platetype) (cancontain fridgetype cuptype) (pickupable mug_1) (isreceptacleobject mug_1) (cleanable mug_1) (heatable mug_1) (coolable mug_1) (pickupable plate_2) (isreceptacleobject plate_2) (cleanable plate_2) (heatable plate_2) (coolable plate_2) (pickupable pen_3) (pickupable saltshaker_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation diningtable_1 location2) (receptacleatlocation bathtubbasin_2 location5) (receptacleatlocation garbagecan_3 location3) (receptacleatlocation drawer_4 location5) (receptacleatlocation coffeetable_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location4) (inreceptacle mug_1 microwave_6) (inreceptacle plate_2 diningtable_1) (inreceptacle pen_3 drawer_4) (inreceptacle saltshaker_4 drawer_4) (inreceptacle cup_5 microwave_6) (objectatlocation mug_1 location2) (objectatlocation plate_2 location2) (objectatlocation pen_3 location5) (objectatlocation saltshaker_4 location5) (objectatlocation cup_5 location2) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 saltshakertype) (receptacletype_0 ?r_0 drawertype))))))
 (:constraints (sometime (holds agent1 pen_3)) (sometime (checked drawer_4)) (sometime (or (holds agent1 plate_2) (objectatlocation saltshaker_4 location1))) (sometime (or (checked plate_2) (atlocation agent1 location1))) (sometime (objectatlocation cup_5 location4)) (sometime (checked location3)) (sometime (or (atlocation agent1 location2) (checked mug_1))))
 (:metric minimize (total-cost))
)
