(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   diningtabletype handtowelholdertype - receptacletype
   kettletype cuptype - objecttype
   diningtable_1 fridge_4 - receptacle
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 handtowelholder_2 handtowelholdertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 kettle_1 kettletype) (objecttype_0 cup_2 cuptype) (cancontain diningtabletype kettletype) (cancontain diningtabletype cuptype) (cancontain microwavetype cuptype) (cancontain fridgetype cuptype) (pickupable kettle_1) (cleanable kettle_1) (pickupable cup_2) (isreceptacleobject cup_2) (cleanable cup_2) (heatable cup_2) (coolable cup_2) (receptacleatlocation diningtable_1 location1) (receptacleatlocation handtowelholder_2 location1) (receptacleatlocation microwave_3 location2) (receptacleatlocation fridge_4 location1) (inreceptacle kettle_1 diningtable_1) (inreceptacle cup_2 fridge_4) (objectatlocation kettle_1 location1) (objectatlocation cup_2 location1) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 kettletype) (receptacletype_0 ?r_0 diningtabletype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
