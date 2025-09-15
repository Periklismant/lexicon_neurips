(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bedtype diningtabletype carttype toilettype safetype - receptacletype
   soapbottletype winebottletype platetype soapbartype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bed_1 diningtable_2 cart_3 toilet_4 safe_5 microwave_6 fridge_7 - receptacle
   soapbottle_1 winebottle_2 plate_3 soapbar_4 plate_5 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 diningtable_2 diningtabletype) (receptacletype_0 cart_3 carttype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 safe_5 safetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 soapbottle_1 soapbottletype) (objecttype_0 winebottle_2 winebottletype) (objecttype_0 plate_3 platetype) (objecttype_0 soapbar_4 soapbartype) (objecttype_0 plate_5 platetype) (cancontain diningtabletype soapbottletype) (cancontain diningtabletype winebottletype) (cancontain diningtabletype platetype) (cancontain diningtabletype soapbartype) (cancontain carttype soapbottletype) (cancontain carttype soapbartype) (cancontain toilettype soapbottletype) (cancontain toilettype soapbartype) (cancontain microwavetype platetype) (cancontain fridgetype winebottletype) (cancontain fridgetype platetype) (pickupable soapbottle_1) (pickupable winebottle_2) (pickupable plate_3) (isreceptacleobject plate_3) (cleanable plate_3) (heatable plate_3) (coolable plate_3) (pickupable soapbar_4) (cleanable soapbar_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation bed_1 location1) (receptacleatlocation diningtable_2 location3) (receptacleatlocation cart_3 location3) (receptacleatlocation toilet_4 location3) (receptacleatlocation safe_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location2) (inreceptacle soapbottle_1 diningtable_2) (inreceptacle winebottle_2 fridge_7) (inreceptacle plate_3 microwave_6) (inreceptacle soapbar_4 cart_3) (inreceptacle plate_5 fridge_7) (objectatlocation soapbottle_1 location3) (objectatlocation winebottle_2 location2) (objectatlocation plate_3 location1) (objectatlocation soapbar_4 location3) (objectatlocation plate_5 location2) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 microwavetype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (holds agent1 plate_3)) (sometime-before (holds agent1 plate_3) (holds agent1 soapbar_4)) (sometime (holds agent1 soapbottle_1)) (sometime (or (checked plate_3) (atlocation agent1 location5))) (sometime (or (holds agent1 winebottle_2) (holds agent1 soapbottle_1))) (sometime (objectatlocation plate_3 location2)) (sometime (atlocation agent1 location5)) (sometime (atlocation agent1 location1)) (sometime-before (atlocation agent1 location1) (or (holds agent1 soapbottle_1) (checked soapbar_4))))
 (:metric minimize (total-cost))
)
