(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   sidetabletype sofatype desktype towelholdertype diningtabletype - receptacletype
   forktype cellphonetype potatotype mugtype - objecttype
   location1 location4 location5 - location
   sidetable_1 sofa_2 desk_3 towelholder_4 diningtable_5 microwave_6 fridge_7 - receptacle
   fork_2 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 sofa_2 sofatype) (receptacletype_0 desk_3 desktype) (receptacletype_0 towelholder_4 towelholdertype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 butterknife_1 butterknifetype) (objecttype_0 fork_2 forktype) (objecttype_0 cellphone_3 cellphonetype) (objecttype_0 potato_4 potatotype) (objecttype_0 mug_5 mugtype) (cancontain sidetabletype butterknifetype) (cancontain sidetabletype forktype) (cancontain sidetabletype cellphonetype) (cancontain sidetabletype potatotype) (cancontain sidetabletype mugtype) (cancontain sofatype cellphonetype) (cancontain desktype cellphonetype) (cancontain desktype mugtype) (cancontain diningtabletype butterknifetype) (cancontain diningtabletype forktype) (cancontain diningtabletype cellphonetype) (cancontain diningtabletype potatotype) (cancontain diningtabletype mugtype) (cancontain microwavetype potatotype) (cancontain microwavetype mugtype) (cancontain fridgetype potatotype) (cancontain fridgetype mugtype) (pickupable butterknife_1) (cleanable butterknife_1) (pickupable fork_2) (cleanable fork_2) (pickupable cellphone_3) (pickupable potato_4) (cleanable potato_4) (heatable potato_4) (coolable potato_4) (sliceable potato_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation sidetable_1 location5) (receptacleatlocation sofa_2 location5) (receptacleatlocation desk_3 location3) (receptacleatlocation towelholder_4 location4) (receptacleatlocation diningtable_5 location4) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle butterknife_1 sidetable_1) (inreceptacle fork_2 sidetable_1) (inreceptacle cellphone_3 sofa_2) (inreceptacle potato_4 diningtable_5) (inreceptacle mug_5 desk_3) (objectatlocation butterknife_1 location5) (objectatlocation fork_2 location5) (objectatlocation cellphone_3 location5) (objectatlocation potato_4 location4) (objectatlocation mug_5 location3) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 cellphonetype) (receptacletype_0 ?r_0 sofatype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
