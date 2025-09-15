(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   stoveburnertype bedtype coffeemachinetype ottomantype bathtubbasintype - receptacletype
   pillowtype newspapertype remotecontroltype eggtype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   stoveburner_1 bed_2 coffeemachine_3 ottoman_4 bathtubbasin_5 microwave_6 fridge_7 - receptacle
   pillow_1 newspaper_2 remotecontrol_3 egg_4 plate_5 - obj
 )
 (:init (receptacletype_0 stoveburner_1 stoveburnertype) (receptacletype_0 bed_2 bedtype) (receptacletype_0 coffeemachine_3 coffeemachinetype) (receptacletype_0 ottoman_4 ottomantype) (receptacletype_0 bathtubbasin_5 bathtubbasintype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pillow_1 pillowtype) (objecttype_0 newspaper_2 newspapertype) (objecttype_0 remotecontrol_3 remotecontroltype) (objecttype_0 egg_4 eggtype) (objecttype_0 plate_5 platetype) (cancontain bedtype pillowtype) (cancontain bedtype newspapertype) (cancontain ottomantype pillowtype) (cancontain ottomantype newspapertype) (cancontain ottomantype remotecontroltype) (cancontain microwavetype eggtype) (cancontain microwavetype platetype) (cancontain fridgetype eggtype) (cancontain fridgetype platetype) (pickupable pillow_1) (pickupable newspaper_2) (pickupable remotecontrol_3) (pickupable egg_4) (cleanable egg_4) (heatable egg_4) (coolable egg_4) (sliceable egg_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation stoveburner_1 location5) (receptacleatlocation bed_2 location5) (receptacleatlocation coffeemachine_3 location1) (receptacleatlocation ottoman_4 location5) (receptacleatlocation bathtubbasin_5 location2) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location1) (inreceptacle pillow_1 ottoman_4) (inreceptacle newspaper_2 bed_2) (inreceptacle remotecontrol_3 ottoman_4) (inreceptacle egg_4 microwave_6) (inreceptacle plate_5 fridge_7) (objectatlocation pillow_1 location5) (objectatlocation newspaper_2 location5) (objectatlocation remotecontrol_3 location5) (objectatlocation egg_4 location1) (objectatlocation plate_5 location1) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 eggtype) (receptacletype_0 ?r_0 microwavetype))))))
 (:constraints (sometime (holds agent1 plate_5)) (sometime (checked newspaper_2)) (sometime (checked fridge_7)))
 (:metric minimize (total-cost))
)
