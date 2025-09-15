(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   cabinettype ottomantype dressertype diningtabletype - receptacletype
   forktype penciltype kettletype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sinkbasin_1 cabinet_2 ottoman_3 dresser_4 diningtable_5 microwave_6 fridge_7 - receptacle
   fork_1 pencil_2 pencil_3 kettle_4 pan_5 - obj
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 cabinet_2 cabinettype) (receptacletype_0 ottoman_3 ottomantype) (receptacletype_0 dresser_4 dressertype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 fork_1 forktype) (objecttype_0 pencil_2 penciltype) (objecttype_0 pencil_3 penciltype) (objecttype_0 kettle_4 kettletype) (objecttype_0 pan_5 pantype) (cancontain sinkbasintype forktype) (cancontain sinkbasintype kettletype) (cancontain sinkbasintype pantype) (cancontain cabinettype kettletype) (cancontain cabinettype pantype) (cancontain dressertype penciltype) (cancontain diningtabletype forktype) (cancontain diningtabletype penciltype) (cancontain diningtabletype kettletype) (cancontain diningtabletype pantype) (cancontain fridgetype pantype) (pickupable fork_1) (cleanable fork_1) (pickupable pencil_2) (pickupable pencil_3) (pickupable kettle_4) (cleanable kettle_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation sinkbasin_1 location3) (receptacleatlocation cabinet_2 location1) (receptacleatlocation ottoman_3 location3) (receptacleatlocation dresser_4 location3) (receptacleatlocation diningtable_5 location1) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle fork_1 sinkbasin_1) (inreceptacle pencil_2 dresser_4) (inreceptacle pencil_3 diningtable_5) (inreceptacle kettle_4 sinkbasin_1) (inreceptacle pan_5 sinkbasin_1) (objectatlocation fork_1 location3) (objectatlocation pencil_2 location3) (objectatlocation pencil_3 location1) (objectatlocation kettle_4 location3) (objectatlocation pan_5 location3) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 pantype) (receptacletype_0 ?r_0 sinkbasintype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (or (checked microwave_6) (holds agent1 fork_1))) (sometime (atlocation agent1 location4)) (sometime-after (atlocation agent1 location4) (or (checked ottoman_3) (checked location3))) (sometime (or (atlocation agent1 location5) (checked location1))) (sometime (holds agent1 pan_5)) (sometime-before (holds agent1 pan_5) (or (objectatlocation fork_1 location4) (holds agent1 fork_1))) (sometime (or (checked location2) (checked cabinet_2))) (sometime (atlocation agent1 location2)) (sometime (atlocation agent1 location3)) (sometime-before (atlocation agent1 location3) (checked location2)) (sometime (holds agent1 fork_1)) (sometime (objectatlocation pan_5 location4)) (sometime (checked location3)))
 (:metric minimize (total-cost))
)
