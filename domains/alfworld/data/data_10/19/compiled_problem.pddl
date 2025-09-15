(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   cabinettype ottomantype dressertype diningtabletype - receptacletype
   forktype penciltype kettletype pantype - objecttype
   sinkbasin_1 dresser_4 diningtable_5 fridge_7 - receptacle
   pencil_2 pencil_3 kettle_4 - obj
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 cabinet_2 cabinettype) (receptacletype_0 ottoman_3 ottomantype) (receptacletype_0 dresser_4 dressertype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 fork_1 forktype) (objecttype_0 pencil_2 penciltype) (objecttype_0 pencil_3 penciltype) (objecttype_0 kettle_4 kettletype) (objecttype_0 pan_5 pantype) (cancontain sinkbasintype forktype) (cancontain sinkbasintype kettletype) (cancontain sinkbasintype pantype) (cancontain cabinettype kettletype) (cancontain cabinettype pantype) (cancontain dressertype penciltype) (cancontain diningtabletype forktype) (cancontain diningtabletype penciltype) (cancontain diningtabletype kettletype) (cancontain diningtabletype pantype) (cancontain fridgetype pantype) (pickupable fork_1) (cleanable fork_1) (pickupable pencil_2) (pickupable pencil_3) (pickupable kettle_4) (cleanable kettle_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation sinkbasin_1 location3) (receptacleatlocation cabinet_2 location1) (receptacleatlocation ottoman_3 location3) (receptacleatlocation dresser_4 location3) (receptacleatlocation diningtable_5 location1) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle fork_1 sinkbasin_1) (inreceptacle pencil_2 dresser_4) (inreceptacle pencil_3 diningtable_5) (inreceptacle kettle_4 sinkbasin_1) (inreceptacle pan_5 sinkbasin_1) (objectatlocation fork_1 location3) (objectatlocation pencil_2 location3) (objectatlocation pencil_3 location1) (objectatlocation kettle_4 location3) (objectatlocation pan_5 location3) (atlocation agent1 location1) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 pantype) (receptacletype_0 ?r_0 sinkbasintype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6) (hold_7) (hold_8) (hold_10) (hold_11) (hold_12)))
 (:metric minimize (total-cost))
)
