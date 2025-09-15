(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   countertoptype sidetabletype desktype - receptacletype
   cdtype toiletpapertype peppershakertype tomatotype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   countertop_1 sidetable_2 microwave_3 desk_4 microwave_5 microwave_6 fridge_7 - receptacle
   cd_1 toiletpaper_2 peppershaker_3 tomato_4 mug_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 sidetable_2 sidetabletype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 desk_4 desktype) (receptacletype_0 microwave_5 microwavetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 cd_1 cdtype) (objecttype_0 toiletpaper_2 toiletpapertype) (objecttype_0 peppershaker_3 peppershakertype) (objecttype_0 tomato_4 tomatotype) (objecttype_0 mug_5 mugtype) (cancontain countertoptype cdtype) (cancontain countertoptype toiletpapertype) (cancontain countertoptype peppershakertype) (cancontain countertoptype tomatotype) (cancontain countertoptype mugtype) (cancontain sidetabletype toiletpapertype) (cancontain sidetabletype peppershakertype) (cancontain sidetabletype tomatotype) (cancontain sidetabletype mugtype) (cancontain microwavetype tomatotype) (cancontain microwavetype mugtype) (cancontain desktype toiletpapertype) (cancontain desktype mugtype) (cancontain fridgetype tomatotype) (cancontain fridgetype mugtype) (pickupable cd_1) (pickupable toiletpaper_2) (pickupable peppershaker_3) (pickupable tomato_4) (cleanable tomato_4) (heatable tomato_4) (coolable tomato_4) (sliceable tomato_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation countertop_1 location5) (receptacleatlocation sidetable_2 location2) (receptacleatlocation microwave_3 location1) (receptacleatlocation desk_4 location1) (receptacleatlocation microwave_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location2) (inreceptacle cd_1 countertop_1) (inreceptacle toiletpaper_2 sidetable_2) (inreceptacle peppershaker_3 countertop_1) (inreceptacle tomato_4 microwave_6) (inreceptacle mug_5 sidetable_2) (objectatlocation cd_1 location5) (objectatlocation toiletpaper_2 location2) (objectatlocation peppershaker_3 location5) (objectatlocation tomato_4 location2) (objectatlocation mug_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o mugtype) (receptacletype_0 ?r sidetabletype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
