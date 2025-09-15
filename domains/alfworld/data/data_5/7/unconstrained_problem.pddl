(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype carttype toiletpaperhangertype safetype cabinettype - receptacletype
   candletype potatotype lettucetype platetype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   towelholder_1 cart_2 toiletpaperhanger_3 safe_4 cabinet_5 microwave_6 fridge_7 - receptacle
   candle_1 potato_2 lettuce_3 plate_4 mug_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 cart_2 carttype) (receptacletype_0 toiletpaperhanger_3 toiletpaperhangertype) (receptacletype_0 safe_4 safetype) (receptacletype_0 cabinet_5 cabinettype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 candle_1 candletype) (objecttype_0 potato_2 potatotype) (objecttype_0 lettuce_3 lettucetype) (objecttype_0 plate_4 platetype) (objecttype_0 mug_5 mugtype) (cancontain carttype candletype) (cancontain carttype mugtype) (cancontain cabinettype candletype) (cancontain cabinettype platetype) (cancontain cabinettype mugtype) (cancontain microwavetype potatotype) (cancontain microwavetype platetype) (cancontain microwavetype mugtype) (cancontain fridgetype potatotype) (cancontain fridgetype lettucetype) (cancontain fridgetype platetype) (cancontain fridgetype mugtype) (pickupable candle_1) (pickupable potato_2) (cleanable potato_2) (heatable potato_2) (coolable potato_2) (sliceable potato_2) (pickupable lettuce_3) (cleanable lettuce_3) (coolable lettuce_3) (sliceable lettuce_3) (pickupable plate_4) (isreceptacleobject plate_4) (cleanable plate_4) (heatable plate_4) (coolable plate_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation towelholder_1 location1) (receptacleatlocation cart_2 location5) (receptacleatlocation toiletpaperhanger_3 location3) (receptacleatlocation safe_4 location3) (receptacleatlocation cabinet_5 location4) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle candle_1 cart_2) (inreceptacle potato_2 fridge_7) (inreceptacle lettuce_3 fridge_7) (inreceptacle plate_4 microwave_6) (inreceptacle mug_5 cart_2) (objectatlocation candle_1 location5) (objectatlocation potato_2 location3) (objectatlocation lettuce_3 location3) (objectatlocation plate_4 location2) (objectatlocation mug_5 location5) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (heatable ?o) (objecttype_0 ?o mugtype) (receptacletype_0 ?r fridgetype) (ishot ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
