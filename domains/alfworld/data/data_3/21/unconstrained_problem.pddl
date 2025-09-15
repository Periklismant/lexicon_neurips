(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype handtowelholdertype sidetabletype - receptacletype
   statuetype boxtype baseballbattype toiletpapertype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 handtowelholder_2 sidetable_3 safe_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   statue_1 box_2 baseballbat_3 toiletpaper_4 pan_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 handtowelholder_2 handtowelholdertype) (receptacletype_0 sidetable_3 sidetabletype) (receptacletype_0 safe_4 safetype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 statue_1 statuetype) (objecttype_0 box_2 boxtype) (objecttype_0 baseballbat_3 baseballbattype) (objecttype_0 toiletpaper_4 toiletpapertype) (objecttype_0 pan_5 pantype) (cancontain safetype statuetype) (cancontain sidetabletype statuetype) (cancontain sidetabletype boxtype) (cancontain sidetabletype baseballbattype) (cancontain sidetabletype toiletpapertype) (cancontain sidetabletype pantype) (cancontain fridgetype pantype) (pickupable statue_1) (pickupable box_2) (isreceptacleobject box_2) (pickupable baseballbat_3) (pickupable toiletpaper_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation safe_1 location3) (receptacleatlocation handtowelholder_2 location1) (receptacleatlocation sidetable_3 location4) (receptacleatlocation safe_4 location3) (receptacleatlocation handtowelholder_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location5) (inreceptacle statue_1 safe_1) (inreceptacle box_2 sidetable_3) (inreceptacle baseballbat_3 sidetable_3) (inreceptacle toiletpaper_4 sidetable_3) (inreceptacle pan_5 sidetable_3) (objectatlocation statue_1 location3) (objectatlocation box_2 location4) (objectatlocation baseballbat_3 location4) (objectatlocation toiletpaper_4 location4) (objectatlocation pan_5 location4) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o statuetype) (receptacletype_0 ?r safetype))))))
 (:metric minimize (total-cost))
)
