(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype carttype toiletpaperhangertype safetype cabinettype - receptacletype
   toweltype newspapertype mugtype winebottletype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   towelholder_1 cart_2 toiletpaperhanger_3 safe_4 cabinet_5 microwave_6 fridge_7 - receptacle
   towel_1 newspaper_2 mug_3 winebottle_4 plate_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 cart_2 carttype) (receptacletype_0 toiletpaperhanger_3 toiletpaperhangertype) (receptacletype_0 safe_4 safetype) (receptacletype_0 cabinet_5 cabinettype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 towel_1 toweltype) (objecttype_0 newspaper_2 newspapertype) (objecttype_0 mug_3 mugtype) (objecttype_0 winebottle_4 winebottletype) (objecttype_0 plate_5 platetype) (cancontain towelholdertype toweltype) (cancontain carttype mugtype) (cancontain cabinettype newspapertype) (cancontain cabinettype mugtype) (cancontain cabinettype winebottletype) (cancontain cabinettype platetype) (cancontain microwavetype mugtype) (cancontain microwavetype platetype) (cancontain fridgetype mugtype) (cancontain fridgetype winebottletype) (cancontain fridgetype platetype) (pickupable towel_1) (pickupable newspaper_2) (pickupable mug_3) (isreceptacleobject mug_3) (cleanable mug_3) (heatable mug_3) (coolable mug_3) (pickupable winebottle_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation towelholder_1 location2) (receptacleatlocation cart_2 location5) (receptacleatlocation toiletpaperhanger_3 location4) (receptacleatlocation safe_4 location1) (receptacleatlocation cabinet_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location3) (inreceptacle towel_1 towelholder_1) (inreceptacle newspaper_2 cabinet_5) (inreceptacle mug_3 cabinet_5) (inreceptacle winebottle_4 cabinet_5) (inreceptacle plate_5 cabinet_5) (objectatlocation towel_1 location2) (objectatlocation newspaper_2 location5) (objectatlocation mug_3 location5) (objectatlocation winebottle_4 location5) (objectatlocation plate_5 location5) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (heatable ?o) (objecttype_0 ?o mugtype) (receptacletype_0 ?r cabinettype) (ishot ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
