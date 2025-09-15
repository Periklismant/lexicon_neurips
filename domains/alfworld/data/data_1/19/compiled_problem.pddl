(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   tvstandtype cabinettype safetype carttype diningtabletype - receptacletype
   penciltype remotecontroltype alarmclocktype pottype - objecttype
   location1 location2 location3 location5 - location
   tvstand_1 cabinet_2 safe_3 cart_4 diningtable_5 microwave_6 fridge_7 - receptacle
   pencil_1 remotecontrol_2 alarmclock_3 pot_4 pot_5 - obj
 )
 (:init (receptacletype_0 tvstand_1 tvstandtype) (receptacletype_0 cabinet_2 cabinettype) (receptacletype_0 safe_3 safetype) (receptacletype_0 cart_4 carttype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pencil_1 penciltype) (objecttype_0 remotecontrol_2 remotecontroltype) (objecttype_0 alarmclock_3 alarmclocktype) (objecttype_0 pot_4 pottype) (objecttype_0 pot_5 pottype) (cancontain cabinettype pottype) (cancontain diningtabletype penciltype) (cancontain diningtabletype remotecontroltype) (cancontain diningtabletype alarmclocktype) (cancontain diningtabletype pottype) (cancontain fridgetype pottype) (pickupable pencil_1) (pickupable remotecontrol_2) (pickupable alarmclock_3) (pickupable pot_4) (isreceptacleobject pot_4) (cleanable pot_4) (coolable pot_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation tvstand_1 location2) (receptacleatlocation cabinet_2 location3) (receptacleatlocation safe_3 location4) (receptacleatlocation cart_4 location2) (receptacleatlocation diningtable_5 location2) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location3) (inreceptacle pencil_1 diningtable_5) (inreceptacle remotecontrol_2 diningtable_5) (inreceptacle alarmclock_3 diningtable_5) (inreceptacle pot_4 fridge_7) (inreceptacle pot_5 diningtable_5) (objectatlocation pencil_1 location2) (objectatlocation remotecontrol_2 location2) (objectatlocation alarmclock_3 location2) (objectatlocation pot_4 location3) (objectatlocation pot_5 location2) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pottype) (receptacletype_0 ?r_0 diningtabletype)))) (hold_0)))
 (:metric minimize (total-cost))
)
