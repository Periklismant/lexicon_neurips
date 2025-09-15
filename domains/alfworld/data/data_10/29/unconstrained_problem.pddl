(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   countertoptype coffeemachinetype stoveburnertype cabinettype diningtabletype - receptacletype
   appletype creditcardtype forktype eggtype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   countertop_1 coffeemachine_2 stoveburner_3 cabinet_4 diningtable_5 microwave_6 fridge_7 - receptacle
   apple_1 creditcard_2 fork_3 egg_4 cup_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 coffeemachine_2 coffeemachinetype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 cabinet_4 cabinettype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 apple_1 appletype) (objecttype_0 creditcard_2 creditcardtype) (objecttype_0 fork_3 forktype) (objecttype_0 egg_4 eggtype) (objecttype_0 cup_5 cuptype) (cancontain countertoptype appletype) (cancontain countertoptype creditcardtype) (cancontain countertoptype forktype) (cancontain countertoptype eggtype) (cancontain countertoptype cuptype) (cancontain cabinettype cuptype) (cancontain diningtabletype appletype) (cancontain diningtabletype creditcardtype) (cancontain diningtabletype forktype) (cancontain diningtabletype eggtype) (cancontain diningtabletype cuptype) (cancontain microwavetype appletype) (cancontain microwavetype eggtype) (cancontain microwavetype cuptype) (cancontain fridgetype appletype) (cancontain fridgetype eggtype) (cancontain fridgetype cuptype) (pickupable apple_1) (cleanable apple_1) (heatable apple_1) (coolable apple_1) (sliceable apple_1) (pickupable creditcard_2) (pickupable fork_3) (cleanable fork_3) (pickupable egg_4) (cleanable egg_4) (heatable egg_4) (coolable egg_4) (sliceable egg_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation countertop_1 location4) (receptacleatlocation coffeemachine_2 location2) (receptacleatlocation stoveburner_3 location3) (receptacleatlocation cabinet_4 location3) (receptacleatlocation diningtable_5 location2) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location3) (inreceptacle apple_1 microwave_6) (inreceptacle creditcard_2 diningtable_5) (inreceptacle fork_3 diningtable_5) (inreceptacle egg_4 countertop_1) (inreceptacle cup_5 diningtable_5) (objectatlocation apple_1 location5) (objectatlocation creditcard_2 location2) (objectatlocation fork_3 location2) (objectatlocation egg_4 location4) (objectatlocation cup_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 creditcardtype) (receptacletype_0 ?r diningtabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 forktype) (receptacletype_0 ?r diningtabletype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
