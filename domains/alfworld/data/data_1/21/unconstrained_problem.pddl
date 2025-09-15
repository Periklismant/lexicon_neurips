(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   cabinettype tvstandtype toiletpaperhangertype sidetabletype - receptacletype
   papertoweltype cellphonetype boxtype soapbottletype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   cabinet_1 tvstand_2 toiletpaperhanger_3 sidetable_4 fridge_5 microwave_6 fridge_7 - receptacle
   papertowel_1 cellphone_2 box_3 soapbottle_4 box_5 - obj
 )
 (:init (receptacletype_0 cabinet_1 cabinettype) (receptacletype_0 tvstand_2 tvstandtype) (receptacletype_0 toiletpaperhanger_3 toiletpaperhangertype) (receptacletype_0 sidetable_4 sidetabletype) (receptacletype_0 fridge_5 fridgetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 papertowel_1 papertoweltype) (objecttype_0 cellphone_2 cellphonetype) (objecttype_0 box_3 boxtype) (objecttype_0 soapbottle_4 soapbottletype) (objecttype_0 box_5 boxtype) (cancontain cabinettype boxtype) (cancontain cabinettype soapbottletype) (cancontain sidetabletype papertoweltype) (cancontain sidetabletype cellphonetype) (cancontain sidetabletype boxtype) (cancontain sidetabletype soapbottletype) (pickupable papertowel_1) (pickupable cellphone_2) (pickupable box_3) (isreceptacleobject box_3) (pickupable soapbottle_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation cabinet_1 location5) (receptacleatlocation tvstand_2 location2) (receptacleatlocation toiletpaperhanger_3 location3) (receptacleatlocation sidetable_4 location5) (receptacleatlocation fridge_5 location5) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location4) (inreceptacle papertowel_1 sidetable_4) (inreceptacle cellphone_2 sidetable_4) (inreceptacle box_3 sidetable_4) (inreceptacle soapbottle_4 cabinet_1) (inreceptacle box_5 cabinet_1) (objectatlocation papertowel_1 location5) (objectatlocation cellphone_2 location5) (objectatlocation box_3 location5) (objectatlocation soapbottle_4 location5) (objectatlocation box_5 location5) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 papertoweltype) (receptacletype_0 ?r sidetabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 boxtype) (receptacletype_0 ?r sidetabletype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
