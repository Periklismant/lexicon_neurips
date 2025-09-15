(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   desktype laundryhampertype handtowelholdertype carttype - receptacletype
   wateringcantype platetype statuetype plungertype pottype - objecttype
   desk_1 laundryhamper_2 handtowelholder_3 cart_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   plunger_4 pot_5 - obj
 )
 (:init (receptacletype_0 desk_1 desktype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 handtowelholder_3 handtowelholdertype) (receptacletype_0 cart_4 carttype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 wateringcan_1 wateringcantype) (objecttype_0 plate_2 platetype) (objecttype_0 statue_3 statuetype) (objecttype_0 plunger_4 plungertype) (objecttype_0 pot_5 pottype) (cancontain desktype wateringcantype) (cancontain desktype platetype) (cancontain desktype statuetype) (cancontain carttype statuetype) (cancontain carttype plungertype) (cancontain microwavetype platetype) (cancontain fridgetype platetype) (cancontain fridgetype pottype) (pickupable wateringcan_1) (pickupable plate_2) (isreceptacleobject plate_2) (cleanable plate_2) (heatable plate_2) (coolable plate_2) (pickupable statue_3) (pickupable plunger_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation desk_1 location1) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation handtowelholder_3 location4) (receptacleatlocation cart_4 location5) (receptacleatlocation handtowelholder_5 location3) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location5) (inreceptacle wateringcan_1 desk_1) (inreceptacle plate_2 fridge_7) (inreceptacle statue_3 cart_4) (inreceptacle plunger_4 cart_4) (inreceptacle pot_5 fridge_7) (objectatlocation wateringcan_1 location1) (objectatlocation plate_2 location5) (objectatlocation statue_3 location5) (objectatlocation plunger_4 location5) (objectatlocation pot_5 location5) (atlocation agent1 location5) (hold_3) (hold_6) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 microwavetype)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7)))
 (:metric minimize (total-cost))
)
