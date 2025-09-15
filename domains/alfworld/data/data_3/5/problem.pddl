(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   toastertype laundryhampertype handtowelholdertype - receptacletype
   platetype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 - location
   toaster_1 laundryhamper_2 handtowelholder_3 microwave_4 fridge_5 - receptacle
   plate_1 cup_2 cup_3 - obj
 )
 (:init (receptacletype_0 toaster_1 toastertype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 handtowelholder_3 handtowelholdertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 plate_1 platetype) (objecttype_0 cup_2 cuptype) (objecttype_0 cup_3 cuptype) (cancontain microwavetype platetype) (cancontain microwavetype cuptype) (cancontain fridgetype platetype) (cancontain fridgetype cuptype) (pickupable plate_1) (isreceptacleobject plate_1) (cleanable plate_1) (heatable plate_1) (coolable plate_1) (pickupable cup_2) (isreceptacleobject cup_2) (cleanable cup_2) (heatable cup_2) (coolable cup_2) (pickupable cup_3) (isreceptacleobject cup_3) (cleanable cup_3) (heatable cup_3) (coolable cup_3) (receptacleatlocation toaster_1 location2) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation handtowelholder_3 location1) (receptacleatlocation microwave_4 location3) (receptacleatlocation fridge_5 location2) (inreceptacle plate_1 microwave_4) (inreceptacle cup_2 microwave_4) (inreceptacle cup_3 fridge_5) (objectatlocation plate_1 location3) (objectatlocation cup_2 location3) (objectatlocation cup_3 location2) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 cuptype) (receptacletype_0 ?r_0 fridgetype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (always (not (objectatlocation cup_2 location2))) (sometime (holdsany agent1)) (sometime-after (holdsany agent1) (or (inreceptacleobject cup_3 plate_1) (atlocation agent1 location3))) (always (not (holds agent1 cup_2))))
 (:metric minimize (total-cost))
)
