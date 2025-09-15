(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bathtubbasintype shelftype toilettype diningtabletype bedtype - receptacletype
   mugtype tennisrackettype vasetype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bathtubbasin_1 shelf_2 toilet_3 diningtable_4 bed_5 microwave_6 fridge_7 - receptacle
   mug_1 tennisracket_2 vase_3 vase_4 plate_5 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 shelf_2 shelftype) (receptacletype_0 toilet_3 toilettype) (receptacletype_0 diningtable_4 diningtabletype) (receptacletype_0 bed_5 bedtype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 mug_1 mugtype) (objecttype_0 tennisracket_2 tennisrackettype) (objecttype_0 vase_3 vasetype) (objecttype_0 vase_4 vasetype) (objecttype_0 plate_5 platetype) (cancontain shelftype mugtype) (cancontain shelftype vasetype) (cancontain shelftype platetype) (cancontain diningtabletype mugtype) (cancontain diningtabletype tennisrackettype) (cancontain diningtabletype vasetype) (cancontain diningtabletype platetype) (cancontain bedtype tennisrackettype) (cancontain microwavetype mugtype) (cancontain microwavetype platetype) (cancontain fridgetype mugtype) (cancontain fridgetype platetype) (pickupable mug_1) (isreceptacleobject mug_1) (cleanable mug_1) (heatable mug_1) (coolable mug_1) (pickupable tennisracket_2) (pickupable vase_3) (pickupable vase_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation bathtubbasin_1 location2) (receptacleatlocation shelf_2 location4) (receptacleatlocation toilet_3 location3) (receptacleatlocation diningtable_4 location1) (receptacleatlocation bed_5 location3) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location4) (inreceptacle mug_1 shelf_2) (inreceptacle tennisracket_2 diningtable_4) (inreceptacle vase_3 shelf_2) (inreceptacle vase_4 diningtable_4) (inreceptacle plate_5 shelf_2) (objectatlocation mug_1 location4) (objectatlocation tennisracket_2 location1) (objectatlocation vase_3 location4) (objectatlocation vase_4 location1) (objectatlocation plate_5 location4) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o vasetype) (receptacletype_0 ?r diningtabletype))))))
 (:metric minimize (total-cost))
)
