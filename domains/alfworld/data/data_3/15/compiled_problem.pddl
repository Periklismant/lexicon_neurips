(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   towelholdertype safetype toastertype toilettype - receptacletype
   candletype winebottletype potatotype dishspongetype cuptype - objecttype
   location2 location4 - location
   towelholder_1 safe_2 toaster_3 toilet_4 fridge_5 microwave_6 fridge_7 - receptacle
   candle_1 winebottle_2 dishsponge_4 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 safe_2 safetype) (receptacletype_0 toaster_3 toastertype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 fridge_5 fridgetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 candle_1 candletype) (objecttype_0 winebottle_2 winebottletype) (objecttype_0 potato_3 potatotype) (objecttype_0 dishsponge_4 dishspongetype) (objecttype_0 cup_5 cuptype) (cancontain toilettype candletype) (cancontain toilettype dishspongetype) (cancontain fridgetype winebottletype) (cancontain fridgetype potatotype) (cancontain fridgetype cuptype) (cancontain microwavetype potatotype) (cancontain microwavetype cuptype) (pickupable candle_1) (pickupable winebottle_2) (pickupable potato_3) (cleanable potato_3) (heatable potato_3) (coolable potato_3) (sliceable potato_3) (pickupable dishsponge_4) (cleanable dishsponge_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation towelholder_1 location2) (receptacleatlocation safe_2 location2) (receptacleatlocation toaster_3 location1) (receptacleatlocation toilet_4 location1) (receptacleatlocation fridge_5 location2) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle candle_1 toilet_4) (inreceptacle winebottle_2 fridge_5) (inreceptacle potato_3 microwave_6) (inreceptacle dishsponge_4 toilet_4) (inreceptacle cup_5 fridge_5) (objectatlocation candle_1 location1) (objectatlocation winebottle_2 location2) (objectatlocation potato_3 location3) (objectatlocation dishsponge_4 location1) (objectatlocation cup_5 location2) (atlocation agent1 location2) (hold_1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 cuptype) (receptacletype_0 ?r_0 fridgetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_1) (hold_2) (hold_3)))
 (:metric minimize (total-cost))
)
