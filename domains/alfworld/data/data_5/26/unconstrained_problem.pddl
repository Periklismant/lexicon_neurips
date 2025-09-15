(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   countertoptype laundryhampertype sofatype carttype - receptacletype
   ladletype booktype keychaintype peppershakertype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   countertop_1 laundryhamper_2 sofa_3 laundryhamper_4 cart_5 microwave_6 fridge_7 - receptacle
   ladle_1 book_2 keychain_3 peppershaker_4 pan_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 laundryhamper_4 laundryhampertype) (receptacletype_0 cart_5 carttype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 ladle_1 ladletype) (objecttype_0 book_2 booktype) (objecttype_0 keychain_3 keychaintype) (objecttype_0 peppershaker_4 peppershakertype) (objecttype_0 pan_5 pantype) (cancontain countertoptype ladletype) (cancontain countertoptype booktype) (cancontain countertoptype keychaintype) (cancontain countertoptype peppershakertype) (cancontain countertoptype pantype) (cancontain sofatype booktype) (cancontain sofatype keychaintype) (cancontain fridgetype pantype) (pickupable ladle_1) (cleanable ladle_1) (pickupable book_2) (pickupable keychain_3) (pickupable peppershaker_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation countertop_1 location2) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation sofa_3 location1) (receptacleatlocation laundryhamper_4 location4) (receptacleatlocation cart_5 location4) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location5) (inreceptacle ladle_1 countertop_1) (inreceptacle book_2 countertop_1) (inreceptacle keychain_3 sofa_3) (inreceptacle peppershaker_4 countertop_1) (inreceptacle pan_5 countertop_1) (objectatlocation ladle_1 location2) (objectatlocation book_2 location2) (objectatlocation keychain_3 location1) (objectatlocation peppershaker_4 location2) (objectatlocation pan_5 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o booktype) (receptacletype_0 ?r countertoptype))))))
 (:metric minimize (total-cost))
)
