(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   armchairtype carttype bathtubbasintype ottomantype - receptacletype
   statuetype appletype pantype booktype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   armchair_1 cart_2 bathtubbasin_3 fridge_4 ottoman_5 microwave_6 fridge_7 - receptacle
   statue_1 apple_2 pan_3 book_4 plate_5 - obj
 )
 (:init (receptacletype_0 armchair_1 armchairtype) (receptacletype_0 cart_2 carttype) (receptacletype_0 bathtubbasin_3 bathtubbasintype) (receptacletype_0 fridge_4 fridgetype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 statue_1 statuetype) (objecttype_0 apple_2 appletype) (objecttype_0 pan_3 pantype) (objecttype_0 book_4 booktype) (objecttype_0 plate_5 platetype) (cancontain armchairtype booktype) (cancontain carttype statuetype) (cancontain fridgetype appletype) (cancontain fridgetype pantype) (cancontain fridgetype platetype) (cancontain ottomantype booktype) (cancontain microwavetype appletype) (cancontain microwavetype platetype) (pickupable statue_1) (pickupable apple_2) (cleanable apple_2) (heatable apple_2) (coolable apple_2) (sliceable apple_2) (pickupable pan_3) (isreceptacleobject pan_3) (cleanable pan_3) (coolable pan_3) (pickupable book_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation armchair_1 location5) (receptacleatlocation cart_2 location3) (receptacleatlocation bathtubbasin_3 location3) (receptacleatlocation fridge_4 location4) (receptacleatlocation ottoman_5 location2) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location2) (inreceptacle statue_1 cart_2) (inreceptacle apple_2 microwave_6) (inreceptacle pan_3 fridge_4) (inreceptacle book_4 armchair_1) (inreceptacle plate_5 fridge_7) (objectatlocation statue_1 location3) (objectatlocation apple_2 location4) (objectatlocation pan_3 location4) (objectatlocation book_4 location5) (objectatlocation plate_5 location2) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 fridgetype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (holds agent1 plate_5)) (sometime-after (holds agent1 plate_5) (checked location5)) (sometime (or (checked armchair_1) (atlocation agent1 location1))) (sometime (atlocation agent1 location2)) (sometime-before (atlocation agent1 location2) (or (holds agent1 plate_5) (checked microwave_6))) (sometime (atlocation agent1 location5)) (sometime (atlocation agent1 location1)))
 (:metric minimize (total-cost))
)
