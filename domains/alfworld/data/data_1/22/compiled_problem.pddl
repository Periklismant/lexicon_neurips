(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   towelholdertype safetype toastertype toilettype - receptacletype
   keychaintype soapbottletype cdtype platetype - objecttype
   location1 location2 location3 location4 - location
   towelholder_1 safe_2 toaster_3 toilet_4 fridge_5 microwave_6 fridge_7 - receptacle
   keychain_1 keychain_2 soapbottle_3 cd_4 plate_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 safe_2 safetype) (receptacletype_0 toaster_3 toastertype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 fridge_5 fridgetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 keychain_1 keychaintype) (objecttype_0 keychain_2 keychaintype) (objecttype_0 soapbottle_3 soapbottletype) (objecttype_0 cd_4 cdtype) (objecttype_0 plate_5 platetype) (cancontain safetype keychaintype) (cancontain safetype cdtype) (cancontain toilettype soapbottletype) (cancontain fridgetype platetype) (cancontain microwavetype platetype) (pickupable keychain_1) (pickupable keychain_2) (pickupable soapbottle_3) (pickupable cd_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation towelholder_1 location4) (receptacleatlocation safe_2 location5) (receptacleatlocation toaster_3 location1) (receptacleatlocation toilet_4 location1) (receptacleatlocation fridge_5 location3) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location5) (inreceptacle keychain_1 safe_2) (inreceptacle keychain_2 safe_2) (inreceptacle soapbottle_3 toilet_4) (inreceptacle cd_4 safe_2) (inreceptacle plate_5 fridge_5) (objectatlocation keychain_1 location5) (objectatlocation keychain_2 location5) (objectatlocation soapbottle_3 location1) (objectatlocation cd_4 location5) (objectatlocation plate_5 location3) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 fridgetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0)))
 (:metric minimize (total-cost))
)
