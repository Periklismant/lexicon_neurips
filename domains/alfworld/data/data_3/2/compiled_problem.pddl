(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bathtubbasintype drawertype coffeetabletype - receptacletype
   breadtype tennisrackettype boxtype - objecttype
   location1 location2 - location
   bathtubbasin_1 drawer_2 microwave_4 fridge_5 - receptacle
   bread_1 tennisracket_2 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 drawer_2 drawertype) (receptacletype_0 coffeetable_3 coffeetabletype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 bread_1 breadtype) (objecttype_0 tennisracket_2 tennisrackettype) (objecttype_0 box_3 boxtype) (cancontain coffeetabletype breadtype) (cancontain coffeetabletype tennisrackettype) (cancontain coffeetabletype boxtype) (cancontain microwavetype breadtype) (cancontain fridgetype breadtype) (pickupable bread_1) (heatable bread_1) (coolable bread_1) (sliceable bread_1) (pickupable tennisracket_2) (pickupable box_3) (isreceptacleobject box_3) (receptacleatlocation bathtubbasin_1 location2) (receptacleatlocation drawer_2 location2) (receptacleatlocation coffeetable_3 location2) (receptacleatlocation microwave_4 location3) (receptacleatlocation fridge_5 location1) (inreceptacle bread_1 fridge_5) (inreceptacle tennisracket_2 coffeetable_3) (inreceptacle box_3 coffeetable_3) (objectatlocation bread_1 location1) (objectatlocation tennisracket_2 location2) (objectatlocation box_3 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 boxtype) (receptacletype_0 ?r_0 coffeetabletype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 tennisrackettype) (receptacletype_0 ?r_0 coffeetabletype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
