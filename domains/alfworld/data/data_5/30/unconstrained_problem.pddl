(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype handtowelholdertype sidetabletype - receptacletype
   platetype handtoweltype alarmclocktype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 handtowelholder_2 sidetable_3 safe_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   plate_1 butterknife_2 handtowel_3 alarmclock_4 pot_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 handtowelholder_2 handtowelholdertype) (receptacletype_0 sidetable_3 sidetabletype) (receptacletype_0 safe_4 safetype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 plate_1 platetype) (objecttype_0 butterknife_2 butterknifetype) (objecttype_0 handtowel_3 handtoweltype) (objecttype_0 alarmclock_4 alarmclocktype) (objecttype_0 pot_5 pottype) (cancontain handtowelholdertype handtoweltype) (cancontain sidetabletype platetype) (cancontain sidetabletype butterknifetype) (cancontain sidetabletype handtoweltype) (cancontain sidetabletype alarmclocktype) (cancontain sidetabletype pottype) (cancontain microwavetype platetype) (cancontain fridgetype platetype) (cancontain fridgetype pottype) (pickupable plate_1) (isreceptacleobject plate_1) (cleanable plate_1) (heatable plate_1) (coolable plate_1) (pickupable butterknife_2) (cleanable butterknife_2) (pickupable handtowel_3) (pickupable alarmclock_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation safe_1 location1) (receptacleatlocation handtowelholder_2 location4) (receptacleatlocation sidetable_3 location3) (receptacleatlocation safe_4 location4) (receptacleatlocation handtowelholder_5 location5) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location5) (inreceptacle plate_1 fridge_7) (inreceptacle butterknife_2 sidetable_3) (inreceptacle handtowel_3 sidetable_3) (inreceptacle alarmclock_4 sidetable_3) (inreceptacle pot_5 sidetable_3) (objectatlocation plate_1 location5) (objectatlocation butterknife_2 location3) (objectatlocation handtowel_3 location3) (objectatlocation alarmclock_4 location3) (objectatlocation pot_5 location3) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o pottype) (receptacletype_0 ?r sidetabletype))))))
 (:metric minimize (total-cost))
)
