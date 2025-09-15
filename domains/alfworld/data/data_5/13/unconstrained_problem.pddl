(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype toilettype sidetabletype towelholdertype bathtubbasintype - receptacletype
   tomatotype soapbottletype dishspongetype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 toilet_2 sidetable_3 towelholder_4 bathtubbasin_5 microwave_6 fridge_7 - receptacle
   tomato_1 soapbottle_2 butterknife_3 dishsponge_4 pot_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 toilet_2 toilettype) (receptacletype_0 sidetable_3 sidetabletype) (receptacletype_0 towelholder_4 towelholdertype) (receptacletype_0 bathtubbasin_5 bathtubbasintype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tomato_1 tomatotype) (objecttype_0 soapbottle_2 soapbottletype) (objecttype_0 butterknife_3 butterknifetype) (objecttype_0 dishsponge_4 dishspongetype) (objecttype_0 pot_5 pottype) (cancontain toilettype soapbottletype) (cancontain toilettype dishspongetype) (cancontain sidetabletype tomatotype) (cancontain sidetabletype soapbottletype) (cancontain sidetabletype butterknifetype) (cancontain sidetabletype dishspongetype) (cancontain sidetabletype pottype) (cancontain bathtubbasintype dishspongetype) (cancontain microwavetype tomatotype) (cancontain fridgetype tomatotype) (cancontain fridgetype pottype) (pickupable tomato_1) (cleanable tomato_1) (heatable tomato_1) (coolable tomato_1) (sliceable tomato_1) (pickupable soapbottle_2) (pickupable butterknife_3) (cleanable butterknife_3) (pickupable dishsponge_4) (cleanable dishsponge_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation dresser_1 location2) (receptacleatlocation toilet_2 location3) (receptacleatlocation sidetable_3 location4) (receptacleatlocation towelholder_4 location2) (receptacleatlocation bathtubbasin_5 location1) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location2) (inreceptacle tomato_1 microwave_6) (inreceptacle soapbottle_2 toilet_2) (inreceptacle butterknife_3 sidetable_3) (inreceptacle dishsponge_4 toilet_2) (inreceptacle pot_5 sidetable_3) (objectatlocation tomato_1 location5) (objectatlocation soapbottle_2 location3) (objectatlocation butterknife_3 location4) (objectatlocation dishsponge_4 location3) (objectatlocation pot_5 location4) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o pottype) (receptacletype_0 ?r sidetabletype))))))
 (:metric minimize (total-cost))
)
