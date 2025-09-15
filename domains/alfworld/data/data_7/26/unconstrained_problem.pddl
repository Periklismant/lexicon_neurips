(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   tvstandtype cabinettype safetype carttype diningtabletype - receptacletype
   toiletpapertype kettletype boxtype dishspongetype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   tvstand_1 cabinet_2 safe_3 cart_4 diningtable_5 microwave_6 fridge_7 - receptacle
   toiletpaper_1 kettle_2 box_3 dishsponge_4 pot_5 - obj
 )
 (:init (receptacletype_0 tvstand_1 tvstandtype) (receptacletype_0 cabinet_2 cabinettype) (receptacletype_0 safe_3 safetype) (receptacletype_0 cart_4 carttype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 toiletpaper_1 toiletpapertype) (objecttype_0 kettle_2 kettletype) (objecttype_0 box_3 boxtype) (objecttype_0 dishsponge_4 dishspongetype) (objecttype_0 pot_5 pottype) (cancontain cabinettype toiletpapertype) (cancontain cabinettype kettletype) (cancontain cabinettype boxtype) (cancontain cabinettype dishspongetype) (cancontain cabinettype pottype) (cancontain carttype toiletpapertype) (cancontain carttype dishspongetype) (cancontain diningtabletype toiletpapertype) (cancontain diningtabletype kettletype) (cancontain diningtabletype boxtype) (cancontain diningtabletype dishspongetype) (cancontain diningtabletype pottype) (cancontain fridgetype pottype) (pickupable toiletpaper_1) (pickupable kettle_2) (cleanable kettle_2) (pickupable box_3) (isreceptacleobject box_3) (pickupable dishsponge_4) (cleanable dishsponge_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation tvstand_1 location2) (receptacleatlocation cabinet_2 location3) (receptacleatlocation safe_3 location4) (receptacleatlocation cart_4 location2) (receptacleatlocation diningtable_5 location2) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location3) (inreceptacle toiletpaper_1 diningtable_5) (inreceptacle kettle_2 diningtable_5) (inreceptacle box_3 cabinet_2) (inreceptacle dishsponge_4 cabinet_2) (inreceptacle pot_5 cabinet_2) (objectatlocation toiletpaper_1 location2) (objectatlocation kettle_2 location2) (objectatlocation box_3 location3) (objectatlocation dishsponge_4 location3) (objectatlocation pot_5 location3) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o dishspongetype) (receptacletype_0 ?r diningtabletype))))))
 (:metric minimize (total-cost))
)
