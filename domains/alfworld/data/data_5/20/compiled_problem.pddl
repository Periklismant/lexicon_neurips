(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   diningtabletype bathtubbasintype garbagecantype drawertype coffeetabletype - receptacletype
   potatotype penciltype keychaintype pottype cuptype - objecttype
   location2 - location
   diningtable_1 bathtubbasin_2 garbagecan_3 coffeetable_5 microwave_6 fridge_7 - receptacle
   pencil_2 cup_5 - obj
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 garbagecan_3 garbagecantype) (receptacletype_0 drawer_4 drawertype) (receptacletype_0 coffeetable_5 coffeetabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 potato_1 potatotype) (objecttype_0 pencil_2 penciltype) (objecttype_0 keychain_3 keychaintype) (objecttype_0 pot_4 pottype) (objecttype_0 cup_5 cuptype) (cancontain diningtabletype potatotype) (cancontain diningtabletype penciltype) (cancontain diningtabletype keychaintype) (cancontain diningtabletype pottype) (cancontain diningtabletype cuptype) (cancontain garbagecantype potatotype) (cancontain garbagecantype penciltype) (cancontain drawertype penciltype) (cancontain drawertype keychaintype) (cancontain coffeetabletype potatotype) (cancontain coffeetabletype penciltype) (cancontain coffeetabletype keychaintype) (cancontain coffeetabletype pottype) (cancontain coffeetabletype cuptype) (cancontain microwavetype potatotype) (cancontain microwavetype cuptype) (cancontain fridgetype potatotype) (cancontain fridgetype pottype) (cancontain fridgetype cuptype) (pickupable potato_1) (cleanable potato_1) (heatable potato_1) (coolable potato_1) (sliceable potato_1) (pickupable pencil_2) (pickupable keychain_3) (pickupable pot_4) (isreceptacleobject pot_4) (cleanable pot_4) (coolable pot_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation diningtable_1 location3) (receptacleatlocation bathtubbasin_2 location2) (receptacleatlocation garbagecan_3 location5) (receptacleatlocation drawer_4 location3) (receptacleatlocation coffeetable_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location2) (inreceptacle potato_1 microwave_6) (inreceptacle pencil_2 garbagecan_3) (inreceptacle keychain_3 diningtable_1) (inreceptacle pot_4 fridge_7) (inreceptacle cup_5 microwave_6) (objectatlocation potato_1 location3) (objectatlocation pencil_2 location5) (objectatlocation keychain_3 location3) (objectatlocation pot_4 location2) (objectatlocation cup_5 location3) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 penciltype) (receptacletype_0 ?r_0 garbagecantype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 potatotype) (receptacletype_0 ?r_0 garbagecantype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
