(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   laundryhampertype sidetabletype bathtubbasintype shelftype - receptacletype
   forktype toiletpaperrolltype boxtype cuptype - objecttype
   location5 - location
   laundryhamper_1 sidetable_2 sinkbasin_3 bathtubbasin_4 shelf_5 microwave_6 - receptacle
   fork_1 toiletpaperroll_2 box_3 - obj
 )
 (:init (receptacletype_0 laundryhamper_1 laundryhampertype) (receptacletype_0 sidetable_2 sidetabletype) (receptacletype_0 sinkbasin_3 sinkbasintype) (receptacletype_0 bathtubbasin_4 bathtubbasintype) (receptacletype_0 shelf_5 shelftype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 fork_1 forktype) (objecttype_0 toiletpaperroll_2 toiletpaperrolltype) (objecttype_0 box_3 boxtype) (objecttype_0 box_4 boxtype) (objecttype_0 cup_5 cuptype) (cancontain sidetabletype forktype) (cancontain sidetabletype toiletpaperrolltype) (cancontain sidetabletype boxtype) (cancontain sidetabletype cuptype) (cancontain sinkbasintype forktype) (cancontain sinkbasintype cuptype) (cancontain shelftype toiletpaperrolltype) (cancontain shelftype boxtype) (cancontain shelftype cuptype) (cancontain microwavetype cuptype) (cancontain fridgetype cuptype) (pickupable fork_1) (cleanable fork_1) (pickupable toiletpaperroll_2) (pickupable box_3) (isreceptacleobject box_3) (pickupable box_4) (isreceptacleobject box_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation laundryhamper_1 location5) (receptacleatlocation sidetable_2 location4) (receptacleatlocation sinkbasin_3 location5) (receptacleatlocation bathtubbasin_4 location4) (receptacleatlocation shelf_5 location2) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location2) (inreceptacle fork_1 sidetable_2) (inreceptacle toiletpaperroll_2 shelf_5) (inreceptacle box_3 shelf_5) (inreceptacle box_4 shelf_5) (inreceptacle cup_5 shelf_5) (objectatlocation fork_1 location4) (objectatlocation toiletpaperroll_2 location2) (objectatlocation box_3 location2) (objectatlocation box_4 location2) (objectatlocation cup_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 toiletpaperrolltype) (receptacletype_0 ?r_0 shelftype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 cuptype) (receptacletype_0 ?r_0 shelftype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
