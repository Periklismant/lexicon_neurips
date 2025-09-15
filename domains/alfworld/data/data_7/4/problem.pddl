(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   sidetabletype sofatype desktype towelholdertype diningtabletype - receptacletype
   booktype forktype handtoweltype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sidetable_1 sofa_2 desk_3 towelholder_4 diningtable_5 microwave_6 fridge_7 - receptacle
   book_1 fork_2 handtowel_3 mug_4 mug_5 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 sofa_2 sofatype) (receptacletype_0 desk_3 desktype) (receptacletype_0 towelholder_4 towelholdertype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 book_1 booktype) (objecttype_0 fork_2 forktype) (objecttype_0 handtowel_3 handtoweltype) (objecttype_0 mug_4 mugtype) (objecttype_0 mug_5 mugtype) (cancontain sidetabletype booktype) (cancontain sidetabletype forktype) (cancontain sidetabletype handtoweltype) (cancontain sidetabletype mugtype) (cancontain sofatype booktype) (cancontain desktype booktype) (cancontain desktype mugtype) (cancontain diningtabletype booktype) (cancontain diningtabletype forktype) (cancontain diningtabletype handtoweltype) (cancontain diningtabletype mugtype) (cancontain microwavetype mugtype) (cancontain fridgetype mugtype) (pickupable book_1) (pickupable fork_2) (cleanable fork_2) (pickupable handtowel_3) (pickupable mug_4) (isreceptacleobject mug_4) (cleanable mug_4) (heatable mug_4) (coolable mug_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation sidetable_1 location5) (receptacleatlocation sofa_2 location5) (receptacleatlocation desk_3 location3) (receptacleatlocation towelholder_4 location4) (receptacleatlocation diningtable_5 location4) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle book_1 sofa_2) (inreceptacle fork_2 sidetable_1) (inreceptacle handtowel_3 sidetable_1) (inreceptacle mug_4 microwave_6) (inreceptacle mug_5 diningtable_5) (objectatlocation book_1 location5) (objectatlocation fork_2 location5) (objectatlocation handtowel_3 location5) (objectatlocation mug_4 location2) (objectatlocation mug_5 location4) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 mugtype) (receptacletype_0 ?r_0 desktype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 mugtype) (receptacletype_0 ?r_0 desktype) (inreceptacle ?o2 ?r_0))))))))
 (:constraints (sometime (holds agent1 mug_4)) (sometime-before (holds agent1 mug_4) (checked location5)) (sometime (atlocation agent1 location2)) (sometime-after (atlocation agent1 location2) (holds agent1 fork_2)) (sometime (or (checked agent1) (checked location2))) (sometime (objectatlocation mug_5 location4)) (sometime-after (objectatlocation mug_5 location4) (holds agent1 fork_2)) (sometime (holds agent1 book_1)) (sometime (atlocation agent1 location4)) (sometime-before (atlocation agent1 location4) (or (checked location1) (holds agent1 mug_4))) (sometime (holds agent1 mug_5)) (sometime-after (holds agent1 mug_5) (or (objectatlocation mug_4 location4) (holds agent1 fork_2))))
 (:metric minimize (total-cost))
)
