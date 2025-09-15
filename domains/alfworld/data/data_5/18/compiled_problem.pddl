(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   cabinettype coffeetabletype safetype ottomantype desktype - receptacletype
   breadtype handtoweltype baseballbattype bowltype boxtype - objecttype
   location2 location4 - location
   cabinet_1 coffeetable_2 safe_3 ottoman_4 desk_5 microwave_6 fridge_7 - receptacle
   bread_1 handtowel_2 box_5 - obj
 )
 (:init (receptacletype_0 cabinet_1 cabinettype) (receptacletype_0 coffeetable_2 coffeetabletype) (receptacletype_0 safe_3 safetype) (receptacletype_0 ottoman_4 ottomantype) (receptacletype_0 desk_5 desktype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 bread_1 breadtype) (objecttype_0 handtowel_2 handtoweltype) (objecttype_0 baseballbat_3 baseballbattype) (objecttype_0 bowl_4 bowltype) (objecttype_0 box_5 boxtype) (cancontain cabinettype handtoweltype) (cancontain cabinettype bowltype) (cancontain cabinettype boxtype) (cancontain coffeetabletype breadtype) (cancontain coffeetabletype handtoweltype) (cancontain coffeetabletype baseballbattype) (cancontain coffeetabletype bowltype) (cancontain coffeetabletype boxtype) (cancontain ottomantype boxtype) (cancontain desktype bowltype) (cancontain desktype boxtype) (cancontain microwavetype breadtype) (cancontain microwavetype bowltype) (cancontain fridgetype breadtype) (cancontain fridgetype bowltype) (pickupable bread_1) (heatable bread_1) (coolable bread_1) (sliceable bread_1) (pickupable handtowel_2) (pickupable baseballbat_3) (pickupable bowl_4) (isreceptacleobject bowl_4) (cleanable bowl_4) (coolable bowl_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation cabinet_1 location3) (receptacleatlocation coffeetable_2 location1) (receptacleatlocation safe_3 location3) (receptacleatlocation ottoman_4 location4) (receptacleatlocation desk_5 location1) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location2) (inreceptacle bread_1 coffeetable_2) (inreceptacle handtowel_2 coffeetable_2) (inreceptacle baseballbat_3 coffeetable_2) (inreceptacle bowl_4 coffeetable_2) (inreceptacle box_5 desk_5) (objectatlocation bread_1 location1) (objectatlocation handtowel_2 location1) (objectatlocation baseballbat_3 location1) (objectatlocation bowl_4 location1) (objectatlocation box_5 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 boxtype) (receptacletype_0 ?r_0 desktype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
