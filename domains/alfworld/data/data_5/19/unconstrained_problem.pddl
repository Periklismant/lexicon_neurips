(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype desktype sofatype sidetabletype carttype - receptacletype
   eggtype dishspongetype laptoptype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 desk_2 sofa_3 sidetable_4 cart_5 microwave_6 fridge_7 - receptacle
   egg_1 dishsponge_2 dishsponge_3 laptop_4 pan_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 desk_2 desktype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 sidetable_4 sidetabletype) (receptacletype_0 cart_5 carttype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 egg_1 eggtype) (objecttype_0 dishsponge_2 dishspongetype) (objecttype_0 dishsponge_3 dishspongetype) (objecttype_0 laptop_4 laptoptype) (objecttype_0 pan_5 pantype) (cancontain desktype laptoptype) (cancontain sofatype laptoptype) (cancontain sidetabletype eggtype) (cancontain sidetabletype dishspongetype) (cancontain sidetabletype laptoptype) (cancontain sidetabletype pantype) (cancontain carttype dishspongetype) (cancontain microwavetype eggtype) (cancontain fridgetype eggtype) (cancontain fridgetype pantype) (pickupable egg_1) (cleanable egg_1) (heatable egg_1) (coolable egg_1) (sliceable egg_1) (pickupable dishsponge_2) (cleanable dishsponge_2) (pickupable dishsponge_3) (cleanable dishsponge_3) (pickupable laptop_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation safe_1 location2) (receptacleatlocation desk_2 location3) (receptacleatlocation sofa_3 location1) (receptacleatlocation sidetable_4 location3) (receptacleatlocation cart_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location4) (inreceptacle egg_1 microwave_6) (inreceptacle dishsponge_2 cart_5) (inreceptacle dishsponge_3 cart_5) (inreceptacle laptop_4 sofa_3) (inreceptacle pan_5 fridge_7) (objectatlocation egg_1 location5) (objectatlocation dishsponge_2 location4) (objectatlocation dishsponge_3 location4) (objectatlocation laptop_4 location1) (objectatlocation pan_5 location4) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o pantype) (receptacletype_0 ?r fridgetype))))))
 (:metric minimize (total-cost))
)
