(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bathtubbasintype toastertype ottomantype - receptacletype
   pottype appletype potatotype kettletype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bathtubbasin_1 sinkbasin_2 bathtubbasin_3 toaster_4 ottoman_5 microwave_6 fridge_7 - receptacle
   pot_1 apple_2 potato_3 kettle_4 bowl_5 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 sinkbasin_2 sinkbasintype) (receptacletype_0 bathtubbasin_3 bathtubbasintype) (receptacletype_0 toaster_4 toastertype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pot_1 pottype) (objecttype_0 apple_2 appletype) (objecttype_0 potato_3 potatotype) (objecttype_0 kettle_4 kettletype) (objecttype_0 bowl_5 bowltype) (cancontain sinkbasintype pottype) (cancontain sinkbasintype appletype) (cancontain sinkbasintype potatotype) (cancontain sinkbasintype kettletype) (cancontain sinkbasintype bowltype) (cancontain microwavetype appletype) (cancontain microwavetype potatotype) (cancontain microwavetype bowltype) (cancontain fridgetype pottype) (cancontain fridgetype appletype) (cancontain fridgetype potatotype) (cancontain fridgetype bowltype) (pickupable pot_1) (isreceptacleobject pot_1) (cleanable pot_1) (coolable pot_1) (pickupable apple_2) (cleanable apple_2) (heatable apple_2) (coolable apple_2) (sliceable apple_2) (pickupable potato_3) (cleanable potato_3) (heatable potato_3) (coolable potato_3) (sliceable potato_3) (pickupable kettle_4) (cleanable kettle_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation bathtubbasin_1 location4) (receptacleatlocation sinkbasin_2 location5) (receptacleatlocation bathtubbasin_3 location5) (receptacleatlocation toaster_4 location2) (receptacleatlocation ottoman_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location3) (inreceptacle pot_1 fridge_7) (inreceptacle apple_2 microwave_6) (inreceptacle potato_3 sinkbasin_2) (inreceptacle kettle_4 sinkbasin_2) (inreceptacle bowl_5 sinkbasin_2) (objectatlocation pot_1 location3) (objectatlocation apple_2 location1) (objectatlocation potato_3 location5) (objectatlocation kettle_4 location5) (objectatlocation bowl_5 location5) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o potatotype) (receptacletype_0 ?r sinkbasintype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
