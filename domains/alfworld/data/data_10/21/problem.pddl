(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   armchairtype carttype bathtubbasintype ottomantype - receptacletype
   handtoweltype potatotype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   armchair_1 cart_2 bathtubbasin_3 fridge_4 ottoman_5 microwave_6 fridge_7 - receptacle
   handtowel_1 potato_2 pot_3 potato_4 pot_5 - obj
 )
 (:init (receptacletype_0 armchair_1 armchairtype) (receptacletype_0 cart_2 carttype) (receptacletype_0 bathtubbasin_3 bathtubbasintype) (receptacletype_0 fridge_4 fridgetype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 handtowel_1 handtoweltype) (objecttype_0 potato_2 potatotype) (objecttype_0 pot_3 pottype) (objecttype_0 potato_4 potatotype) (objecttype_0 pot_5 pottype) (cancontain carttype handtoweltype) (cancontain bathtubbasintype handtoweltype) (cancontain fridgetype potatotype) (cancontain fridgetype pottype) (cancontain microwavetype potatotype) (pickupable handtowel_1) (pickupable potato_2) (cleanable potato_2) (heatable potato_2) (coolable potato_2) (sliceable potato_2) (pickupable pot_3) (isreceptacleobject pot_3) (cleanable pot_3) (coolable pot_3) (pickupable potato_4) (cleanable potato_4) (heatable potato_4) (coolable potato_4) (sliceable potato_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation armchair_1 location3) (receptacleatlocation cart_2 location5) (receptacleatlocation bathtubbasin_3 location4) (receptacleatlocation fridge_4 location3) (receptacleatlocation ottoman_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location5) (inreceptacle handtowel_1 bathtubbasin_3) (inreceptacle potato_2 microwave_6) (inreceptacle pot_3 fridge_7) (inreceptacle potato_4 fridge_7) (inreceptacle pot_5 fridge_4) (objectatlocation handtowel_1 location4) (objectatlocation potato_2 location5) (objectatlocation pot_3 location5) (objectatlocation potato_4 location5) (objectatlocation pot_5 location3) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pottype) (receptacletype_0 ?r_0 fridgetype))))))
 (:constraints (sometime (or (holds agent1 handtowel_1) (objectatlocation handtowel_1 location5))) (sometime (or (atlocation agent1 location4) (objectatlocation handtowel_1 location1))) (sometime (or (objectatlocation pot_3 location2) (holds agent1 potato_2))) (sometime (or (holds agent1 potato_4) (objectatlocation handtowel_1 location1))) (sometime (or (checked location3) (atlocation agent1 location1))) (sometime (or (atlocation agent1 location5) (holds agent1 handtowel_1))) (sometime (or (atlocation agent1 location3) (objectatlocation potato_4 location3))) (sometime (or (checked agent1) (objectatlocation pot_3 location2))) (sometime (checked location5)) (sometime (or (objectatlocation potato_2 location3) (objectatlocation handtowel_1 location1))))
 (:metric minimize (total-cost))
)
