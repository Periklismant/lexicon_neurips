(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   armchairtype coffeemachinetype sofatype laundryhampertype - receptacletype
   creditcardtype pottype pantype eggtype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   armchair_1 armchair_2 coffeemachine_3 sofa_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   creditcard_1 pot_2 pan_3 egg_4 mug_5 - obj
 )
 (:init (receptacletype_0 armchair_1 armchairtype) (receptacletype_0 armchair_2 armchairtype) (receptacletype_0 coffeemachine_3 coffeemachinetype) (receptacletype_0 sofa_4 sofatype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 creditcard_1 creditcardtype) (objecttype_0 pot_2 pottype) (objecttype_0 pan_3 pantype) (objecttype_0 egg_4 eggtype) (objecttype_0 mug_5 mugtype) (cancontain armchairtype creditcardtype) (cancontain coffeemachinetype mugtype) (cancontain sofatype creditcardtype) (cancontain microwavetype eggtype) (cancontain microwavetype mugtype) (cancontain fridgetype pottype) (cancontain fridgetype pantype) (cancontain fridgetype eggtype) (cancontain fridgetype mugtype) (pickupable creditcard_1) (pickupable pot_2) (isreceptacleobject pot_2) (cleanable pot_2) (coolable pot_2) (pickupable pan_3) (isreceptacleobject pan_3) (cleanable pan_3) (coolable pan_3) (pickupable egg_4) (cleanable egg_4) (heatable egg_4) (coolable egg_4) (sliceable egg_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation armchair_1 location4) (receptacleatlocation armchair_2 location1) (receptacleatlocation coffeemachine_3 location2) (receptacleatlocation sofa_4 location4) (receptacleatlocation laundryhamper_5 location5) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location4) (inreceptacle creditcard_1 armchair_1) (inreceptacle pot_2 fridge_7) (inreceptacle pan_3 fridge_7) (inreceptacle egg_4 fridge_7) (inreceptacle mug_5 microwave_6) (objectatlocation creditcard_1 location4) (objectatlocation pot_2 location4) (objectatlocation pan_3 location4) (objectatlocation egg_4 location4) (objectatlocation mug_5 location5) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 pantype) (receptacletype_0 ?r_0 fridgetype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 mugtype) (receptacletype_0 ?r_0 fridgetype) (inreceptacle ?o2 ?r_0))))))))
 (:constraints (sometime (atlocation agent1 location5)) (sometime-after (atlocation agent1 location5) (or (holds agent1 pot_2) (holds agent1 egg_4))))
 (:metric minimize (total-cost))
)
