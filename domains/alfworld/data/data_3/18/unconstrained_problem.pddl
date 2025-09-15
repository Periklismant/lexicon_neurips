(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype carttype sidetabletype tvstandtype safetype - receptacletype
   cellphonetype soapbartype potatotype clothtype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 cart_2 sidetable_3 tvstand_4 safe_5 microwave_6 fridge_7 - receptacle
   cellphone_1 soapbar_2 potato_3 cloth_4 bowl_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 cart_2 carttype) (receptacletype_0 sidetable_3 sidetabletype) (receptacletype_0 tvstand_4 tvstandtype) (receptacletype_0 safe_5 safetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 cellphone_1 cellphonetype) (objecttype_0 soapbar_2 soapbartype) (objecttype_0 potato_3 potatotype) (objecttype_0 cloth_4 clothtype) (objecttype_0 bowl_5 bowltype) (cancontain dressertype cellphonetype) (cancontain dressertype clothtype) (cancontain dressertype bowltype) (cancontain carttype soapbartype) (cancontain carttype clothtype) (cancontain sidetabletype cellphonetype) (cancontain sidetabletype soapbartype) (cancontain sidetabletype potatotype) (cancontain sidetabletype clothtype) (cancontain sidetabletype bowltype) (cancontain safetype cellphonetype) (cancontain microwavetype potatotype) (cancontain microwavetype bowltype) (cancontain fridgetype potatotype) (cancontain fridgetype bowltype) (pickupable cellphone_1) (pickupable soapbar_2) (cleanable soapbar_2) (pickupable potato_3) (cleanable potato_3) (heatable potato_3) (coolable potato_3) (sliceable potato_3) (pickupable cloth_4) (cleanable cloth_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation dresser_1 location4) (receptacleatlocation cart_2 location4) (receptacleatlocation sidetable_3 location1) (receptacleatlocation tvstand_4 location3) (receptacleatlocation safe_5 location2) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle cellphone_1 sidetable_3) (inreceptacle soapbar_2 cart_2) (inreceptacle potato_3 microwave_6) (inreceptacle cloth_4 sidetable_3) (inreceptacle bowl_5 dresser_1) (objectatlocation cellphone_1 location1) (objectatlocation soapbar_2 location4) (objectatlocation potato_3 location2) (objectatlocation cloth_4 location1) (objectatlocation bowl_5 location4) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 potatotype) (receptacletype_0 ?r fridgetype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 bowltype) (receptacletype_0 ?r fridgetype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
