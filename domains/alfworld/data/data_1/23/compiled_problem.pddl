(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   coffeetabletype bedtype drawertype carttype diningtabletype - receptacletype
   breadtype wateringcantype bowltype cellphonetype mugtype - objecttype
   location2 location3 location5 - location
   coffeetable_1 bed_2 drawer_3 cart_4 diningtable_5 microwave_6 fridge_7 - receptacle
   bread_1 wateringcan_2 bowl_3 - obj
 )
 (:init (receptacletype_0 coffeetable_1 coffeetabletype) (receptacletype_0 bed_2 bedtype) (receptacletype_0 drawer_3 drawertype) (receptacletype_0 cart_4 carttype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 bread_1 breadtype) (objecttype_0 wateringcan_2 wateringcantype) (objecttype_0 bowl_3 bowltype) (objecttype_0 cellphone_4 cellphonetype) (objecttype_0 mug_5 mugtype) (cancontain coffeetabletype breadtype) (cancontain coffeetabletype wateringcantype) (cancontain coffeetabletype bowltype) (cancontain coffeetabletype cellphonetype) (cancontain coffeetabletype mugtype) (cancontain bedtype cellphonetype) (cancontain drawertype wateringcantype) (cancontain drawertype cellphonetype) (cancontain carttype mugtype) (cancontain diningtabletype breadtype) (cancontain diningtabletype wateringcantype) (cancontain diningtabletype bowltype) (cancontain diningtabletype cellphonetype) (cancontain diningtabletype mugtype) (cancontain microwavetype breadtype) (cancontain microwavetype bowltype) (cancontain microwavetype mugtype) (cancontain fridgetype breadtype) (cancontain fridgetype bowltype) (cancontain fridgetype mugtype) (pickupable bread_1) (heatable bread_1) (coolable bread_1) (sliceable bread_1) (pickupable wateringcan_2) (pickupable bowl_3) (isreceptacleobject bowl_3) (cleanable bowl_3) (coolable bowl_3) (pickupable cellphone_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation coffeetable_1 location5) (receptacleatlocation bed_2 location5) (receptacleatlocation drawer_3 location3) (receptacleatlocation cart_4 location1) (receptacleatlocation diningtable_5 location1) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location3) (inreceptacle bread_1 coffeetable_1) (inreceptacle wateringcan_2 diningtable_5) (inreceptacle bowl_3 microwave_6) (inreceptacle cellphone_4 drawer_3) (inreceptacle mug_5 microwave_6) (objectatlocation bread_1 location5) (objectatlocation wateringcan_2 location1) (objectatlocation bowl_3 location4) (objectatlocation cellphone_4 location3) (objectatlocation mug_5 location4) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 mugtype) (receptacletype_0 ?r_0 diningtabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 bowltype) (receptacletype_0 ?r_0 diningtabletype) (inreceptacle ?o2 ?r_0)))))) (hold_0)))
 (:metric minimize (total-cost))
)
