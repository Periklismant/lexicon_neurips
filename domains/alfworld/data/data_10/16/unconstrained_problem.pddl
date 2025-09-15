(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   garbagecantype toilettype handtowelholdertype - receptacletype
   mugtype penciltype kettletype soapbottletype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   garbagecan_1 toilet_2 handtowelholder_3 sinkbasin_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   mug_1 pencil_2 kettle_3 soapbottle_4 plate_5 - obj
 )
 (:init (receptacletype_0 garbagecan_1 garbagecantype) (receptacletype_0 toilet_2 toilettype) (receptacletype_0 handtowelholder_3 handtowelholdertype) (receptacletype_0 sinkbasin_4 sinkbasintype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 mug_1 mugtype) (objecttype_0 pencil_2 penciltype) (objecttype_0 kettle_3 kettletype) (objecttype_0 soapbottle_4 soapbottletype) (objecttype_0 plate_5 platetype) (cancontain garbagecantype penciltype) (cancontain garbagecantype soapbottletype) (cancontain toilettype soapbottletype) (cancontain sinkbasintype mugtype) (cancontain sinkbasintype kettletype) (cancontain sinkbasintype platetype) (cancontain microwavetype mugtype) (cancontain microwavetype platetype) (cancontain fridgetype mugtype) (cancontain fridgetype platetype) (pickupable mug_1) (isreceptacleobject mug_1) (cleanable mug_1) (heatable mug_1) (coolable mug_1) (pickupable pencil_2) (pickupable kettle_3) (cleanable kettle_3) (pickupable soapbottle_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation garbagecan_1 location3) (receptacleatlocation toilet_2 location2) (receptacleatlocation handtowelholder_3 location5) (receptacleatlocation sinkbasin_4 location3) (receptacleatlocation handtowelholder_5 location3) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location5) (inreceptacle mug_1 sinkbasin_4) (inreceptacle pencil_2 garbagecan_1) (inreceptacle kettle_3 sinkbasin_4) (inreceptacle soapbottle_4 garbagecan_1) (inreceptacle plate_5 sinkbasin_4) (objectatlocation mug_1 location3) (objectatlocation pencil_2 location3) (objectatlocation kettle_3 location3) (objectatlocation soapbottle_4 location3) (objectatlocation plate_5 location3) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o mugtype) (receptacletype_0 ?r microwavetype))))))
 (:metric minimize (total-cost))
)
