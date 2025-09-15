(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bathtubbasintype stoveburnertype desktype drawertype - receptacletype
   spoontype booktype handtoweltype cuptype pantype - objecttype
   agent1 - agent
   location1 location3 location4 location5 - location
   bathtubbasin_1 bathtubbasin_2 stoveburner_3 desk_4 drawer_5 microwave_6 fridge_7 - receptacle
   spoon_1 book_2 cup_4 pan_5 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 desk_4 desktype) (receptacletype_0 drawer_5 drawertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 spoon_1 spoontype) (objecttype_0 book_2 booktype) (objecttype_0 handtowel_3 handtoweltype) (objecttype_0 cup_4 cuptype) (objecttype_0 pan_5 pantype) (cancontain bathtubbasintype handtoweltype) (cancontain stoveburnertype pantype) (cancontain desktype booktype) (cancontain desktype cuptype) (cancontain drawertype spoontype) (cancontain drawertype booktype) (cancontain drawertype handtoweltype) (cancontain microwavetype cuptype) (cancontain fridgetype cuptype) (cancontain fridgetype pantype) (pickupable spoon_1) (cleanable spoon_1) (pickupable book_2) (pickupable handtowel_3) (pickupable cup_4) (isreceptacleobject cup_4) (cleanable cup_4) (heatable cup_4) (coolable cup_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation bathtubbasin_1 location2) (receptacleatlocation bathtubbasin_2 location5) (receptacleatlocation stoveburner_3 location1) (receptacleatlocation desk_4 location3) (receptacleatlocation drawer_5 location4) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle spoon_1 drawer_5) (inreceptacle book_2 desk_4) (inreceptacle handtowel_3 bathtubbasin_2) (inreceptacle cup_4 fridge_7) (inreceptacle pan_5 fridge_7) (objectatlocation spoon_1 location4) (objectatlocation book_2 location3) (objectatlocation handtowel_3 location5) (objectatlocation cup_4 location1) (objectatlocation pan_5 location1) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 spoontype) (receptacletype_0 ?r_0 drawertype)))) (hold_0)))
 (:metric minimize (total-cost))
)
