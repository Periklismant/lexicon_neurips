(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   dressertype shelftype toilettype drawertype - receptacletype
   vasetype alarmclocktype spoontype papertoweltype pantype - objecttype
   location1 location5 - location
   dresser_1 shelf_2 toilet_4 drawer_5 - receptacle
   vase_1 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 shelf_2 shelftype) (receptacletype_0 toilet_3 toilettype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 drawer_5 drawertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 vase_1 vasetype) (objecttype_0 alarmclock_2 alarmclocktype) (objecttype_0 spoon_3 spoontype) (objecttype_0 papertowel_4 papertoweltype) (objecttype_0 pan_5 pantype) (cancontain dressertype vasetype) (cancontain dressertype alarmclocktype) (cancontain shelftype vasetype) (cancontain shelftype alarmclocktype) (cancontain shelftype papertoweltype) (cancontain toilettype papertoweltype) (cancontain drawertype spoontype) (cancontain fridgetype pantype) (pickupable vase_1) (pickupable alarmclock_2) (pickupable spoon_3) (cleanable spoon_3) (pickupable papertowel_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation dresser_1 location5) (receptacleatlocation shelf_2 location4) (receptacleatlocation toilet_3 location3) (receptacleatlocation toilet_4 location1) (receptacleatlocation drawer_5 location5) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location1) (inreceptacle vase_1 dresser_1) (inreceptacle alarmclock_2 dresser_1) (inreceptacle spoon_3 drawer_5) (inreceptacle papertowel_4 toilet_3) (inreceptacle pan_5 fridge_7) (objectatlocation vase_1 location5) (objectatlocation alarmclock_2 location5) (objectatlocation spoon_3 location5) (objectatlocation papertowel_4 location3) (objectatlocation pan_5 location1) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 papertoweltype) (receptacletype_0 ?r_0 shelftype)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_6) (hold_7) (hold_8)))
 (:metric minimize (total-cost))
)
