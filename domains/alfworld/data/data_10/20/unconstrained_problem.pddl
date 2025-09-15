(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   sidetabletype laundryhampertype countertoptype handtowelholdertype - receptacletype
   penciltype saltshakertype alarmclocktype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sidetable_1 laundryhamper_2 countertop_3 handtowelholder_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   pencil_1 saltshaker_2 saltshaker_3 alarmclock_4 plate_5 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 countertop_3 countertoptype) (receptacletype_0 handtowelholder_4 handtowelholdertype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pencil_1 penciltype) (objecttype_0 saltshaker_2 saltshakertype) (objecttype_0 saltshaker_3 saltshakertype) (objecttype_0 alarmclock_4 alarmclocktype) (objecttype_0 plate_5 platetype) (cancontain sidetabletype penciltype) (cancontain sidetabletype saltshakertype) (cancontain sidetabletype alarmclocktype) (cancontain sidetabletype platetype) (cancontain countertoptype penciltype) (cancontain countertoptype saltshakertype) (cancontain countertoptype alarmclocktype) (cancontain countertoptype platetype) (cancontain microwavetype platetype) (cancontain fridgetype platetype) (pickupable pencil_1) (pickupable saltshaker_2) (pickupable saltshaker_3) (pickupable alarmclock_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation sidetable_1 location2) (receptacleatlocation laundryhamper_2 location3) (receptacleatlocation countertop_3 location5) (receptacleatlocation handtowelholder_4 location3) (receptacleatlocation handtowelholder_5 location1) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle pencil_1 sidetable_1) (inreceptacle saltshaker_2 countertop_3) (inreceptacle saltshaker_3 sidetable_1) (inreceptacle alarmclock_4 sidetable_1) (inreceptacle plate_5 microwave_6) (objectatlocation pencil_1 location2) (objectatlocation saltshaker_2 location5) (objectatlocation saltshaker_3 location2) (objectatlocation alarmclock_4 location2) (objectatlocation plate_5 location3) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o platetype) (receptacletype_0 ?r fridgetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
