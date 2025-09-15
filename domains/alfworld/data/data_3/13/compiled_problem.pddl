(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   countertoptype laundryhampertype sofatype carttype - receptacletype
   spraybottletype tissueboxtype pentype winebottletype platetype - objecttype
   location1 location2 location3 location4 - location
   laundryhamper_2 sofa_3 cart_5 microwave_6 fridge_7 - receptacle
   plate_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 laundryhamper_4 laundryhampertype) (receptacletype_0 cart_5 carttype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 spraybottle_1 spraybottletype) (objecttype_0 tissuebox_2 tissueboxtype) (objecttype_0 pen_3 pentype) (objecttype_0 winebottle_4 winebottletype) (objecttype_0 plate_5 platetype) (cancontain countertoptype spraybottletype) (cancontain countertoptype tissueboxtype) (cancontain countertoptype pentype) (cancontain countertoptype winebottletype) (cancontain countertoptype platetype) (cancontain carttype spraybottletype) (cancontain carttype tissueboxtype) (cancontain microwavetype platetype) (cancontain fridgetype winebottletype) (cancontain fridgetype platetype) (pickupable spraybottle_1) (pickupable tissuebox_2) (pickupable pen_3) (pickupable winebottle_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation countertop_1 location2) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation sofa_3 location1) (receptacleatlocation laundryhamper_4 location4) (receptacleatlocation cart_5 location4) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location5) (inreceptacle spraybottle_1 countertop_1) (inreceptacle tissuebox_2 countertop_1) (inreceptacle pen_3 countertop_1) (inreceptacle winebottle_4 countertop_1) (inreceptacle plate_5 fridge_7) (objectatlocation spraybottle_1 location2) (objectatlocation tissuebox_2 location2) (objectatlocation pen_3 location2) (objectatlocation winebottle_4 location2) (objectatlocation plate_5 location5) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 tissueboxtype) (receptacletype_0 ?r_0 countertoptype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
