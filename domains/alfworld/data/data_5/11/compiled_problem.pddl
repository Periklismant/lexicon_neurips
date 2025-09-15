(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   drawertype coffeetabletype bedtype garbagecantype armchairtype - receptacletype
   candletype breadtype kettletype pottype platetype - objecttype
   location3 - location
   drawer_1 coffeetable_2 bed_3 garbagecan_4 armchair_5 fridge_7 - receptacle
   bread_2 kettle_3 - obj
 )
 (:init (receptacletype_0 drawer_1 drawertype) (receptacletype_0 coffeetable_2 coffeetabletype) (receptacletype_0 bed_3 bedtype) (receptacletype_0 garbagecan_4 garbagecantype) (receptacletype_0 armchair_5 armchairtype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 candle_1 candletype) (objecttype_0 bread_2 breadtype) (objecttype_0 kettle_3 kettletype) (objecttype_0 pot_4 pottype) (objecttype_0 plate_5 platetype) (cancontain drawertype candletype) (cancontain coffeetabletype candletype) (cancontain coffeetabletype breadtype) (cancontain coffeetabletype kettletype) (cancontain coffeetabletype pottype) (cancontain coffeetabletype platetype) (cancontain garbagecantype breadtype) (cancontain microwavetype breadtype) (cancontain microwavetype platetype) (cancontain fridgetype breadtype) (cancontain fridgetype pottype) (cancontain fridgetype platetype) (pickupable candle_1) (pickupable bread_2) (heatable bread_2) (coolable bread_2) (sliceable bread_2) (pickupable kettle_3) (cleanable kettle_3) (pickupable pot_4) (isreceptacleobject pot_4) (cleanable pot_4) (coolable pot_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation drawer_1 location5) (receptacleatlocation coffeetable_2 location4) (receptacleatlocation bed_3 location5) (receptacleatlocation garbagecan_4 location3) (receptacleatlocation armchair_5 location3) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location2) (inreceptacle candle_1 coffeetable_2) (inreceptacle bread_2 microwave_6) (inreceptacle kettle_3 coffeetable_2) (inreceptacle pot_4 fridge_7) (inreceptacle plate_5 fridge_7) (objectatlocation candle_1 location4) (objectatlocation bread_2 location5) (objectatlocation kettle_3 location4) (objectatlocation pot_4 location2) (objectatlocation plate_5 location2) (atlocation agent1 location2) (hold_1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pottype) (receptacletype_0 ?r_0 coffeetabletype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6)))
 (:metric minimize (total-cost))
)
