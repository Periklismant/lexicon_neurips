(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   desktype laundryhampertype handtowelholdertype armchairtype toiletpaperhangertype - receptacletype
   potatotype clothtype boxtype platetype mugtype - objecttype
   location1 - location
   desk_1 handtowelholder_3 armchair_4 toiletpaperhanger_5 fridge_7 - receptacle
   potato_1 - obj
 )
 (:init (receptacletype_0 desk_1 desktype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 handtowelholder_3 handtowelholdertype) (receptacletype_0 armchair_4 armchairtype) (receptacletype_0 toiletpaperhanger_5 toiletpaperhangertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 potato_1 potatotype) (objecttype_0 cloth_2 clothtype) (objecttype_0 box_3 boxtype) (objecttype_0 plate_4 platetype) (objecttype_0 mug_5 mugtype) (cancontain desktype clothtype) (cancontain desktype boxtype) (cancontain desktype platetype) (cancontain desktype mugtype) (cancontain laundryhampertype clothtype) (cancontain armchairtype clothtype) (cancontain armchairtype boxtype) (cancontain microwavetype potatotype) (cancontain microwavetype platetype) (cancontain microwavetype mugtype) (cancontain fridgetype potatotype) (cancontain fridgetype platetype) (cancontain fridgetype mugtype) (pickupable potato_1) (cleanable potato_1) (heatable potato_1) (coolable potato_1) (sliceable potato_1) (pickupable cloth_2) (cleanable cloth_2) (pickupable box_3) (isreceptacleobject box_3) (pickupable plate_4) (isreceptacleobject plate_4) (cleanable plate_4) (heatable plate_4) (coolable plate_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation desk_1 location4) (receptacleatlocation laundryhamper_2 location4) (receptacleatlocation handtowelholder_3 location5) (receptacleatlocation armchair_4 location5) (receptacleatlocation toiletpaperhanger_5 location3) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location2) (inreceptacle potato_1 microwave_6) (inreceptacle cloth_2 armchair_4) (inreceptacle box_3 armchair_4) (inreceptacle plate_4 microwave_6) (inreceptacle mug_5 microwave_6) (objectatlocation potato_1 location3) (objectatlocation cloth_2 location5) (objectatlocation box_3 location5) (objectatlocation plate_4 location3) (objectatlocation mug_5 location3) (atlocation agent1 location4) (hold_9) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r_0) (objecttype_0 ?o1 mugtype) (receptacletype_0 ?r_0 fridgetype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 platetype) (receptacletype_0 ?r_0 fridgetype) (inreceptacle ?o2 ?r_0)))))) (hold_0) (hold_2) (hold_3) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
