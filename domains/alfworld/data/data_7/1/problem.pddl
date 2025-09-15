(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   handtowelholdertype armchairtype laundryhampertype - receptacletype
   clothtype remotecontroltype laptoptype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   handtowelholder_1 armchair_2 microwave_3 sinkbasin_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   cloth_1 remotecontrol_2 laptop_3 remotecontrol_4 plate_5 - obj
 )
 (:init (receptacletype_0 handtowelholder_1 handtowelholdertype) (receptacletype_0 armchair_2 armchairtype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 sinkbasin_4 sinkbasintype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 cloth_1 clothtype) (objecttype_0 remotecontrol_2 remotecontroltype) (objecttype_0 laptop_3 laptoptype) (objecttype_0 remotecontrol_4 remotecontroltype) (objecttype_0 plate_5 platetype) (cancontain armchairtype clothtype) (cancontain armchairtype remotecontroltype) (cancontain armchairtype laptoptype) (cancontain microwavetype platetype) (cancontain sinkbasintype clothtype) (cancontain sinkbasintype platetype) (cancontain laundryhampertype clothtype) (cancontain fridgetype platetype) (pickupable cloth_1) (cleanable cloth_1) (pickupable remotecontrol_2) (pickupable laptop_3) (pickupable remotecontrol_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation handtowelholder_1 location5) (receptacleatlocation armchair_2 location2) (receptacleatlocation microwave_3 location4) (receptacleatlocation sinkbasin_4 location1) (receptacleatlocation laundryhamper_5 location3) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location4) (inreceptacle cloth_1 laundryhamper_5) (inreceptacle remotecontrol_2 armchair_2) (inreceptacle laptop_3 armchair_2) (inreceptacle remotecontrol_4 armchair_2) (inreceptacle plate_5 fridge_7) (objectatlocation cloth_1 location3) (objectatlocation remotecontrol_2 location2) (objectatlocation laptop_3 location2) (objectatlocation remotecontrol_4 location2) (objectatlocation plate_5 location4) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 laptoptype) (receptacletype_0 ?r_0 armchairtype))))))
 (:constraints (sometime (or (holds agent1 plate_5) (holds agent1 cloth_1))) (sometime (or (atlocation agent1 location4) (holds agent1 cloth_1))) (sometime (or (objectatlocation remotecontrol_4 location5) (checked remotecontrol_4))) (sometime (or (objectatlocation remotecontrol_4 location5) (checked microwave_3))) (sometime (checked microwave_3)) (sometime (atlocation agent1 location5)) (sometime (or (atlocation agent1 location5) (objectatlocation remotecontrol_4 location3))))
 (:metric minimize (total-cost))
)
