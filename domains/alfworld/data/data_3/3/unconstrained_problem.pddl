(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   armchairtype ottomantype - receptacletype
   appletype pantype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 - location
   sinkbasin_1 armchair_2 ottoman_3 microwave_4 fridge_5 - receptacle
   apple_1 pan_2 cup_3 - obj
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 armchair_2 armchairtype) (receptacletype_0 ottoman_3 ottomantype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 apple_1 appletype) (objecttype_0 pan_2 pantype) (objecttype_0 cup_3 cuptype) (cancontain sinkbasintype appletype) (cancontain sinkbasintype pantype) (cancontain sinkbasintype cuptype) (cancontain microwavetype appletype) (cancontain microwavetype cuptype) (cancontain fridgetype appletype) (cancontain fridgetype pantype) (cancontain fridgetype cuptype) (pickupable apple_1) (cleanable apple_1) (heatable apple_1) (coolable apple_1) (sliceable apple_1) (pickupable pan_2) (isreceptacleobject pan_2) (cleanable pan_2) (coolable pan_2) (pickupable cup_3) (isreceptacleobject cup_3) (cleanable cup_3) (heatable cup_3) (coolable cup_3) (receptacleatlocation sinkbasin_1 location2) (receptacleatlocation armchair_2 location3) (receptacleatlocation ottoman_3 location2) (receptacleatlocation microwave_4 location2) (receptacleatlocation fridge_5 location1) (inreceptacle apple_1 fridge_5) (inreceptacle pan_2 fridge_5) (inreceptacle cup_3 sinkbasin_1) (objectatlocation apple_1 location1) (objectatlocation pan_2 location1) (objectatlocation cup_3 location2) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o appletype) (receptacletype_0 ?r fridgetype))))))
 (:metric minimize (total-cost))
)
