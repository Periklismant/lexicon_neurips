(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   cabinettype ottomantype dressertype diningtabletype - receptacletype
   forktype ladletype tennisrackettype pantype - objecttype
   location1 - location
   sinkbasin_1 cabinet_2 ottoman_3 dresser_4 diningtable_5 fridge_7 - receptacle
   fork_3 - obj
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 cabinet_2 cabinettype) (receptacletype_0 ottoman_3 ottomantype) (receptacletype_0 dresser_4 dressertype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 fork_1 forktype) (objecttype_0 ladle_2 ladletype) (objecttype_0 fork_3 forktype) (objecttype_0 tennisracket_4 tennisrackettype) (objecttype_0 pan_5 pantype) (cancontain sinkbasintype forktype) (cancontain sinkbasintype ladletype) (cancontain sinkbasintype pantype) (cancontain cabinettype ladletype) (cancontain cabinettype pantype) (cancontain dressertype tennisrackettype) (cancontain diningtabletype forktype) (cancontain diningtabletype ladletype) (cancontain diningtabletype tennisrackettype) (cancontain diningtabletype pantype) (cancontain fridgetype pantype) (pickupable fork_1) (cleanable fork_1) (pickupable ladle_2) (cleanable ladle_2) (pickupable fork_3) (cleanable fork_3) (pickupable tennisracket_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation sinkbasin_1 location3) (receptacleatlocation cabinet_2 location1) (receptacleatlocation ottoman_3 location3) (receptacleatlocation dresser_4 location4) (receptacleatlocation diningtable_5 location1) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle fork_1 diningtable_5) (inreceptacle ladle_2 sinkbasin_1) (inreceptacle fork_3 sinkbasin_1) (inreceptacle tennisracket_4 dresser_4) (inreceptacle pan_5 diningtable_5) (objectatlocation fork_1 location1) (objectatlocation ladle_2 location3) (objectatlocation fork_3 location3) (objectatlocation tennisracket_4 location4) (objectatlocation pan_5 location1) (atlocation agent1 location1) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 forktype) (receptacletype_0 ?r_0 sinkbasintype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 pantype) (receptacletype_0 ?r_0 sinkbasintype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
