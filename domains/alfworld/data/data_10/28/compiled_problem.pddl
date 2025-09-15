(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   shelftype towelholdertype handtowelholdertype laundryhampertype countertoptype - receptacletype
   winebottletype tennisrackettype boxtype platetype - objecttype
   shelf_1 countertop_5 microwave_6 - receptacle
 )
 (:init (receptacletype_0 shelf_1 shelftype) (receptacletype_0 towelholder_2 towelholdertype) (receptacletype_0 handtowelholder_3 handtowelholdertype) (receptacletype_0 laundryhamper_4 laundryhampertype) (receptacletype_0 countertop_5 countertoptype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 winebottle_1 winebottletype) (objecttype_0 butterknife_2 butterknifetype) (objecttype_0 tennisracket_3 tennisrackettype) (objecttype_0 box_4 boxtype) (objecttype_0 plate_5 platetype) (cancontain shelftype winebottletype) (cancontain shelftype boxtype) (cancontain shelftype platetype) (cancontain countertoptype winebottletype) (cancontain countertoptype butterknifetype) (cancontain countertoptype tennisrackettype) (cancontain countertoptype boxtype) (cancontain countertoptype platetype) (cancontain microwavetype platetype) (cancontain fridgetype winebottletype) (cancontain fridgetype platetype) (pickupable winebottle_1) (pickupable butterknife_2) (cleanable butterknife_2) (pickupable tennisracket_3) (pickupable box_4) (isreceptacleobject box_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation shelf_1 location5) (receptacleatlocation towelholder_2 location2) (receptacleatlocation handtowelholder_3 location2) (receptacleatlocation laundryhamper_4 location5) (receptacleatlocation countertop_5 location3) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location3) (inreceptacle winebottle_1 countertop_5) (inreceptacle butterknife_2 countertop_5) (inreceptacle tennisracket_3 countertop_5) (inreceptacle box_4 shelf_1) (inreceptacle plate_5 countertop_5) (objectatlocation winebottle_1 location3) (objectatlocation butterknife_2 location3) (objectatlocation tennisracket_3 location3) (objectatlocation box_4 location5) (objectatlocation plate_5 location3) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 butterknifetype) (receptacletype_0 ?r_0 countertoptype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
