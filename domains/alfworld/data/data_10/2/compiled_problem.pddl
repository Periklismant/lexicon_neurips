(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bathtubbasintype coffeemachinetype - receptacletype
   platetype cuptype - objecttype
   bathtubbasin_1 coffeemachine_2 - receptacle
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 coffeemachine_2 coffeemachinetype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 plate_1 platetype) (objecttype_0 cup_2 cuptype) (cancontain microwavetype platetype) (cancontain microwavetype cuptype) (cancontain fridgetype platetype) (cancontain fridgetype cuptype) (pickupable plate_1) (isreceptacleobject plate_1) (cleanable plate_1) (heatable plate_1) (coolable plate_1) (pickupable cup_2) (isreceptacleobject cup_2) (cleanable cup_2) (heatable cup_2) (coolable cup_2) (receptacleatlocation bathtubbasin_1 location1) (receptacleatlocation coffeemachine_2 location1) (receptacleatlocation microwave_3 location2) (receptacleatlocation fridge_4 location2) (inreceptacle plate_1 fridge_4) (inreceptacle cup_2 fridge_4) (objectatlocation plate_1 location2) (objectatlocation cup_2 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 cuptype) (receptacletype_0 ?r_0 fridgetype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
