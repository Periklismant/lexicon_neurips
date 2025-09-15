(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   toilettype coffeetabletype - receptacletype
   lettucetype spatulatype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 - location
   toilet_1 coffeetable_2 coffeetable_3 microwave_4 fridge_5 - receptacle
   lettuce_1 spatula_2 cup_3 - obj
 )
 (:init (receptacletype_0 toilet_1 toilettype) (receptacletype_0 coffeetable_2 coffeetabletype) (receptacletype_0 coffeetable_3 coffeetabletype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 lettuce_1 lettucetype) (objecttype_0 spatula_2 spatulatype) (objecttype_0 cup_3 cuptype) (cancontain coffeetabletype lettucetype) (cancontain coffeetabletype spatulatype) (cancontain coffeetabletype cuptype) (cancontain microwavetype cuptype) (cancontain fridgetype lettucetype) (cancontain fridgetype cuptype) (pickupable lettuce_1) (cleanable lettuce_1) (coolable lettuce_1) (sliceable lettuce_1) (pickupable spatula_2) (cleanable spatula_2) (pickupable cup_3) (isreceptacleobject cup_3) (cleanable cup_3) (heatable cup_3) (coolable cup_3) (receptacleatlocation toilet_1 location3) (receptacleatlocation coffeetable_2 location2) (receptacleatlocation coffeetable_3 location2) (receptacleatlocation microwave_4 location1) (receptacleatlocation fridge_5 location3) (inreceptacle lettuce_1 coffeetable_2) (inreceptacle spatula_2 coffeetable_3) (inreceptacle cup_3 coffeetable_3) (objectatlocation lettuce_1 location2) (objectatlocation spatula_2 location2) (objectatlocation cup_3 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 spatulatype) (receptacletype_0 ?r_0 coffeetabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 cuptype) (receptacletype_0 ?r_0 coffeetabletype) (inreceptacle ?o2 ?r_0))))))))
 (:constraints (sometime (holdsany agent1)) (sometime (atlocation agent1 location3)) (sometime (and (atlocation agent1 location3) (objectatlocation cup_3 location3))))
 (:metric minimize (total-cost))
)
