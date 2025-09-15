(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   countertoptype laundryhampertype sofatype carttype - receptacletype
   spoontype handtoweltype spraybottletype creditcardtype pottype - objecttype
   location1 location4 - location
   laundryhamper_2 sofa_3 cart_5 microwave_6 fridge_7 - receptacle
   pot_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 laundryhamper_4 laundryhampertype) (receptacletype_0 cart_5 carttype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 spoon_1 spoontype) (objecttype_0 handtowel_2 handtoweltype) (objecttype_0 spraybottle_3 spraybottletype) (objecttype_0 creditcard_4 creditcardtype) (objecttype_0 pot_5 pottype) (cancontain countertoptype spoontype) (cancontain countertoptype handtoweltype) (cancontain countertoptype spraybottletype) (cancontain countertoptype creditcardtype) (cancontain countertoptype pottype) (cancontain sofatype creditcardtype) (cancontain carttype handtoweltype) (cancontain carttype spraybottletype) (cancontain fridgetype pottype) (pickupable spoon_1) (cleanable spoon_1) (pickupable handtowel_2) (pickupable spraybottle_3) (pickupable creditcard_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation countertop_1 location1) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation sofa_3 location4) (receptacleatlocation laundryhamper_4 location4) (receptacleatlocation cart_5 location3) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location3) (inreceptacle spoon_1 countertop_1) (inreceptacle handtowel_2 countertop_1) (inreceptacle spraybottle_3 cart_5) (inreceptacle creditcard_4 sofa_3) (inreceptacle pot_5 fridge_7) (objectatlocation spoon_1 location1) (objectatlocation handtowel_2 location1) (objectatlocation spraybottle_3 location3) (objectatlocation creditcard_4 location4) (objectatlocation pot_5 location3) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 handtoweltype) (receptacletype_0 ?r_0 countertoptype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
