(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   countertoptype coffeemachinetype stoveburnertype cabinettype diningtabletype - receptacletype
   spoontype handtoweltype booktype wateringcantype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   countertop_1 coffeemachine_2 stoveburner_3 cabinet_4 diningtable_5 microwave_6 fridge_7 - receptacle
   spoon_1 handtowel_2 book_3 wateringcan_4 mug_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 coffeemachine_2 coffeemachinetype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 cabinet_4 cabinettype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 spoon_1 spoontype) (objecttype_0 handtowel_2 handtoweltype) (objecttype_0 book_3 booktype) (objecttype_0 wateringcan_4 wateringcantype) (objecttype_0 mug_5 mugtype) (cancontain countertoptype spoontype) (cancontain countertoptype handtoweltype) (cancontain countertoptype booktype) (cancontain countertoptype wateringcantype) (cancontain countertoptype mugtype) (cancontain coffeemachinetype mugtype) (cancontain cabinettype handtoweltype) (cancontain cabinettype booktype) (cancontain cabinettype wateringcantype) (cancontain cabinettype mugtype) (cancontain diningtabletype spoontype) (cancontain diningtabletype handtoweltype) (cancontain diningtabletype booktype) (cancontain diningtabletype wateringcantype) (cancontain diningtabletype mugtype) (cancontain microwavetype mugtype) (cancontain fridgetype mugtype) (pickupable spoon_1) (cleanable spoon_1) (pickupable handtowel_2) (pickupable book_3) (pickupable wateringcan_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation countertop_1 location2) (receptacleatlocation coffeemachine_2 location3) (receptacleatlocation stoveburner_3 location3) (receptacleatlocation cabinet_4 location2) (receptacleatlocation diningtable_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location2) (inreceptacle spoon_1 diningtable_5) (inreceptacle handtowel_2 diningtable_5) (inreceptacle book_3 countertop_1) (inreceptacle wateringcan_4 diningtable_5) (inreceptacle mug_5 countertop_1) (objectatlocation spoon_1 location5) (objectatlocation handtowel_2 location5) (objectatlocation book_3 location2) (objectatlocation wateringcan_4 location5) (objectatlocation mug_5 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 booktype) (receptacletype_0 ?r cabinettype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 mugtype) (receptacletype_0 ?r cabinettype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
