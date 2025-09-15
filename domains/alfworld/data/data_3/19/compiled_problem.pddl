(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   armchairtype coffeemachinetype sofatype laundryhampertype - receptacletype
   tomatotype booktype laptoptype pantype - objecttype
   location1 location3 location5 - location
   armchair_1 coffeemachine_3 sofa_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   tomato_1 book_3 laptop_4 pan_5 - obj
 )
 (:init (receptacletype_0 armchair_1 armchairtype) (receptacletype_0 armchair_2 armchairtype) (receptacletype_0 coffeemachine_3 coffeemachinetype) (receptacletype_0 sofa_4 sofatype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tomato_1 tomatotype) (objecttype_0 book_2 booktype) (objecttype_0 book_3 booktype) (objecttype_0 laptop_4 laptoptype) (objecttype_0 pan_5 pantype) (cancontain armchairtype booktype) (cancontain armchairtype laptoptype) (cancontain sofatype booktype) (cancontain sofatype laptoptype) (cancontain microwavetype tomatotype) (cancontain fridgetype tomatotype) (cancontain fridgetype pantype) (pickupable tomato_1) (cleanable tomato_1) (heatable tomato_1) (coolable tomato_1) (sliceable tomato_1) (pickupable book_2) (pickupable book_3) (pickupable laptop_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation armchair_1 location4) (receptacleatlocation armchair_2 location1) (receptacleatlocation coffeemachine_3 location4) (receptacleatlocation sofa_4 location1) (receptacleatlocation laundryhamper_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle tomato_1 fridge_7) (inreceptacle book_2 armchair_1) (inreceptacle book_3 armchair_2) (inreceptacle laptop_4 armchair_1) (inreceptacle pan_5 fridge_7) (objectatlocation tomato_1 location1) (objectatlocation book_2 location4) (objectatlocation book_3 location1) (objectatlocation laptop_4 location4) (objectatlocation pan_5 location1) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 booktype) (receptacletype_0 ?r_0 armchairtype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
