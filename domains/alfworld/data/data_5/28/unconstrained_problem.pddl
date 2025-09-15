(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   countertoptype sidetabletype desktype - receptacletype
   baseballbattype tomatotype ladletype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   countertop_1 sidetable_2 microwave_3 desk_4 microwave_5 microwave_6 fridge_7 - receptacle
   baseballbat_1 tomato_2 ladle_3 baseballbat_4 mug_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 sidetable_2 sidetabletype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 desk_4 desktype) (receptacletype_0 microwave_5 microwavetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 baseballbat_1 baseballbattype) (objecttype_0 tomato_2 tomatotype) (objecttype_0 ladle_3 ladletype) (objecttype_0 baseballbat_4 baseballbattype) (objecttype_0 mug_5 mugtype) (cancontain countertoptype baseballbattype) (cancontain countertoptype tomatotype) (cancontain countertoptype ladletype) (cancontain countertoptype mugtype) (cancontain sidetabletype baseballbattype) (cancontain sidetabletype tomatotype) (cancontain sidetabletype ladletype) (cancontain sidetabletype mugtype) (cancontain microwavetype tomatotype) (cancontain microwavetype mugtype) (cancontain desktype mugtype) (cancontain fridgetype tomatotype) (cancontain fridgetype mugtype) (pickupable baseballbat_1) (pickupable tomato_2) (cleanable tomato_2) (heatable tomato_2) (coolable tomato_2) (sliceable tomato_2) (pickupable ladle_3) (cleanable ladle_3) (pickupable baseballbat_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation countertop_1 location5) (receptacleatlocation sidetable_2 location1) (receptacleatlocation microwave_3 location2) (receptacleatlocation desk_4 location5) (receptacleatlocation microwave_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location2) (inreceptacle baseballbat_1 countertop_1) (inreceptacle tomato_2 fridge_7) (inreceptacle ladle_3 countertop_1) (inreceptacle baseballbat_4 sidetable_2) (inreceptacle mug_5 fridge_7) (objectatlocation baseballbat_1 location5) (objectatlocation tomato_2 location2) (objectatlocation ladle_3 location5) (objectatlocation baseballbat_4 location1) (objectatlocation mug_5 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 tomatotype) (receptacletype_0 ?r sidetabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 ladletype) (receptacletype_0 ?r sidetabletype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
