(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   countertoptype diningtabletype bathtubbasintype - receptacletype
   appletype spatulatype candletype creditcardtype mugtype - objecttype
   location2 location3 - location
   countertop_1 microwave_2 countertop_3 diningtable_4 bathtubbasin_5 microwave_6 - receptacle
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 microwave_2 microwavetype) (receptacletype_0 countertop_3 countertoptype) (receptacletype_0 diningtable_4 diningtabletype) (receptacletype_0 bathtubbasin_5 bathtubbasintype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 apple_1 appletype) (objecttype_0 spatula_2 spatulatype) (objecttype_0 candle_3 candletype) (objecttype_0 creditcard_4 creditcardtype) (objecttype_0 mug_5 mugtype) (cancontain countertoptype appletype) (cancontain countertoptype spatulatype) (cancontain countertoptype candletype) (cancontain countertoptype creditcardtype) (cancontain countertoptype mugtype) (cancontain microwavetype appletype) (cancontain microwavetype mugtype) (cancontain diningtabletype appletype) (cancontain diningtabletype spatulatype) (cancontain diningtabletype candletype) (cancontain diningtabletype creditcardtype) (cancontain diningtabletype mugtype) (cancontain fridgetype appletype) (cancontain fridgetype mugtype) (pickupable apple_1) (cleanable apple_1) (heatable apple_1) (coolable apple_1) (sliceable apple_1) (pickupable spatula_2) (cleanable spatula_2) (pickupable candle_3) (pickupable creditcard_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation countertop_1 location3) (receptacleatlocation microwave_2 location5) (receptacleatlocation countertop_3 location5) (receptacleatlocation diningtable_4 location5) (receptacleatlocation bathtubbasin_5 location4) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location4) (inreceptacle apple_1 fridge_7) (inreceptacle spatula_2 countertop_1) (inreceptacle candle_3 countertop_3) (inreceptacle creditcard_4 countertop_1) (inreceptacle mug_5 countertop_3) (objectatlocation apple_1 location4) (objectatlocation spatula_2 location3) (objectatlocation candle_3 location5) (objectatlocation creditcard_4 location3) (objectatlocation mug_5 location5) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 candletype) (receptacletype_0 ?r_0 diningtabletype)))) (hold_0) (hold_1) (hold_3) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
