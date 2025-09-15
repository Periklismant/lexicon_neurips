(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bathtubbasintype coffeemachinetype - receptacletype
   platetype cuptype - objecttype
   agent1 - agent
   location1 location2 - location
   bathtubbasin_1 coffeemachine_2 microwave_3 fridge_4 - receptacle
   plate_1 cup_2 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 coffeemachine_2 coffeemachinetype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 plate_1 platetype) (objecttype_0 cup_2 cuptype) (cancontain microwavetype platetype) (cancontain microwavetype cuptype) (cancontain fridgetype platetype) (cancontain fridgetype cuptype) (pickupable plate_1) (isreceptacleobject plate_1) (cleanable plate_1) (heatable plate_1) (coolable plate_1) (pickupable cup_2) (isreceptacleobject cup_2) (cleanable cup_2) (heatable cup_2) (coolable cup_2) (receptacleatlocation bathtubbasin_1 location1) (receptacleatlocation coffeemachine_2 location1) (receptacleatlocation microwave_3 location2) (receptacleatlocation fridge_4 location2) (inreceptacle plate_1 fridge_4) (inreceptacle cup_2 fridge_4) (objectatlocation plate_1 location2) (objectatlocation cup_2 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 cuptype) (receptacletype_0 ?r_0 fridgetype))))))
 (:constraints (sometime (or (checked microwave_3) (inreceptacleobject plate_1 cup_2))) (sometime (holdsany agent1)) (sometime (and (checked microwave_3) (checked location1))) (sometime (atlocation agent1 location2)) (sometime (or (holdsany agent1) (atlocation agent1 location2))) (sometime (checked plate_1)) (sometime (and (atlocation agent1 location2) (checked fridge_4))) (sometime (checked location1)) (sometime (or (checked plate_1) (holds agent1 cup_2))) (sometime (checked fridge_4)))
 (:metric minimize (total-cost))
)
