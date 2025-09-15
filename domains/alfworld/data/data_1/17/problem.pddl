(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype bathtubbasintype desktype armchairtype countertoptype - receptacletype
   pottype soapbartype tissueboxtype eggtype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   towelholder_1 bathtubbasin_2 desk_3 armchair_4 countertop_5 microwave_6 fridge_7 - receptacle
   pot_1 soapbar_2 tissuebox_3 egg_4 mug_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 desk_3 desktype) (receptacletype_0 armchair_4 armchairtype) (receptacletype_0 countertop_5 countertoptype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pot_1 pottype) (objecttype_0 soapbar_2 soapbartype) (objecttype_0 tissuebox_3 tissueboxtype) (objecttype_0 egg_4 eggtype) (objecttype_0 mug_5 mugtype) (cancontain bathtubbasintype soapbartype) (cancontain desktype tissueboxtype) (cancontain desktype mugtype) (cancontain countertoptype pottype) (cancontain countertoptype soapbartype) (cancontain countertoptype tissueboxtype) (cancontain countertoptype eggtype) (cancontain countertoptype mugtype) (cancontain microwavetype eggtype) (cancontain microwavetype mugtype) (cancontain fridgetype pottype) (cancontain fridgetype eggtype) (cancontain fridgetype mugtype) (pickupable pot_1) (isreceptacleobject pot_1) (cleanable pot_1) (coolable pot_1) (pickupable soapbar_2) (cleanable soapbar_2) (pickupable tissuebox_3) (pickupable egg_4) (cleanable egg_4) (heatable egg_4) (coolable egg_4) (sliceable egg_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation towelholder_1 location2) (receptacleatlocation bathtubbasin_2 location2) (receptacleatlocation desk_3 location5) (receptacleatlocation armchair_4 location1) (receptacleatlocation countertop_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location3) (inreceptacle pot_1 fridge_7) (inreceptacle soapbar_2 bathtubbasin_2) (inreceptacle tissuebox_3 countertop_5) (inreceptacle egg_4 microwave_6) (inreceptacle mug_5 countertop_5) (objectatlocation pot_1 location3) (objectatlocation soapbar_2 location2) (objectatlocation tissuebox_3 location4) (objectatlocation egg_4 location5) (objectatlocation mug_5 location4) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 mugtype) (receptacletype_0 ?r_0 countertoptype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 tissueboxtype) (receptacletype_0 ?r_0 countertoptype) (inreceptacle ?o2 ?r_0))))))))
 (:constraints (sometime (atlocation agent1 location3)))
 (:metric minimize (total-cost))
)
