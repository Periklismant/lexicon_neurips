(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bathtubbasintype toastertype ottomantype - receptacletype
   pottype appletype potatotype kettletype bowltype - objecttype
   location1 location5 - location
   bathtubbasin_1 sinkbasin_2 bathtubbasin_3 ottoman_5 microwave_6 fridge_7 - receptacle
   bowl_5 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 sinkbasin_2 sinkbasintype) (receptacletype_0 bathtubbasin_3 bathtubbasintype) (receptacletype_0 toaster_4 toastertype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pot_1 pottype) (objecttype_0 apple_2 appletype) (objecttype_0 potato_3 potatotype) (objecttype_0 kettle_4 kettletype) (objecttype_0 bowl_5 bowltype) (cancontain sinkbasintype pottype) (cancontain sinkbasintype appletype) (cancontain sinkbasintype potatotype) (cancontain sinkbasintype kettletype) (cancontain sinkbasintype bowltype) (cancontain microwavetype appletype) (cancontain microwavetype potatotype) (cancontain microwavetype bowltype) (cancontain fridgetype pottype) (cancontain fridgetype appletype) (cancontain fridgetype potatotype) (cancontain fridgetype bowltype) (pickupable pot_1) (isreceptacleobject pot_1) (cleanable pot_1) (coolable pot_1) (pickupable apple_2) (cleanable apple_2) (heatable apple_2) (coolable apple_2) (sliceable apple_2) (pickupable potato_3) (cleanable potato_3) (heatable potato_3) (coolable potato_3) (sliceable potato_3) (pickupable kettle_4) (cleanable kettle_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation bathtubbasin_1 location4) (receptacleatlocation sinkbasin_2 location5) (receptacleatlocation bathtubbasin_3 location5) (receptacleatlocation toaster_4 location2) (receptacleatlocation ottoman_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location3) (inreceptacle pot_1 fridge_7) (inreceptacle apple_2 microwave_6) (inreceptacle potato_3 sinkbasin_2) (inreceptacle kettle_4 sinkbasin_2) (inreceptacle bowl_5 sinkbasin_2) (objectatlocation pot_1 location3) (objectatlocation apple_2 location1) (objectatlocation potato_3 location5) (objectatlocation kettle_4 location5) (objectatlocation bowl_5 location5) (atlocation agent1 location5) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 potatotype) (receptacletype_0 ?r_0 sinkbasintype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_5) (hold_6) (hold_7) (hold_8)))
 (:metric minimize (total-cost))
)
