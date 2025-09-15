(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype bathtubbasintype towelholdertype laundryhampertype - receptacletype
   tissueboxtype toiletpaperrolltype eggtype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 bathtubbasin_2 towelholder_3 microwave_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   tissuebox_1 toiletpaperroll_2 egg_3 toiletpaperroll_4 cup_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 towelholder_3 towelholdertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tissuebox_1 tissueboxtype) (objecttype_0 toiletpaperroll_2 toiletpaperrolltype) (objecttype_0 egg_3 eggtype) (objecttype_0 toiletpaperroll_4 toiletpaperrolltype) (objecttype_0 cup_5 cuptype) (cancontain dressertype tissueboxtype) (cancontain dressertype toiletpaperrolltype) (cancontain dressertype cuptype) (cancontain microwavetype eggtype) (cancontain microwavetype cuptype) (cancontain fridgetype eggtype) (cancontain fridgetype cuptype) (pickupable tissuebox_1) (pickupable toiletpaperroll_2) (pickupable egg_3) (cleanable egg_3) (heatable egg_3) (coolable egg_3) (sliceable egg_3) (pickupable toiletpaperroll_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation dresser_1 location5) (receptacleatlocation bathtubbasin_2 location3) (receptacleatlocation towelholder_3 location1) (receptacleatlocation microwave_4 location1) (receptacleatlocation laundryhamper_5 location3) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location3) (inreceptacle tissuebox_1 dresser_1) (inreceptacle toiletpaperroll_2 dresser_1) (inreceptacle egg_3 microwave_4) (inreceptacle toiletpaperroll_4 dresser_1) (inreceptacle cup_5 microwave_4) (objectatlocation tissuebox_1 location5) (objectatlocation toiletpaperroll_2 location5) (objectatlocation egg_3 location1) (objectatlocation toiletpaperroll_4 location5) (objectatlocation cup_5 location1) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 cuptype) (receptacletype_0 ?r_0 microwavetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (holds agent1 cup_5)) (sometime-after (holds agent1 cup_5) (or (atlocation agent1 location1) (holds agent1 tissuebox_1))) (sometime (or (holds agent1 tissuebox_1) (checked agent1))) (sometime (or (checked location1) (checked cup_5))) (sometime (or (checked agent1) (holds agent1 egg_3))) (sometime (atlocation agent1 location1)) (sometime-before (atlocation agent1 location1) (or (holds agent1 toiletpaperroll_4) (checked egg_3))))
 (:metric minimize (total-cost))
)
