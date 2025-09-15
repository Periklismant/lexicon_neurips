(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   coffeetabletype bedtype drawertype carttype diningtabletype - receptacletype
   plungertype lettucetype keychaintype forktype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   coffeetable_1 bed_2 drawer_3 cart_4 diningtable_5 microwave_6 fridge_7 - receptacle
   plunger_1 lettuce_2 keychain_3 fork_4 mug_5 - obj
 )
 (:init (receptacletype_0 coffeetable_1 coffeetabletype) (receptacletype_0 bed_2 bedtype) (receptacletype_0 drawer_3 drawertype) (receptacletype_0 cart_4 carttype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 plunger_1 plungertype) (objecttype_0 lettuce_2 lettucetype) (objecttype_0 keychain_3 keychaintype) (objecttype_0 fork_4 forktype) (objecttype_0 mug_5 mugtype) (cancontain coffeetabletype lettucetype) (cancontain coffeetabletype keychaintype) (cancontain coffeetabletype forktype) (cancontain coffeetabletype mugtype) (cancontain drawertype keychaintype) (cancontain drawertype forktype) (cancontain carttype plungertype) (cancontain carttype mugtype) (cancontain diningtabletype lettucetype) (cancontain diningtabletype keychaintype) (cancontain diningtabletype forktype) (cancontain diningtabletype mugtype) (cancontain microwavetype mugtype) (cancontain fridgetype lettucetype) (cancontain fridgetype mugtype) (pickupable plunger_1) (pickupable lettuce_2) (cleanable lettuce_2) (coolable lettuce_2) (sliceable lettuce_2) (pickupable keychain_3) (pickupable fork_4) (cleanable fork_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation coffeetable_1 location5) (receptacleatlocation bed_2 location5) (receptacleatlocation drawer_3 location3) (receptacleatlocation cart_4 location1) (receptacleatlocation diningtable_5 location1) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location3) (inreceptacle plunger_1 cart_4) (inreceptacle lettuce_2 diningtable_5) (inreceptacle keychain_3 drawer_3) (inreceptacle fork_4 drawer_3) (inreceptacle mug_5 microwave_6) (objectatlocation plunger_1 location1) (objectatlocation lettuce_2 location1) (objectatlocation keychain_3 location3) (objectatlocation fork_4 location3) (objectatlocation mug_5 location4) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o lettucetype) (receptacletype_0 ?r diningtabletype))))))
 (:metric minimize (total-cost))
)
