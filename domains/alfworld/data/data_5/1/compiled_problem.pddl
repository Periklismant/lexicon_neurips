(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   handtowelholdertype armchairtype laundryhampertype - receptacletype
   handtoweltype creditcardtype mugtype - objecttype
   location1 location2 - location
   handtowelholder_1 armchair_2 sinkbasin_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   handtowel_2 creditcard_3 - obj
 )
 (:init (receptacletype_0 handtowelholder_1 handtowelholdertype) (receptacletype_0 armchair_2 armchairtype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 sinkbasin_4 sinkbasintype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 knife_1 knifetype) (objecttype_0 handtowel_2 handtoweltype) (objecttype_0 creditcard_3 creditcardtype) (objecttype_0 mug_4 mugtype) (objecttype_0 mug_5 mugtype) (cancontain handtowelholdertype handtoweltype) (cancontain armchairtype creditcardtype) (cancontain microwavetype mugtype) (cancontain sinkbasintype knifetype) (cancontain sinkbasintype handtoweltype) (cancontain sinkbasintype mugtype) (cancontain fridgetype mugtype) (pickupable knife_1) (cleanable knife_1) (pickupable handtowel_2) (pickupable creditcard_3) (pickupable mug_4) (isreceptacleobject mug_4) (cleanable mug_4) (heatable mug_4) (coolable mug_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation handtowelholder_1 location2) (receptacleatlocation armchair_2 location2) (receptacleatlocation microwave_3 location5) (receptacleatlocation sinkbasin_4 location5) (receptacleatlocation laundryhamper_5 location2) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location1) (inreceptacle knife_1 sinkbasin_4) (inreceptacle handtowel_2 handtowelholder_1) (inreceptacle creditcard_3 armchair_2) (inreceptacle mug_4 fridge_7) (inreceptacle mug_5 sinkbasin_4) (objectatlocation knife_1 location5) (objectatlocation handtowel_2 location2) (objectatlocation creditcard_3 location2) (objectatlocation mug_4 location1) (objectatlocation mug_5 location5) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 mugtype) (receptacletype_0 ?r_0 sinkbasintype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 knifetype) (receptacletype_0 ?r_0 sinkbasintype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
