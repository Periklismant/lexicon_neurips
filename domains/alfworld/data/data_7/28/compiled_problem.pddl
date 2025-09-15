(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   armchairtype coffeemachinetype sofatype laundryhampertype - receptacletype
   pantype booktype glassbottletype mugtype - objecttype
   location1 - location
   armchair_1 coffeemachine_3 sofa_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   pan_1 - obj
 )
 (:init (receptacletype_0 armchair_1 armchairtype) (receptacletype_0 armchair_2 armchairtype) (receptacletype_0 coffeemachine_3 coffeemachinetype) (receptacletype_0 sofa_4 sofatype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pan_1 pantype) (objecttype_0 book_2 booktype) (objecttype_0 glassbottle_3 glassbottletype) (objecttype_0 pan_4 pantype) (objecttype_0 mug_5 mugtype) (cancontain armchairtype booktype) (cancontain coffeemachinetype mugtype) (cancontain sofatype booktype) (cancontain microwavetype glassbottletype) (cancontain microwavetype mugtype) (cancontain fridgetype pantype) (cancontain fridgetype glassbottletype) (cancontain fridgetype mugtype) (pickupable pan_1) (isreceptacleobject pan_1) (cleanable pan_1) (coolable pan_1) (pickupable book_2) (pickupable glassbottle_3) (pickupable pan_4) (isreceptacleobject pan_4) (cleanable pan_4) (coolable pan_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation armchair_1 location5) (receptacleatlocation armchair_2 location5) (receptacleatlocation coffeemachine_3 location4) (receptacleatlocation sofa_4 location1) (receptacleatlocation laundryhamper_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location3) (inreceptacle pan_1 fridge_7) (inreceptacle book_2 armchair_2) (inreceptacle glassbottle_3 fridge_7) (inreceptacle pan_4 fridge_7) (inreceptacle mug_5 microwave_6) (objectatlocation pan_1 location3) (objectatlocation book_2 location5) (objectatlocation glassbottle_3 location3) (objectatlocation pan_4 location3) (objectatlocation mug_5 location1) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 booktype) (receptacletype_0 ?r_0 armchairtype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
