(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   dressertype bathtubbasintype towelholdertype laundryhampertype - receptacletype
   eggtype cuptype cellphonetype potatotype platetype - objecttype
   location2 location3 location4 location5 - location
   dresser_1 bathtubbasin_2 towelholder_3 microwave_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   cup_2 cellphone_3 potato_4 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 towelholder_3 towelholdertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 egg_1 eggtype) (objecttype_0 cup_2 cuptype) (objecttype_0 cellphone_3 cellphonetype) (objecttype_0 potato_4 potatotype) (objecttype_0 plate_5 platetype) (cancontain dressertype cuptype) (cancontain dressertype cellphonetype) (cancontain dressertype platetype) (cancontain microwavetype eggtype) (cancontain microwavetype cuptype) (cancontain microwavetype potatotype) (cancontain microwavetype platetype) (cancontain fridgetype eggtype) (cancontain fridgetype cuptype) (cancontain fridgetype potatotype) (cancontain fridgetype platetype) (pickupable egg_1) (cleanable egg_1) (heatable egg_1) (coolable egg_1) (sliceable egg_1) (pickupable cup_2) (isreceptacleobject cup_2) (cleanable cup_2) (heatable cup_2) (coolable cup_2) (pickupable cellphone_3) (pickupable potato_4) (cleanable potato_4) (heatable potato_4) (coolable potato_4) (sliceable potato_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation dresser_1 location1) (receptacleatlocation bathtubbasin_2 location1) (receptacleatlocation towelholder_3 location3) (receptacleatlocation microwave_4 location5) (receptacleatlocation laundryhamper_5 location3) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location1) (inreceptacle egg_1 fridge_7) (inreceptacle cup_2 dresser_1) (inreceptacle cellphone_3 dresser_1) (inreceptacle potato_4 microwave_4) (inreceptacle plate_5 fridge_7) (objectatlocation egg_1 location1) (objectatlocation cup_2 location1) (objectatlocation cellphone_3 location1) (objectatlocation potato_4 location5) (objectatlocation plate_5 location1) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 microwavetype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_2) (hold_3)))
 (:metric minimize (total-cost))
)
