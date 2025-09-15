(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype countertoptype sofatype coffeemachinetype coffeetabletype - receptacletype
   soapbottletype tissueboxtype dishspongetype ladletype boxtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 countertop_2 sofa_3 coffeemachine_4 coffeetable_5 microwave_6 fridge_7 - receptacle
   soapbottle_1 tissuebox_2 dishsponge_3 ladle_4 box_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 countertop_2 countertoptype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 coffeetable_5 coffeetabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 soapbottle_1 soapbottletype) (objecttype_0 tissuebox_2 tissueboxtype) (objecttype_0 dishsponge_3 dishspongetype) (objecttype_0 ladle_4 ladletype) (objecttype_0 box_5 boxtype) (cancontain dressertype tissueboxtype) (cancontain dressertype boxtype) (cancontain countertoptype soapbottletype) (cancontain countertoptype tissueboxtype) (cancontain countertoptype dishspongetype) (cancontain countertoptype ladletype) (cancontain countertoptype boxtype) (cancontain sofatype boxtype) (cancontain coffeetabletype soapbottletype) (cancontain coffeetabletype tissueboxtype) (cancontain coffeetabletype dishspongetype) (cancontain coffeetabletype ladletype) (cancontain coffeetabletype boxtype) (pickupable soapbottle_1) (pickupable tissuebox_2) (pickupable dishsponge_3) (cleanable dishsponge_3) (pickupable ladle_4) (cleanable ladle_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation dresser_1 location1) (receptacleatlocation countertop_2 location1) (receptacleatlocation sofa_3 location4) (receptacleatlocation coffeemachine_4 location5) (receptacleatlocation coffeetable_5 location4) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location1) (inreceptacle soapbottle_1 countertop_2) (inreceptacle tissuebox_2 countertop_2) (inreceptacle dishsponge_3 coffeetable_5) (inreceptacle ladle_4 coffeetable_5) (inreceptacle box_5 countertop_2) (objectatlocation soapbottle_1 location1) (objectatlocation tissuebox_2 location1) (objectatlocation dishsponge_3 location4) (objectatlocation ladle_4 location4) (objectatlocation box_5 location1) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 soapbottletype) (receptacletype_0 ?r_0 coffeetabletype))))))
 (:constraints (sometime (atlocation agent1 location1)) (sometime-after (atlocation agent1 location1) (checked dishsponge_3)) (sometime (holds agent1 soapbottle_1)) (sometime-before (holds agent1 soapbottle_1) (checked microwave_6)) (sometime (objectatlocation soapbottle_1 location4)) (sometime-before (objectatlocation soapbottle_1 location4) (or (objectatlocation dishsponge_3 location3) (holds agent1 dishsponge_3))) (sometime (checked location5)) (sometime (or (checked ladle_4) (atlocation agent1 location3))) (sometime (or (atlocation agent1 location3) (holds agent1 box_5))) (sometime (or (checked tissuebox_2) (objectatlocation box_5 location2))))
 (:metric minimize (total-cost))
)
