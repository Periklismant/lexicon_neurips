(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   safetype cabinettype - receptacletype
   soapbartype wateringcantype boxtype - objecttype
   location1 location2 - location
   safe_1 microwave_2 cabinet_3 microwave_4 fridge_5 - receptacle
   box_3 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 microwave_2 microwavetype) (receptacletype_0 cabinet_3 cabinettype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 soapbar_1 soapbartype) (objecttype_0 wateringcan_2 wateringcantype) (objecttype_0 box_3 boxtype) (cancontain cabinettype soapbartype) (cancontain cabinettype wateringcantype) (cancontain cabinettype boxtype) (pickupable soapbar_1) (cleanable soapbar_1) (pickupable wateringcan_2) (pickupable box_3) (isreceptacleobject box_3) (receptacleatlocation safe_1 location3) (receptacleatlocation microwave_2 location2) (receptacleatlocation cabinet_3 location1) (receptacleatlocation microwave_4 location1) (receptacleatlocation fridge_5 location3) (inreceptacle soapbar_1 cabinet_3) (inreceptacle wateringcan_2 cabinet_3) (inreceptacle box_3 cabinet_3) (objectatlocation soapbar_1 location1) (objectatlocation wateringcan_2 location1) (objectatlocation box_3 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 wateringcantype) (receptacletype_0 ?r_0 cabinettype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 boxtype) (receptacletype_0 ?r_0 cabinettype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
