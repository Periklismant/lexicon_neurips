(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   ottomantype safetype - receptacletype
   clothtype cdtype breadtype keychaintype bowltype - objecttype
   location1 location3 location4 location5 - location
   sinkbasin_1 ottoman_2 safe_3 ottoman_4 fridge_5 microwave_6 fridge_7 - receptacle
   cloth_1 cd_2 bread_3 bowl_5 - obj
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 ottoman_2 ottomantype) (receptacletype_0 safe_3 safetype) (receptacletype_0 ottoman_4 ottomantype) (receptacletype_0 fridge_5 fridgetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 cloth_1 clothtype) (objecttype_0 cd_2 cdtype) (objecttype_0 bread_3 breadtype) (objecttype_0 keychain_4 keychaintype) (objecttype_0 bowl_5 bowltype) (cancontain sinkbasintype clothtype) (cancontain sinkbasintype bowltype) (cancontain ottomantype clothtype) (cancontain ottomantype keychaintype) (cancontain safetype cdtype) (cancontain safetype keychaintype) (cancontain fridgetype breadtype) (cancontain fridgetype bowltype) (cancontain microwavetype breadtype) (cancontain microwavetype bowltype) (pickupable cloth_1) (cleanable cloth_1) (pickupable cd_2) (pickupable bread_3) (heatable bread_3) (coolable bread_3) (sliceable bread_3) (pickupable keychain_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation sinkbasin_1 location3) (receptacleatlocation ottoman_2 location4) (receptacleatlocation safe_3 location5) (receptacleatlocation ottoman_4 location2) (receptacleatlocation fridge_5 location5) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location5) (inreceptacle cloth_1 ottoman_4) (inreceptacle cd_2 safe_3) (inreceptacle bread_3 microwave_6) (inreceptacle keychain_4 ottoman_4) (inreceptacle bowl_5 fridge_5) (objectatlocation cloth_1 location2) (objectatlocation cd_2 location5) (objectatlocation bread_3 location4) (objectatlocation keychain_4 location2) (objectatlocation bowl_5 location5) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 clothtype) (receptacletype_0 ?r_0 ottomantype)))) (hold_0)))
 (:metric minimize (total-cost))
)
