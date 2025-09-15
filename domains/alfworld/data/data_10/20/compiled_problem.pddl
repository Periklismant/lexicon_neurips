(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   sidetabletype laundryhampertype countertoptype handtowelholdertype - receptacletype
   penciltype saltshakertype alarmclocktype platetype - objecttype
   location4 - location
   sidetable_1 handtowelholder_4 handtowelholder_5 microwave_6 - receptacle
   saltshaker_3 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 countertop_3 countertoptype) (receptacletype_0 handtowelholder_4 handtowelholdertype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pencil_1 penciltype) (objecttype_0 saltshaker_2 saltshakertype) (objecttype_0 saltshaker_3 saltshakertype) (objecttype_0 alarmclock_4 alarmclocktype) (objecttype_0 plate_5 platetype) (cancontain sidetabletype penciltype) (cancontain sidetabletype saltshakertype) (cancontain sidetabletype alarmclocktype) (cancontain sidetabletype platetype) (cancontain countertoptype penciltype) (cancontain countertoptype saltshakertype) (cancontain countertoptype alarmclocktype) (cancontain countertoptype platetype) (cancontain microwavetype platetype) (cancontain fridgetype platetype) (pickupable pencil_1) (pickupable saltshaker_2) (pickupable saltshaker_3) (pickupable alarmclock_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation sidetable_1 location2) (receptacleatlocation laundryhamper_2 location3) (receptacleatlocation countertop_3 location5) (receptacleatlocation handtowelholder_4 location3) (receptacleatlocation handtowelholder_5 location1) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle pencil_1 sidetable_1) (inreceptacle saltshaker_2 countertop_3) (inreceptacle saltshaker_3 sidetable_1) (inreceptacle alarmclock_4 sidetable_1) (inreceptacle plate_5 microwave_6) (objectatlocation pencil_1 location2) (objectatlocation saltshaker_2 location5) (objectatlocation saltshaker_3 location2) (objectatlocation alarmclock_4 location2) (objectatlocation plate_5 location3) (atlocation agent1 location2) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 fridgetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
