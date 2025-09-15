(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   stoveburnertype - receptacletype
   winebottletype pantype - objecttype
   location2 - location
   fridge_1 stoveburner_2 microwave_3 fridge_4 - receptacle
   pan_2 - obj
 )
 (:init (receptacletype_0 fridge_1 fridgetype) (receptacletype_0 stoveburner_2 stoveburnertype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 winebottle_1 winebottletype) (objecttype_0 pan_2 pantype) (cancontain fridgetype winebottletype) (cancontain fridgetype pantype) (cancontain stoveburnertype pantype) (pickupable winebottle_1) (pickupable pan_2) (isreceptacleobject pan_2) (cleanable pan_2) (coolable pan_2) (receptacleatlocation fridge_1 location1) (receptacleatlocation stoveburner_2 location1) (receptacleatlocation microwave_3 location1) (receptacleatlocation fridge_4 location1) (inreceptacle winebottle_1 fridge_4) (inreceptacle pan_2 fridge_1) (objectatlocation winebottle_1 location1) (objectatlocation pan_2 location1) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pantype) (receptacletype_0 ?r_0 fridgetype)))) (hold_0)))
 (:metric minimize (total-cost))
)
