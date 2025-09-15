(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   laundryhampertype - receptacletype
   pottype mugtype - objecttype
   laundryhamper_2 fridge_4 - receptacle
 )
 (:init (receptacletype_0 fridge_1 fridgetype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 pot_1 pottype) (objecttype_0 mug_2 mugtype) (cancontain fridgetype pottype) (cancontain fridgetype mugtype) (cancontain microwavetype mugtype) (pickupable pot_1) (isreceptacleobject pot_1) (cleanable pot_1) (coolable pot_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (receptacleatlocation fridge_1 location2) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location1) (inreceptacle pot_1 fridge_1) (inreceptacle mug_2 fridge_4) (objectatlocation pot_1 location2) (objectatlocation mug_2 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pottype) (receptacletype_0 ?r_0 fridgetype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
