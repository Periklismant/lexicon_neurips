(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   diningtabletype ottomantype sidetabletype carttype - receptacletype
   tissueboxtype lettucetype plungertype wateringcantype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   diningtable_1 ottoman_2 sidetable_3 cart_4 diningtable_5 microwave_6 fridge_7 - receptacle
   tissuebox_1 lettuce_2 plunger_3 wateringcan_4 pot_5 - obj
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 ottoman_2 ottomantype) (receptacletype_0 sidetable_3 sidetabletype) (receptacletype_0 cart_4 carttype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tissuebox_1 tissueboxtype) (objecttype_0 lettuce_2 lettucetype) (objecttype_0 plunger_3 plungertype) (objecttype_0 wateringcan_4 wateringcantype) (objecttype_0 pot_5 pottype) (cancontain diningtabletype tissueboxtype) (cancontain diningtabletype lettucetype) (cancontain diningtabletype wateringcantype) (cancontain diningtabletype pottype) (cancontain sidetabletype tissueboxtype) (cancontain sidetabletype lettucetype) (cancontain sidetabletype wateringcantype) (cancontain sidetabletype pottype) (cancontain carttype tissueboxtype) (cancontain carttype plungertype) (cancontain fridgetype lettucetype) (cancontain fridgetype pottype) (pickupable tissuebox_1) (pickupable lettuce_2) (cleanable lettuce_2) (coolable lettuce_2) (sliceable lettuce_2) (pickupable plunger_3) (pickupable wateringcan_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation diningtable_1 location1) (receptacleatlocation ottoman_2 location3) (receptacleatlocation sidetable_3 location5) (receptacleatlocation cart_4 location5) (receptacleatlocation diningtable_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location2) (inreceptacle tissuebox_1 diningtable_1) (inreceptacle lettuce_2 sidetable_3) (inreceptacle plunger_3 cart_4) (inreceptacle wateringcan_4 diningtable_5) (inreceptacle pot_5 sidetable_3) (objectatlocation tissuebox_1 location1) (objectatlocation lettuce_2 location5) (objectatlocation plunger_3 location5) (objectatlocation wateringcan_4 location3) (objectatlocation pot_5 location5) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 lettucetype) (receptacletype_0 ?r_0 diningtabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 wateringcantype) (receptacletype_0 ?r_0 diningtabletype) (inreceptacle ?o2 ?r_0))))))))
 (:constraints (sometime (atlocation agent1 location3)) (sometime-before (atlocation agent1 location3) (or (objectatlocation tissuebox_1 location2) (atlocation agent1 location2))) (sometime (holds agent1 lettuce_2)) (sometime-before (holds agent1 lettuce_2) (or (atlocation agent1 location3) (objectatlocation tissuebox_1 location2))) (sometime (atlocation agent1 location5)) (sometime-after (atlocation agent1 location5) (or (checked ottoman_2) (atlocation agent1 location4))))
 (:metric minimize (total-cost))
)
