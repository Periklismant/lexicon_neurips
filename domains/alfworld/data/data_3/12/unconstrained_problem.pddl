(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype bathtubbasintype desktype armchairtype countertoptype - receptacletype
   handtoweltype tissueboxtype newspapertype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   towelholder_1 bathtubbasin_2 desk_3 armchair_4 countertop_5 microwave_6 fridge_7 - receptacle
   knife_1 handtowel_2 tissuebox_3 newspaper_4 plate_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 desk_3 desktype) (receptacletype_0 armchair_4 armchairtype) (receptacletype_0 countertop_5 countertoptype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 knife_1 knifetype) (objecttype_0 handtowel_2 handtoweltype) (objecttype_0 tissuebox_3 tissueboxtype) (objecttype_0 newspaper_4 newspapertype) (objecttype_0 plate_5 platetype) (cancontain bathtubbasintype handtoweltype) (cancontain desktype tissueboxtype) (cancontain desktype newspapertype) (cancontain desktype platetype) (cancontain armchairtype newspapertype) (cancontain countertoptype knifetype) (cancontain countertoptype handtoweltype) (cancontain countertoptype tissueboxtype) (cancontain countertoptype newspapertype) (cancontain countertoptype platetype) (cancontain microwavetype platetype) (cancontain fridgetype platetype) (pickupable knife_1) (cleanable knife_1) (pickupable handtowel_2) (pickupable tissuebox_3) (pickupable newspaper_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation towelholder_1 location2) (receptacleatlocation bathtubbasin_2 location4) (receptacleatlocation desk_3 location2) (receptacleatlocation armchair_4 location2) (receptacleatlocation countertop_5 location5) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location4) (inreceptacle knife_1 countertop_5) (inreceptacle handtowel_2 bathtubbasin_2) (inreceptacle tissuebox_3 countertop_5) (inreceptacle newspaper_4 desk_3) (inreceptacle plate_5 desk_3) (objectatlocation knife_1 location5) (objectatlocation handtowel_2 location4) (objectatlocation tissuebox_3 location5) (objectatlocation newspaper_4 location2) (objectatlocation plate_5 location2) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 platetype) (receptacletype_0 ?r countertoptype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 tissueboxtype) (receptacletype_0 ?r countertoptype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
