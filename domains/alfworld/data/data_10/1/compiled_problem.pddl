(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   dressertype - receptacletype
   eggtype platetype - objecttype
   sinkbasin_1 dresser_2 - receptacle
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 dresser_2 dressertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 egg_1 eggtype) (objecttype_0 plate_2 platetype) (cancontain sinkbasintype eggtype) (cancontain sinkbasintype platetype) (cancontain dressertype platetype) (cancontain microwavetype eggtype) (cancontain microwavetype platetype) (cancontain fridgetype eggtype) (cancontain fridgetype platetype) (pickupable egg_1) (cleanable egg_1) (heatable egg_1) (coolable egg_1) (sliceable egg_1) (pickupable plate_2) (isreceptacleobject plate_2) (cleanable plate_2) (heatable plate_2) (coolable plate_2) (receptacleatlocation sinkbasin_1 location1) (receptacleatlocation dresser_2 location1) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location2) (inreceptacle egg_1 fridge_4) (inreceptacle plate_2 dresser_2) (objectatlocation egg_1 location2) (objectatlocation plate_2 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 dressertype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
