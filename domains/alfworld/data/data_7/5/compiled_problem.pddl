(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   diningtabletype toilettype dressertype toastertype - receptacletype
   statuetype laptoptype handtoweltype tissueboxtype boxtype - objecttype
   location1 - location
   toilet_2 microwave_3 toaster_5 microwave_6 fridge_7 - receptacle
   statue_1 handtowel_3 - obj
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 toilet_2 toilettype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 dresser_4 dressertype) (receptacletype_0 toaster_5 toastertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 statue_1 statuetype) (objecttype_0 laptop_2 laptoptype) (objecttype_0 handtowel_3 handtoweltype) (objecttype_0 tissuebox_4 tissueboxtype) (objecttype_0 box_5 boxtype) (cancontain diningtabletype statuetype) (cancontain diningtabletype laptoptype) (cancontain diningtabletype handtoweltype) (cancontain diningtabletype tissueboxtype) (cancontain diningtabletype boxtype) (cancontain toilettype handtoweltype) (cancontain toilettype tissueboxtype) (cancontain dressertype statuetype) (cancontain dressertype laptoptype) (cancontain dressertype tissueboxtype) (cancontain dressertype boxtype) (pickupable statue_1) (pickupable laptop_2) (pickupable handtowel_3) (pickupable tissuebox_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation diningtable_1 location2) (receptacleatlocation toilet_2 location3) (receptacleatlocation microwave_3 location1) (receptacleatlocation dresser_4 location4) (receptacleatlocation toaster_5 location4) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location5) (inreceptacle statue_1 dresser_4) (inreceptacle laptop_2 dresser_4) (inreceptacle handtowel_3 diningtable_1) (inreceptacle tissuebox_4 diningtable_1) (inreceptacle box_5 dresser_4) (objectatlocation statue_1 location4) (objectatlocation laptop_2 location4) (objectatlocation handtowel_3 location2) (objectatlocation tissuebox_4 location2) (objectatlocation box_5 location4) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 boxtype) (receptacletype_0 ?r_0 dressertype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
