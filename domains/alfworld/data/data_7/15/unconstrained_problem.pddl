(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   ottomantype bathtubbasintype bedtype - receptacletype
   pottype remotecontroltype lettucetype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   ottoman_1 bathtubbasin_2 bed_3 bathtubbasin_4 microwave_5 microwave_6 fridge_7 - receptacle
   pot_1 remotecontrol_2 remotecontrol_3 lettuce_4 cup_5 - obj
 )
 (:init (receptacletype_0 ottoman_1 ottomantype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 bed_3 bedtype) (receptacletype_0 bathtubbasin_4 bathtubbasintype) (receptacletype_0 microwave_5 microwavetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pot_1 pottype) (objecttype_0 remotecontrol_2 remotecontroltype) (objecttype_0 remotecontrol_3 remotecontroltype) (objecttype_0 lettuce_4 lettucetype) (objecttype_0 cup_5 cuptype) (cancontain ottomantype remotecontroltype) (cancontain microwavetype cuptype) (cancontain fridgetype pottype) (cancontain fridgetype lettucetype) (cancontain fridgetype cuptype) (pickupable pot_1) (isreceptacleobject pot_1) (cleanable pot_1) (coolable pot_1) (pickupable remotecontrol_2) (pickupable remotecontrol_3) (pickupable lettuce_4) (cleanable lettuce_4) (coolable lettuce_4) (sliceable lettuce_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation ottoman_1 location3) (receptacleatlocation bathtubbasin_2 location3) (receptacleatlocation bed_3 location5) (receptacleatlocation bathtubbasin_4 location4) (receptacleatlocation microwave_5 location3) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location4) (inreceptacle pot_1 fridge_7) (inreceptacle remotecontrol_2 ottoman_1) (inreceptacle remotecontrol_3 ottoman_1) (inreceptacle lettuce_4 fridge_7) (inreceptacle cup_5 microwave_5) (objectatlocation pot_1 location4) (objectatlocation remotecontrol_2 location3) (objectatlocation remotecontrol_3 location3) (objectatlocation lettuce_4 location4) (objectatlocation cup_5 location3) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o lettucetype) (receptacletype_0 ?r fridgetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
