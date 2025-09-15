(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   diningtabletype toilettype safetype handtowelholdertype - receptacletype
   soapbottletype eggtype papertoweltype tissueboxtype bowltype - objecttype
   location2 - location
   diningtable_1 toilet_2 diningtable_3 safe_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 toilet_2 toilettype) (receptacletype_0 diningtable_3 diningtabletype) (receptacletype_0 safe_4 safetype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 soapbottle_1 soapbottletype) (objecttype_0 egg_2 eggtype) (objecttype_0 papertowel_3 papertoweltype) (objecttype_0 tissuebox_4 tissueboxtype) (objecttype_0 bowl_5 bowltype) (cancontain diningtabletype soapbottletype) (cancontain diningtabletype eggtype) (cancontain diningtabletype papertoweltype) (cancontain diningtabletype tissueboxtype) (cancontain diningtabletype bowltype) (cancontain toilettype soapbottletype) (cancontain toilettype papertoweltype) (cancontain toilettype tissueboxtype) (cancontain microwavetype eggtype) (cancontain microwavetype bowltype) (cancontain fridgetype eggtype) (cancontain fridgetype bowltype) (pickupable soapbottle_1) (pickupable egg_2) (cleanable egg_2) (heatable egg_2) (coolable egg_2) (sliceable egg_2) (pickupable papertowel_3) (pickupable tissuebox_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation diningtable_1 location4) (receptacleatlocation toilet_2 location3) (receptacleatlocation diningtable_3 location2) (receptacleatlocation safe_4 location5) (receptacleatlocation handtowelholder_5 location2) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location1) (inreceptacle soapbottle_1 toilet_2) (inreceptacle egg_2 diningtable_3) (inreceptacle papertowel_3 diningtable_1) (inreceptacle tissuebox_4 toilet_2) (inreceptacle bowl_5 diningtable_1) (objectatlocation soapbottle_1 location3) (objectatlocation egg_2 location2) (objectatlocation papertowel_3 location4) (objectatlocation tissuebox_4 location3) (objectatlocation bowl_5 location4) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 tissueboxtype) (receptacletype_0 ?r_0 toilettype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
