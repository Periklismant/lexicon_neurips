(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   sofatype coffeemachinetype stoveburnertype laundryhampertype - receptacletype
   tomatotype pantype mugtype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sofa_1 coffeemachine_2 microwave_3 stoveburner_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   tomato_1 pan_2 mug_3 plate_4 mug_5 - obj
 )
 (:init (receptacletype_0 sofa_1 sofatype) (receptacletype_0 coffeemachine_2 coffeemachinetype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 stoveburner_4 stoveburnertype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tomato_1 tomatotype) (objecttype_0 pan_2 pantype) (objecttype_0 mug_3 mugtype) (objecttype_0 plate_4 platetype) (objecttype_0 mug_5 mugtype) (cancontain coffeemachinetype mugtype) (cancontain microwavetype tomatotype) (cancontain microwavetype mugtype) (cancontain microwavetype platetype) (cancontain stoveburnertype pantype) (cancontain fridgetype tomatotype) (cancontain fridgetype pantype) (cancontain fridgetype mugtype) (cancontain fridgetype platetype) (pickupable tomato_1) (cleanable tomato_1) (heatable tomato_1) (coolable tomato_1) (sliceable tomato_1) (pickupable pan_2) (isreceptacleobject pan_2) (cleanable pan_2) (coolable pan_2) (pickupable mug_3) (isreceptacleobject mug_3) (cleanable mug_3) (heatable mug_3) (coolable mug_3) (pickupable plate_4) (isreceptacleobject plate_4) (cleanable plate_4) (heatable plate_4) (coolable plate_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation sofa_1 location1) (receptacleatlocation coffeemachine_2 location5) (receptacleatlocation microwave_3 location2) (receptacleatlocation stoveburner_4 location2) (receptacleatlocation laundryhamper_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location3) (inreceptacle tomato_1 microwave_3) (inreceptacle pan_2 stoveburner_4) (inreceptacle mug_3 coffeemachine_2) (inreceptacle plate_4 microwave_3) (inreceptacle mug_5 microwave_6) (objectatlocation tomato_1 location2) (objectatlocation pan_2 location2) (objectatlocation mug_3 location5) (objectatlocation plate_4 location2) (objectatlocation mug_5 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 tomatotype) (receptacletype_0 ?r_0 microwavetype))))))
 (:constraints (sometime (atlocation agent1 location2)) (sometime (or (holds agent1 mug_3) (objectatlocation mug_5 location2))) (sometime (or (objectatlocation mug_5 location2) (holds agent1 mug_5))))
 (:metric minimize (total-cost))
)
