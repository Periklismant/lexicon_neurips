(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   safetype towelholdertype coffeemachinetype drawertype armchairtype - receptacletype
   penciltype appletype pillowtype soapbottletype bowltype - objecttype
   location5 - location
   safe_1 towelholder_2 drawer_4 armchair_5 microwave_6 fridge_7 - receptacle
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 towelholder_2 towelholdertype) (receptacletype_0 coffeemachine_3 coffeemachinetype) (receptacletype_0 drawer_4 drawertype) (receptacletype_0 armchair_5 armchairtype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pencil_1 penciltype) (objecttype_0 apple_2 appletype) (objecttype_0 pillow_3 pillowtype) (objecttype_0 soapbottle_4 soapbottletype) (objecttype_0 bowl_5 bowltype) (cancontain drawertype penciltype) (cancontain drawertype soapbottletype) (cancontain armchairtype pillowtype) (cancontain microwavetype appletype) (cancontain microwavetype bowltype) (cancontain fridgetype appletype) (cancontain fridgetype bowltype) (pickupable pencil_1) (pickupable apple_2) (cleanable apple_2) (heatable apple_2) (coolable apple_2) (sliceable apple_2) (pickupable pillow_3) (pickupable soapbottle_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation safe_1 location4) (receptacleatlocation towelholder_2 location2) (receptacleatlocation coffeemachine_3 location2) (receptacleatlocation drawer_4 location5) (receptacleatlocation armchair_5 location3) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location2) (inreceptacle pencil_1 drawer_4) (inreceptacle apple_2 microwave_6) (inreceptacle pillow_3 armchair_5) (inreceptacle soapbottle_4 drawer_4) (inreceptacle bowl_5 microwave_6) (objectatlocation pencil_1 location5) (objectatlocation apple_2 location5) (objectatlocation pillow_3 location3) (objectatlocation soapbottle_4 location5) (objectatlocation bowl_5 location5) (atlocation agent1 location5) (hold_1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 bowltype) (receptacletype_0 ?r_0 microwavetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8)))
 (:metric minimize (total-cost))
)
