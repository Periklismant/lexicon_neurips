(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bathtubbasintype toiletpaperhangertype - receptacletype
   mugtype bowltype - objecttype
   location1 location2 location3 - location
   bathtubbasin_1 toiletpaperhanger_2 sinkbasin_3 microwave_4 fridge_5 - receptacle
   bowl_3 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 sinkbasin_3 sinkbasintype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 knife_1 knifetype) (objecttype_0 mug_2 mugtype) (objecttype_0 bowl_3 bowltype) (cancontain sinkbasintype knifetype) (cancontain sinkbasintype mugtype) (cancontain sinkbasintype bowltype) (cancontain microwavetype mugtype) (cancontain microwavetype bowltype) (cancontain fridgetype mugtype) (cancontain fridgetype bowltype) (pickupable knife_1) (cleanable knife_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (pickupable bowl_3) (isreceptacleobject bowl_3) (cleanable bowl_3) (coolable bowl_3) (receptacleatlocation bathtubbasin_1 location3) (receptacleatlocation toiletpaperhanger_2 location1) (receptacleatlocation sinkbasin_3 location3) (receptacleatlocation microwave_4 location1) (receptacleatlocation fridge_5 location1) (inreceptacle knife_1 sinkbasin_3) (inreceptacle mug_2 sinkbasin_3) (inreceptacle bowl_3 microwave_4) (objectatlocation knife_1 location3) (objectatlocation mug_2 location3) (objectatlocation bowl_3 location1) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 mugtype) (receptacletype_0 ?r_0 sinkbasintype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
