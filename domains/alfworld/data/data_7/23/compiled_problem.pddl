(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   towelholdertype bathtubbasintype desktype armchairtype countertoptype - receptacletype
   dishspongetype handtoweltype tomatotype mugtype - objecttype
   location1 - location
   towelholder_1 bathtubbasin_2 desk_3 armchair_4 countertop_5 microwave_6 - receptacle
   tomato_3 mug_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 desk_3 desktype) (receptacletype_0 armchair_4 armchairtype) (receptacletype_0 countertop_5 countertoptype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 dishsponge_1 dishspongetype) (objecttype_0 handtowel_2 handtoweltype) (objecttype_0 tomato_3 tomatotype) (objecttype_0 knife_4 knifetype) (objecttype_0 mug_5 mugtype) (cancontain bathtubbasintype dishspongetype) (cancontain bathtubbasintype handtoweltype) (cancontain desktype mugtype) (cancontain countertoptype dishspongetype) (cancontain countertoptype handtoweltype) (cancontain countertoptype tomatotype) (cancontain countertoptype knifetype) (cancontain countertoptype mugtype) (cancontain microwavetype tomatotype) (cancontain microwavetype mugtype) (cancontain fridgetype tomatotype) (cancontain fridgetype mugtype) (pickupable dishsponge_1) (cleanable dishsponge_1) (pickupable handtowel_2) (pickupable tomato_3) (cleanable tomato_3) (heatable tomato_3) (coolable tomato_3) (sliceable tomato_3) (pickupable knife_4) (cleanable knife_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation towelholder_1 location2) (receptacleatlocation bathtubbasin_2 location2) (receptacleatlocation desk_3 location5) (receptacleatlocation armchair_4 location1) (receptacleatlocation countertop_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location3) (inreceptacle dishsponge_1 bathtubbasin_2) (inreceptacle handtowel_2 countertop_5) (inreceptacle tomato_3 microwave_6) (inreceptacle knife_4 countertop_5) (inreceptacle mug_5 desk_3) (objectatlocation dishsponge_1 location2) (objectatlocation handtowel_2 location4) (objectatlocation tomato_3 location5) (objectatlocation knife_4 location4) (objectatlocation mug_5 location5) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 dishspongetype) (receptacletype_0 ?r_0 bathtubbasintype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
