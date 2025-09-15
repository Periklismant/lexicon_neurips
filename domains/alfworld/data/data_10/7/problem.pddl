(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype - receptacletype
   pantype platetype - objecttype
   agent1 - agent
   location1 location2 - location
   towelholder_1 towelholder_2 microwave_3 fridge_4 - receptacle
   pan_1 plate_2 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 towelholder_2 towelholdertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 pan_1 pantype) (objecttype_0 plate_2 platetype) (cancontain microwavetype platetype) (cancontain fridgetype pantype) (cancontain fridgetype platetype) (pickupable pan_1) (isreceptacleobject pan_1) (cleanable pan_1) (coolable pan_1) (pickupable plate_2) (isreceptacleobject plate_2) (cleanable plate_2) (heatable plate_2) (coolable plate_2) (receptacleatlocation towelholder_1 location2) (receptacleatlocation towelholder_2 location2) (receptacleatlocation microwave_3 location2) (receptacleatlocation fridge_4 location1) (inreceptacle pan_1 fridge_4) (inreceptacle plate_2 microwave_3) (objectatlocation pan_1 location1) (objectatlocation plate_2 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pantype) (receptacletype_0 ?r_0 fridgetype))))))
 (:constraints (sometime (checked pan_1)) (sometime (or (holdsany agent1) (inreceptacleobject plate_2 pan_1))) (sometime (and (holds agent1 pan_1) (checked microwave_3))) (sometime (checked location1)) (sometime (or (objectatlocation pan_1 location2) (checked towelholder_2))) (sometime (and (holds agent1 plate_2) (atlocation agent1 location1))) (sometime (atlocation agent1 location1)) (sometime (or (holds agent1 plate_2) (checked towelholder_1))) (sometime (holdsany agent1)) (sometime (checked microwave_3)))
 (:metric minimize (total-cost))
)
