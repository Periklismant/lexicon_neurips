(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   countertoptype sidetabletype desktype - receptacletype
   bowltype statuetype vasetype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   countertop_1 sidetable_2 microwave_3 desk_4 microwave_5 microwave_6 fridge_7 - receptacle
   bowl_1 statue_2 vase_3 bowl_4 mug_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 sidetable_2 sidetabletype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 desk_4 desktype) (receptacletype_0 microwave_5 microwavetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 bowl_1 bowltype) (objecttype_0 statue_2 statuetype) (objecttype_0 vase_3 vasetype) (objecttype_0 bowl_4 bowltype) (objecttype_0 mug_5 mugtype) (cancontain countertoptype bowltype) (cancontain countertoptype statuetype) (cancontain countertoptype vasetype) (cancontain countertoptype mugtype) (cancontain sidetabletype bowltype) (cancontain sidetabletype statuetype) (cancontain sidetabletype vasetype) (cancontain sidetabletype mugtype) (cancontain microwavetype bowltype) (cancontain microwavetype mugtype) (cancontain desktype bowltype) (cancontain desktype statuetype) (cancontain desktype vasetype) (cancontain desktype mugtype) (cancontain fridgetype bowltype) (cancontain fridgetype mugtype) (pickupable bowl_1) (isreceptacleobject bowl_1) (cleanable bowl_1) (coolable bowl_1) (pickupable statue_2) (pickupable vase_3) (pickupable bowl_4) (isreceptacleobject bowl_4) (cleanable bowl_4) (coolable bowl_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation countertop_1 location5) (receptacleatlocation sidetable_2 location1) (receptacleatlocation microwave_3 location2) (receptacleatlocation desk_4 location5) (receptacleatlocation microwave_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location2) (inreceptacle bowl_1 countertop_1) (inreceptacle statue_2 countertop_1) (inreceptacle vase_3 sidetable_2) (inreceptacle bowl_4 fridge_7) (inreceptacle mug_5 fridge_7) (objectatlocation bowl_1 location5) (objectatlocation statue_2 location5) (objectatlocation vase_3 location1) (objectatlocation bowl_4 location2) (objectatlocation mug_5 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 statuetype) (receptacletype_0 ?r sidetabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 vasetype) (receptacletype_0 ?r sidetabletype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
