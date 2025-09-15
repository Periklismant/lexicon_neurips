(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   dressertype shelftype toilettype drawertype - receptacletype
   clothtype tennisrackettype keychaintype spraybottletype pottype - objecttype
   location1 location2 - location
   dresser_1 shelf_2 toilet_3 toilet_4 drawer_5 microwave_6 fridge_7 - receptacle
   cloth_1 pot_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 shelf_2 shelftype) (receptacletype_0 toilet_3 toilettype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 drawer_5 drawertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 cloth_1 clothtype) (objecttype_0 tennisracket_2 tennisrackettype) (objecttype_0 keychain_3 keychaintype) (objecttype_0 spraybottle_4 spraybottletype) (objecttype_0 pot_5 pottype) (cancontain dressertype clothtype) (cancontain dressertype tennisrackettype) (cancontain dressertype keychaintype) (cancontain dressertype spraybottletype) (cancontain shelftype clothtype) (cancontain shelftype keychaintype) (cancontain shelftype spraybottletype) (cancontain shelftype pottype) (cancontain toilettype clothtype) (cancontain toilettype spraybottletype) (cancontain drawertype clothtype) (cancontain drawertype keychaintype) (cancontain drawertype spraybottletype) (cancontain fridgetype pottype) (pickupable cloth_1) (cleanable cloth_1) (pickupable tennisracket_2) (pickupable keychain_3) (pickupable spraybottle_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation dresser_1 location2) (receptacleatlocation shelf_2 location5) (receptacleatlocation toilet_3 location4) (receptacleatlocation toilet_4 location3) (receptacleatlocation drawer_5 location1) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location5) (inreceptacle cloth_1 dresser_1) (inreceptacle tennisracket_2 dresser_1) (inreceptacle keychain_3 drawer_5) (inreceptacle spraybottle_4 drawer_5) (inreceptacle pot_5 shelf_2) (objectatlocation cloth_1 location2) (objectatlocation tennisracket_2 location2) (objectatlocation keychain_3 location1) (objectatlocation spraybottle_4 location1) (objectatlocation pot_5 location5) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 spraybottletype) (receptacletype_0 ?r_0 drawertype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
