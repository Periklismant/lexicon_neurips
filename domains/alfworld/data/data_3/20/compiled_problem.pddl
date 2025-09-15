(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   bedtype diningtabletype carttype toilettype safetype - receptacletype
   ladletype tomatotype booktype lettucetype bowltype - objecttype
   location3 location4 location5 - location
   bed_1 cart_3 toilet_4 safe_5 microwave_6 fridge_7 - receptacle
   ladle_1 tomato_2 bowl_5 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 diningtable_2 diningtabletype) (receptacletype_0 cart_3 carttype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 safe_5 safetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 ladle_1 ladletype) (objecttype_0 tomato_2 tomatotype) (objecttype_0 book_3 booktype) (objecttype_0 lettuce_4 lettucetype) (objecttype_0 bowl_5 bowltype) (cancontain bedtype booktype) (cancontain diningtabletype ladletype) (cancontain diningtabletype tomatotype) (cancontain diningtabletype booktype) (cancontain diningtabletype lettucetype) (cancontain diningtabletype bowltype) (cancontain microwavetype tomatotype) (cancontain microwavetype bowltype) (cancontain fridgetype tomatotype) (cancontain fridgetype lettucetype) (cancontain fridgetype bowltype) (pickupable ladle_1) (cleanable ladle_1) (pickupable tomato_2) (cleanable tomato_2) (heatable tomato_2) (coolable tomato_2) (sliceable tomato_2) (pickupable book_3) (pickupable lettuce_4) (cleanable lettuce_4) (coolable lettuce_4) (sliceable lettuce_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation bed_1 location3) (receptacleatlocation diningtable_2 location3) (receptacleatlocation cart_3 location3) (receptacleatlocation toilet_4 location4) (receptacleatlocation safe_5 location1) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location2) (inreceptacle ladle_1 diningtable_2) (inreceptacle tomato_2 microwave_6) (inreceptacle book_3 bed_1) (inreceptacle lettuce_4 diningtable_2) (inreceptacle bowl_5 diningtable_2) (objectatlocation ladle_1 location3) (objectatlocation tomato_2 location2) (objectatlocation book_3 location3) (objectatlocation lettuce_4 location3) (objectatlocation bowl_5 location3) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 bowltype) (receptacletype_0 ?r_0 diningtabletype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
