(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   drawertype coffeetabletype bedtype garbagecantype armchairtype - receptacletype
   lettucetype remotecontroltype bowltype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   drawer_1 coffeetable_2 bed_3 garbagecan_4 armchair_5 microwave_6 fridge_7 - receptacle
   lettuce_1 remotecontrol_2 bowl_3 remotecontrol_4 pot_5 - obj
 )
 (:init (receptacletype_0 drawer_1 drawertype) (receptacletype_0 coffeetable_2 coffeetabletype) (receptacletype_0 bed_3 bedtype) (receptacletype_0 garbagecan_4 garbagecantype) (receptacletype_0 armchair_5 armchairtype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 lettuce_1 lettucetype) (objecttype_0 remotecontrol_2 remotecontroltype) (objecttype_0 bowl_3 bowltype) (objecttype_0 remotecontrol_4 remotecontroltype) (objecttype_0 pot_5 pottype) (cancontain drawertype remotecontroltype) (cancontain coffeetabletype lettucetype) (cancontain coffeetabletype remotecontroltype) (cancontain coffeetabletype bowltype) (cancontain coffeetabletype pottype) (cancontain garbagecantype lettucetype) (cancontain armchairtype remotecontroltype) (cancontain microwavetype bowltype) (cancontain fridgetype lettucetype) (cancontain fridgetype bowltype) (cancontain fridgetype pottype) (pickupable lettuce_1) (cleanable lettuce_1) (coolable lettuce_1) (sliceable lettuce_1) (pickupable remotecontrol_2) (pickupable bowl_3) (isreceptacleobject bowl_3) (cleanable bowl_3) (coolable bowl_3) (pickupable remotecontrol_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation drawer_1 location5) (receptacleatlocation coffeetable_2 location4) (receptacleatlocation bed_3 location5) (receptacleatlocation garbagecan_4 location3) (receptacleatlocation armchair_5 location3) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location2) (inreceptacle lettuce_1 coffeetable_2) (inreceptacle remotecontrol_2 armchair_5) (inreceptacle bowl_3 microwave_6) (inreceptacle remotecontrol_4 drawer_1) (inreceptacle pot_5 coffeetable_2) (objectatlocation lettuce_1 location4) (objectatlocation remotecontrol_2 location3) (objectatlocation bowl_3 location5) (objectatlocation remotecontrol_4 location5) (objectatlocation pot_5 location4) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o pottype) (receptacletype_0 ?r coffeetabletype))))))
 (:metric minimize (total-cost))
)
