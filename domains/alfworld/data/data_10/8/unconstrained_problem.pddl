(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   laundryhampertype - receptacletype
   pottype mugtype - objecttype
   agent1 - agent
   location1 location2 - location
   fridge_1 laundryhamper_2 microwave_3 fridge_4 - receptacle
   pot_1 mug_2 - obj
 )
 (:init (receptacletype_0 fridge_1 fridgetype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 pot_1 pottype) (objecttype_0 mug_2 mugtype) (cancontain fridgetype pottype) (cancontain fridgetype mugtype) (cancontain microwavetype mugtype) (pickupable pot_1) (isreceptacleobject pot_1) (cleanable pot_1) (coolable pot_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (receptacleatlocation fridge_1 location2) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location1) (inreceptacle pot_1 fridge_1) (inreceptacle mug_2 fridge_4) (objectatlocation pot_1 location2) (objectatlocation mug_2 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o pottype) (receptacletype_0 ?r fridgetype))))))
 (:metric minimize (total-cost))
)
