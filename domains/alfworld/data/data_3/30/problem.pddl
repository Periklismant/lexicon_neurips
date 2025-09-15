(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   garbagecantype bedtype safetype laundryhampertype carttype - receptacletype
   candletype vasetype clothtype papertoweltype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   garbagecan_1 bed_2 safe_3 laundryhamper_4 cart_5 microwave_6 fridge_7 - receptacle
   candle_1 vase_2 cloth_3 papertowel_4 mug_5 - obj
 )
 (:init (receptacletype_0 garbagecan_1 garbagecantype) (receptacletype_0 bed_2 bedtype) (receptacletype_0 safe_3 safetype) (receptacletype_0 laundryhamper_4 laundryhampertype) (receptacletype_0 cart_5 carttype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 candle_1 candletype) (objecttype_0 vase_2 vasetype) (objecttype_0 cloth_3 clothtype) (objecttype_0 papertowel_4 papertoweltype) (objecttype_0 mug_5 mugtype) (cancontain garbagecantype clothtype) (cancontain garbagecantype papertoweltype) (cancontain safetype vasetype) (cancontain laundryhampertype clothtype) (cancontain carttype candletype) (cancontain carttype vasetype) (cancontain carttype clothtype) (cancontain carttype papertoweltype) (cancontain carttype mugtype) (cancontain microwavetype mugtype) (cancontain fridgetype mugtype) (pickupable candle_1) (pickupable vase_2) (pickupable cloth_3) (cleanable cloth_3) (pickupable papertowel_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation garbagecan_1 location1) (receptacleatlocation bed_2 location3) (receptacleatlocation safe_3 location3) (receptacleatlocation laundryhamper_4 location4) (receptacleatlocation cart_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle candle_1 cart_5) (inreceptacle vase_2 cart_5) (inreceptacle cloth_3 cart_5) (inreceptacle papertowel_4 garbagecan_1) (inreceptacle mug_5 fridge_7) (objectatlocation candle_1 location3) (objectatlocation vase_2 location3) (objectatlocation cloth_3 location3) (objectatlocation papertowel_4 location1) (objectatlocation mug_5 location3) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 mugtype) (receptacletype_0 ?r_0 microwavetype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (holds agent1 mug_5)) (sometime-before (holds agent1 mug_5) (or (checked vase_2) (objectatlocation candle_1 location4))) (sometime (atlocation agent1 location2)) (sometime-before (atlocation agent1 location2) (or (objectatlocation vase_2 location5) (checked candle_1))) (sometime (or (checked candle_1) (checked fridge_7))))
 (:metric minimize (total-cost))
)
