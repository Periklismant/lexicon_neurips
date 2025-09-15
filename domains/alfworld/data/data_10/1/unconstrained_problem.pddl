(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype - receptacletype
   eggtype platetype - objecttype
   agent1 - agent
   location1 location2 - location
   sinkbasin_1 dresser_2 microwave_3 fridge_4 - receptacle
   egg_1 plate_2 - obj
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 dresser_2 dressertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 egg_1 eggtype) (objecttype_0 plate_2 platetype) (cancontain sinkbasintype eggtype) (cancontain sinkbasintype platetype) (cancontain dressertype platetype) (cancontain microwavetype eggtype) (cancontain microwavetype platetype) (cancontain fridgetype eggtype) (cancontain fridgetype platetype) (pickupable egg_1) (cleanable egg_1) (heatable egg_1) (coolable egg_1) (sliceable egg_1) (pickupable plate_2) (isreceptacleobject plate_2) (cleanable plate_2) (heatable plate_2) (coolable plate_2) (receptacleatlocation sinkbasin_1 location1) (receptacleatlocation dresser_2 location1) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location2) (inreceptacle egg_1 fridge_4) (inreceptacle plate_2 dresser_2) (objectatlocation egg_1 location2) (objectatlocation plate_2 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o platetype) (receptacletype_0 ?r dressertype))))))
 (:metric minimize (total-cost))
)
