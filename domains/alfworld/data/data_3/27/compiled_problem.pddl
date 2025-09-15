(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bedtype drawertype bathtubbasintype sofatype desktype - receptacletype
   watchtype eggtype vasetype soapbottletype pottype - objecttype
   location1 location3 location5 - location
   bed_1 sofa_4 desk_5 microwave_6 fridge_7 - receptacle
   watch_1 egg_2 vase_3 soapbottle_4 pot_5 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 drawer_2 drawertype) (receptacletype_0 bathtubbasin_3 bathtubbasintype) (receptacletype_0 sofa_4 sofatype) (receptacletype_0 desk_5 desktype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 watch_1 watchtype) (objecttype_0 egg_2 eggtype) (objecttype_0 vase_3 vasetype) (objecttype_0 soapbottle_4 soapbottletype) (objecttype_0 pot_5 pottype) (cancontain drawertype watchtype) (cancontain drawertype soapbottletype) (cancontain desktype watchtype) (cancontain desktype vasetype) (cancontain desktype soapbottletype) (cancontain microwavetype eggtype) (cancontain fridgetype eggtype) (cancontain fridgetype pottype) (pickupable watch_1) (pickupable egg_2) (cleanable egg_2) (heatable egg_2) (coolable egg_2) (sliceable egg_2) (pickupable vase_3) (pickupable soapbottle_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation bed_1 location2) (receptacleatlocation drawer_2 location4) (receptacleatlocation bathtubbasin_3 location3) (receptacleatlocation sofa_4 location5) (receptacleatlocation desk_5 location2) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location5) (inreceptacle watch_1 drawer_2) (inreceptacle egg_2 microwave_6) (inreceptacle vase_3 desk_5) (inreceptacle soapbottle_4 drawer_2) (inreceptacle pot_5 fridge_7) (objectatlocation watch_1 location4) (objectatlocation egg_2 location1) (objectatlocation vase_3 location2) (objectatlocation soapbottle_4 location4) (objectatlocation pot_5 location5) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 watchtype) (receptacletype_0 ?r_0 drawertype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
