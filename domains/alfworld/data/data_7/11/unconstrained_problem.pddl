(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   toilettype sidetabletype stoveburnertype bathtubbasintype towelholdertype - receptacletype
   kettletype spoontype cellphonetype toiletpaperrolltype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   toilet_1 sidetable_2 stoveburner_3 bathtubbasin_4 towelholder_5 microwave_6 fridge_7 - receptacle
   kettle_1 spoon_2 cellphone_3 toiletpaperroll_4 bowl_5 - obj
 )
 (:init (receptacletype_0 toilet_1 toilettype) (receptacletype_0 sidetable_2 sidetabletype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 bathtubbasin_4 bathtubbasintype) (receptacletype_0 towelholder_5 towelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 kettle_1 kettletype) (objecttype_0 spoon_2 spoontype) (objecttype_0 cellphone_3 cellphonetype) (objecttype_0 toiletpaperroll_4 toiletpaperrolltype) (objecttype_0 bowl_5 bowltype) (cancontain toilettype toiletpaperrolltype) (cancontain sidetabletype kettletype) (cancontain sidetabletype spoontype) (cancontain sidetabletype cellphonetype) (cancontain sidetabletype toiletpaperrolltype) (cancontain sidetabletype bowltype) (cancontain stoveburnertype kettletype) (cancontain microwavetype bowltype) (cancontain fridgetype bowltype) (pickupable kettle_1) (cleanable kettle_1) (pickupable spoon_2) (cleanable spoon_2) (pickupable cellphone_3) (pickupable toiletpaperroll_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation toilet_1 location3) (receptacleatlocation sidetable_2 location5) (receptacleatlocation stoveburner_3 location4) (receptacleatlocation bathtubbasin_4 location1) (receptacleatlocation towelholder_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle kettle_1 sidetable_2) (inreceptacle spoon_2 sidetable_2) (inreceptacle cellphone_3 sidetable_2) (inreceptacle toiletpaperroll_4 sidetable_2) (inreceptacle bowl_5 fridge_7) (objectatlocation kettle_1 location5) (objectatlocation spoon_2 location5) (objectatlocation cellphone_3 location5) (objectatlocation toiletpaperroll_4 location5) (objectatlocation bowl_5 location4) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o cellphonetype) (receptacletype_0 ?r sidetabletype))))))
 (:metric minimize (total-cost))
)
