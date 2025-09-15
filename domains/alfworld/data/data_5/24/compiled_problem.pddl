(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   dressertype bathtubbasintype towelholdertype laundryhampertype - receptacletype
   tissueboxtype toiletpaperrolltype eggtype cuptype - objecttype
   location2 location3 location4 location5 - location
   dresser_1 bathtubbasin_2 towelholder_3 microwave_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   toiletpaperroll_2 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 towelholder_3 towelholdertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tissuebox_1 tissueboxtype) (objecttype_0 toiletpaperroll_2 toiletpaperrolltype) (objecttype_0 egg_3 eggtype) (objecttype_0 toiletpaperroll_4 toiletpaperrolltype) (objecttype_0 cup_5 cuptype) (cancontain dressertype tissueboxtype) (cancontain dressertype toiletpaperrolltype) (cancontain dressertype cuptype) (cancontain microwavetype eggtype) (cancontain microwavetype cuptype) (cancontain fridgetype eggtype) (cancontain fridgetype cuptype) (pickupable tissuebox_1) (pickupable toiletpaperroll_2) (pickupable egg_3) (cleanable egg_3) (heatable egg_3) (coolable egg_3) (sliceable egg_3) (pickupable toiletpaperroll_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation dresser_1 location5) (receptacleatlocation bathtubbasin_2 location3) (receptacleatlocation towelholder_3 location1) (receptacleatlocation microwave_4 location1) (receptacleatlocation laundryhamper_5 location3) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location3) (inreceptacle tissuebox_1 dresser_1) (inreceptacle toiletpaperroll_2 dresser_1) (inreceptacle egg_3 microwave_4) (inreceptacle toiletpaperroll_4 dresser_1) (inreceptacle cup_5 microwave_4) (objectatlocation tissuebox_1 location5) (objectatlocation toiletpaperroll_2 location5) (objectatlocation egg_3 location1) (objectatlocation toiletpaperroll_4 location5) (objectatlocation cup_5 location1) (atlocation agent1 location5) (hold_1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 cuptype) (receptacletype_0 ?r_0 microwavetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
