(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bathtubbasintype toiletpaperhangertype coffeetabletype toilettype - receptacletype
   watchtype mugtype appletype boxtype - objecttype
   location3 location4 - location
   bathtubbasin_1 toiletpaperhanger_2 coffeetable_3 toilet_4 bathtubbasin_5 microwave_6 fridge_7 - receptacle
   butterknife_2 mug_3 apple_4 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 coffeetable_3 coffeetabletype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 bathtubbasin_5 bathtubbasintype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 watch_1 watchtype) (objecttype_0 butterknife_2 butterknifetype) (objecttype_0 mug_3 mugtype) (objecttype_0 apple_4 appletype) (objecttype_0 box_5 boxtype) (cancontain coffeetabletype watchtype) (cancontain coffeetabletype butterknifetype) (cancontain coffeetabletype mugtype) (cancontain coffeetabletype appletype) (cancontain coffeetabletype boxtype) (cancontain microwavetype mugtype) (cancontain microwavetype appletype) (cancontain fridgetype mugtype) (cancontain fridgetype appletype) (pickupable watch_1) (pickupable butterknife_2) (cleanable butterknife_2) (pickupable mug_3) (isreceptacleobject mug_3) (cleanable mug_3) (heatable mug_3) (coolable mug_3) (pickupable apple_4) (cleanable apple_4) (heatable apple_4) (coolable apple_4) (sliceable apple_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation bathtubbasin_1 location4) (receptacleatlocation toiletpaperhanger_2 location4) (receptacleatlocation coffeetable_3 location2) (receptacleatlocation toilet_4 location2) (receptacleatlocation bathtubbasin_5 location1) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location1) (inreceptacle watch_1 coffeetable_3) (inreceptacle butterknife_2 coffeetable_3) (inreceptacle mug_3 microwave_6) (inreceptacle apple_4 fridge_7) (inreceptacle box_5 coffeetable_3) (objectatlocation watch_1 location2) (objectatlocation butterknife_2 location2) (objectatlocation mug_3 location5) (objectatlocation apple_4 location1) (objectatlocation box_5 location2) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 watchtype) (receptacletype_0 ?r_0 coffeetabletype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
