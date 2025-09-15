(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   garbagecantype diningtabletype - receptacletype
   eggtype cuptype - objecttype
   agent1 - agent
   location1 location2 - location
   garbagecan_1 diningtable_2 microwave_3 fridge_4 - receptacle
   egg_1 cup_2 - obj
 )
 (:init (receptacletype_0 garbagecan_1 garbagecantype) (receptacletype_0 diningtable_2 diningtabletype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 egg_1 eggtype) (objecttype_0 cup_2 cuptype) (cancontain garbagecantype eggtype) (cancontain diningtabletype eggtype) (cancontain diningtabletype cuptype) (cancontain microwavetype eggtype) (cancontain microwavetype cuptype) (cancontain fridgetype eggtype) (cancontain fridgetype cuptype) (pickupable egg_1) (cleanable egg_1) (heatable egg_1) (coolable egg_1) (sliceable egg_1) (pickupable cup_2) (isreceptacleobject cup_2) (cleanable cup_2) (heatable cup_2) (coolable cup_2) (receptacleatlocation garbagecan_1 location2) (receptacleatlocation diningtable_2 location2) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location2) (inreceptacle egg_1 fridge_4) (inreceptacle cup_2 fridge_4) (objectatlocation egg_1 location2) (objectatlocation cup_2 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 eggtype) (receptacletype_0 ?r_0 fridgetype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 cuptype) (receptacletype_0 ?r_0 fridgetype) (inreceptacle ?o2 ?r_0))))))))
 (:constraints (sometime (checked agent1)) (sometime (holds agent1 egg_1)) (sometime (or (checked fridge_4) (holdsany agent1))) (sometime (and (checked garbagecan_1) (holds agent1 cup_2))) (sometime (holds agent1 cup_2)) (sometime (or (checked location2) (holdsany agent1))) (sometime (holdsany agent1)) (sometime (or (holds agent1 egg_1) (atlocation agent1 location1))) (sometime (atlocation agent1 location1)) (sometime (holds agent1 egg_1)))
 (:metric minimize (total-cost))
)
