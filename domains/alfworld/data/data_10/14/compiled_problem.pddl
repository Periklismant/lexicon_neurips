(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   desktype laundryhampertype handtowelholdertype carttype - receptacletype
   remotecontroltype toiletpapertype watchtype handtoweltype cuptype - objecttype
   location2 location3 - location
   laundryhamper_2 cart_4 microwave_6 - receptacle
   watch_3 - obj
 )
 (:init (receptacletype_0 desk_1 desktype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 handtowelholder_3 handtowelholdertype) (receptacletype_0 cart_4 carttype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 remotecontrol_1 remotecontroltype) (objecttype_0 toiletpaper_2 toiletpapertype) (objecttype_0 watch_3 watchtype) (objecttype_0 handtowel_4 handtoweltype) (objecttype_0 cup_5 cuptype) (cancontain desktype remotecontroltype) (cancontain desktype toiletpapertype) (cancontain desktype watchtype) (cancontain desktype cuptype) (cancontain handtowelholdertype handtoweltype) (cancontain carttype toiletpapertype) (cancontain carttype handtoweltype) (cancontain microwavetype cuptype) (cancontain fridgetype cuptype) (pickupable remotecontrol_1) (pickupable toiletpaper_2) (pickupable watch_3) (pickupable handtowel_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation desk_1 location4) (receptacleatlocation laundryhamper_2 location3) (receptacleatlocation handtowelholder_3 location1) (receptacleatlocation cart_4 location1) (receptacleatlocation handtowelholder_5 location4) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location3) (inreceptacle remotecontrol_1 desk_1) (inreceptacle toiletpaper_2 cart_4) (inreceptacle watch_3 desk_1) (inreceptacle handtowel_4 handtowelholder_3) (inreceptacle cup_5 desk_1) (objectatlocation remotecontrol_1 location4) (objectatlocation toiletpaper_2 location1) (objectatlocation watch_3 location4) (objectatlocation handtowel_4 location1) (objectatlocation cup_5 location4) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 cuptype) (receptacletype_0 ?r_0 desktype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 remotecontroltype) (receptacletype_0 ?r_0 desktype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
