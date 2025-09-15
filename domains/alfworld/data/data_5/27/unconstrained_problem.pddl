(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   towelholdertype safetype toastertype toilettype - receptacletype
   soapbartype keychaintype pottype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   towelholder_1 safe_2 toaster_3 toilet_4 fridge_5 microwave_6 fridge_7 - receptacle
   soapbar_1 keychain_2 pot_3 pan_4 pot_5 - obj
 )
 (:init (receptacletype_0 towelholder_1 towelholdertype) (receptacletype_0 safe_2 safetype) (receptacletype_0 toaster_3 toastertype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 fridge_5 fridgetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 soapbar_1 soapbartype) (objecttype_0 keychain_2 keychaintype) (objecttype_0 pot_3 pottype) (objecttype_0 pan_4 pantype) (objecttype_0 pot_5 pottype) (cancontain safetype keychaintype) (cancontain toilettype soapbartype) (cancontain fridgetype pottype) (cancontain fridgetype pantype) (pickupable soapbar_1) (cleanable soapbar_1) (pickupable keychain_2) (pickupable pot_3) (isreceptacleobject pot_3) (cleanable pot_3) (coolable pot_3) (pickupable pan_4) (isreceptacleobject pan_4) (cleanable pan_4) (coolable pan_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation towelholder_1 location2) (receptacleatlocation safe_2 location1) (receptacleatlocation toaster_3 location1) (receptacleatlocation toilet_4 location2) (receptacleatlocation fridge_5 location3) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location5) (inreceptacle soapbar_1 toilet_4) (inreceptacle keychain_2 safe_2) (inreceptacle pot_3 fridge_7) (inreceptacle pan_4 fridge_7) (inreceptacle pot_5 fridge_5) (objectatlocation soapbar_1 location2) (objectatlocation keychain_2 location1) (objectatlocation pot_3 location5) (objectatlocation pan_4 location5) (objectatlocation pot_5 location3) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o pottype) (receptacletype_0 ?r fridgetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
