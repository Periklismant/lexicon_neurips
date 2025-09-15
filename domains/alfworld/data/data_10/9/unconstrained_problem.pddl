(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   handtowelholdertype toiletpaperhangertype coffeetabletype tvstandtype sofatype - receptacletype
   wateringcantype penciltype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   handtowelholder_1 toiletpaperhanger_2 coffeetable_3 tvstand_4 sofa_5 microwave_6 fridge_7 - receptacle
   wateringcan_1 pencil_2 butterknife_3 cup_4 cup_5 - obj
 )
 (:init (receptacletype_0 handtowelholder_1 handtowelholdertype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 coffeetable_3 coffeetabletype) (receptacletype_0 tvstand_4 tvstandtype) (receptacletype_0 sofa_5 sofatype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 wateringcan_1 wateringcantype) (objecttype_0 pencil_2 penciltype) (objecttype_0 butterknife_3 butterknifetype) (objecttype_0 cup_4 cuptype) (objecttype_0 cup_5 cuptype) (cancontain coffeetabletype wateringcantype) (cancontain coffeetabletype penciltype) (cancontain coffeetabletype butterknifetype) (cancontain coffeetabletype cuptype) (cancontain microwavetype cuptype) (cancontain fridgetype cuptype) (pickupable wateringcan_1) (pickupable pencil_2) (pickupable butterknife_3) (cleanable butterknife_3) (pickupable cup_4) (isreceptacleobject cup_4) (cleanable cup_4) (heatable cup_4) (coolable cup_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation handtowelholder_1 location1) (receptacleatlocation toiletpaperhanger_2 location5) (receptacleatlocation coffeetable_3 location2) (receptacleatlocation tvstand_4 location4) (receptacleatlocation sofa_5 location4) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location2) (inreceptacle wateringcan_1 coffeetable_3) (inreceptacle pencil_2 coffeetable_3) (inreceptacle butterknife_3 coffeetable_3) (inreceptacle cup_4 coffeetable_3) (inreceptacle cup_5 fridge_7) (objectatlocation wateringcan_1 location2) (objectatlocation pencil_2 location2) (objectatlocation butterknife_3 location2) (objectatlocation cup_4 location2) (objectatlocation cup_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o wateringcantype) (receptacletype_0 ?r coffeetabletype))))))
 (:metric minimize (total-cost))
)
