(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   towelholdertype carttype toiletpaperhangertype safetype cabinettype - receptacletype
   toiletpaperrolltype kettletype papertoweltype spraybottletype platetype - objecttype
   location4 - location
   toiletpaperhanger_3 safe_4 cabinet_5 microwave_6 fridge_7 - receptacle
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 cart_2 carttype) (receptacletype_0 toiletpaperhanger_3 toiletpaperhangertype) (receptacletype_0 safe_4 safetype) (receptacletype_0 cabinet_5 cabinettype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 toiletpaperroll_1 toiletpaperrolltype) (objecttype_0 kettle_2 kettletype) (objecttype_0 papertowel_3 papertoweltype) (objecttype_0 spraybottle_4 spraybottletype) (objecttype_0 plate_5 platetype) (cancontain carttype toiletpaperrolltype) (cancontain carttype papertoweltype) (cancontain carttype spraybottletype) (cancontain toiletpaperhangertype toiletpaperrolltype) (cancontain cabinettype toiletpaperrolltype) (cancontain cabinettype kettletype) (cancontain cabinettype spraybottletype) (cancontain cabinettype platetype) (cancontain microwavetype platetype) (cancontain fridgetype platetype) (pickupable toiletpaperroll_1) (pickupable kettle_2) (cleanable kettle_2) (pickupable papertowel_3) (pickupable spraybottle_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation towelholder_1 location2) (receptacleatlocation cart_2 location5) (receptacleatlocation toiletpaperhanger_3 location4) (receptacleatlocation safe_4 location1) (receptacleatlocation cabinet_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location3) (inreceptacle toiletpaperroll_1 cart_2) (inreceptacle kettle_2 cabinet_5) (inreceptacle papertowel_3 cart_2) (inreceptacle spraybottle_4 cabinet_5) (inreceptacle plate_5 cabinet_5) (objectatlocation toiletpaperroll_1 location5) (objectatlocation kettle_2 location5) (objectatlocation papertowel_3 location5) (objectatlocation spraybottle_4 location5) (objectatlocation plate_5 location5) (atlocation agent1 location4) (hold_1) (hold_3) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 fridgetype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_12) (hold_13)))
 (:metric minimize (total-cost))
)
