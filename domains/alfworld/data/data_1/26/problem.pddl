(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype carttype sidetabletype tvstandtype safetype - receptacletype
   boxtype potatotype keychaintype pentype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 cart_2 sidetable_3 tvstand_4 safe_5 microwave_6 fridge_7 - receptacle
   box_1 potato_2 keychain_3 pen_4 bowl_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 cart_2 carttype) (receptacletype_0 sidetable_3 sidetabletype) (receptacletype_0 tvstand_4 tvstandtype) (receptacletype_0 safe_5 safetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 box_1 boxtype) (objecttype_0 potato_2 potatotype) (objecttype_0 keychain_3 keychaintype) (objecttype_0 pen_4 pentype) (objecttype_0 bowl_5 bowltype) (cancontain dressertype boxtype) (cancontain dressertype keychaintype) (cancontain dressertype pentype) (cancontain dressertype bowltype) (cancontain sidetabletype boxtype) (cancontain sidetabletype potatotype) (cancontain sidetabletype keychaintype) (cancontain sidetabletype pentype) (cancontain sidetabletype bowltype) (cancontain safetype keychaintype) (cancontain microwavetype potatotype) (cancontain microwavetype bowltype) (cancontain fridgetype potatotype) (cancontain fridgetype bowltype) (pickupable box_1) (isreceptacleobject box_1) (pickupable potato_2) (cleanable potato_2) (heatable potato_2) (coolable potato_2) (sliceable potato_2) (pickupable keychain_3) (pickupable pen_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation dresser_1 location4) (receptacleatlocation cart_2 location4) (receptacleatlocation sidetable_3 location1) (receptacleatlocation tvstand_4 location3) (receptacleatlocation safe_5 location2) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle box_1 sidetable_3) (inreceptacle potato_2 microwave_6) (inreceptacle keychain_3 sidetable_3) (inreceptacle pen_4 dresser_1) (inreceptacle bowl_5 microwave_6) (objectatlocation box_1 location1) (objectatlocation potato_2 location2) (objectatlocation keychain_3 location1) (objectatlocation pen_4 location4) (objectatlocation bowl_5 location2) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pentype) (receptacletype_0 ?r_0 dressertype))))))
 (:constraints (sometime (holds agent1 keychain_3)))
 (:metric minimize (total-cost))
)
