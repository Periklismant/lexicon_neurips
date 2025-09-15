(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype sofatype coffeemachinetype - receptacletype
   platetype winebottletype appletype pantype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   towelholder_1 fridge_2 sofa_3 coffeemachine_4 coffeemachine_5 microwave_6 fridge_7 - receptacle
   plate_1 winebottle_2 apple_3 pan_4 bowl_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 fridge_2 fridgetype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 coffeemachine_5 coffeemachinetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 plate_1 platetype) (objecttype_0 winebottle_2 winebottletype) (objecttype_0 apple_3 appletype) (objecttype_0 pan_4 pantype) (objecttype_0 bowl_5 bowltype) (cancontain fridgetype platetype) (cancontain fridgetype winebottletype) (cancontain fridgetype appletype) (cancontain fridgetype pantype) (cancontain fridgetype bowltype) (cancontain microwavetype platetype) (cancontain microwavetype appletype) (cancontain microwavetype bowltype) (pickupable plate_1) (isreceptacleobject plate_1) (cleanable plate_1) (heatable plate_1) (coolable plate_1) (pickupable winebottle_2) (pickupable apple_3) (cleanable apple_3) (heatable apple_3) (coolable apple_3) (sliceable apple_3) (pickupable pan_4) (isreceptacleobject pan_4) (cleanable pan_4) (coolable pan_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation towelholder_1 location5) (receptacleatlocation fridge_2 location2) (receptacleatlocation sofa_3 location2) (receptacleatlocation coffeemachine_4 location3) (receptacleatlocation coffeemachine_5 location3) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location2) (inreceptacle plate_1 fridge_7) (inreceptacle winebottle_2 fridge_7) (inreceptacle apple_3 fridge_2) (inreceptacle pan_4 fridge_2) (inreceptacle bowl_5 fridge_7) (objectatlocation plate_1 location2) (objectatlocation winebottle_2 location2) (objectatlocation apple_3 location2) (objectatlocation pan_4 location2) (objectatlocation bowl_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 appletype) (receptacletype_0 ?r_0 fridgetype))))))
 (:constraints (sometime (atlocation agent1 location2)) (sometime (checked sofa_3)) (sometime (checked plate_1)) (sometime (or (checked fridge_7) (checked pan_4))) (sometime (or (objectatlocation bowl_5 location1) (checked microwave_6))) (sometime (checked winebottle_2)) (sometime (atlocation agent1 location4)) (sometime (or (atlocation agent1 location5) (checked location4))) (sometime (or (objectatlocation apple_3 location1) (holds agent1 pan_4))) (sometime (or (holds agent1 pan_4) (atlocation agent1 location5))))
 (:metric minimize (total-cost))
)
