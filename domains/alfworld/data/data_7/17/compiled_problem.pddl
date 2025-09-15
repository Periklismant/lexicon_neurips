(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   dressertype countertoptype sofatype coffeemachinetype coffeetabletype - receptacletype
   soapbottletype tissueboxtype dishspongetype ladletype boxtype - objecttype
   dresser_1 countertop_2 sofa_3 coffeemachine_4 coffeetable_5 fridge_7 - receptacle
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 countertop_2 countertoptype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 coffeetable_5 coffeetabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 soapbottle_1 soapbottletype) (objecttype_0 tissuebox_2 tissueboxtype) (objecttype_0 dishsponge_3 dishspongetype) (objecttype_0 ladle_4 ladletype) (objecttype_0 box_5 boxtype) (cancontain dressertype tissueboxtype) (cancontain dressertype boxtype) (cancontain countertoptype soapbottletype) (cancontain countertoptype tissueboxtype) (cancontain countertoptype dishspongetype) (cancontain countertoptype ladletype) (cancontain countertoptype boxtype) (cancontain sofatype boxtype) (cancontain coffeetabletype soapbottletype) (cancontain coffeetabletype tissueboxtype) (cancontain coffeetabletype dishspongetype) (cancontain coffeetabletype ladletype) (cancontain coffeetabletype boxtype) (pickupable soapbottle_1) (pickupable tissuebox_2) (pickupable dishsponge_3) (cleanable dishsponge_3) (pickupable ladle_4) (cleanable ladle_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation dresser_1 location1) (receptacleatlocation countertop_2 location1) (receptacleatlocation sofa_3 location4) (receptacleatlocation coffeemachine_4 location5) (receptacleatlocation coffeetable_5 location4) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location1) (inreceptacle soapbottle_1 countertop_2) (inreceptacle tissuebox_2 countertop_2) (inreceptacle dishsponge_3 coffeetable_5) (inreceptacle ladle_4 coffeetable_5) (inreceptacle box_5 countertop_2) (objectatlocation soapbottle_1 location1) (objectatlocation tissuebox_2 location1) (objectatlocation dishsponge_3 location4) (objectatlocation ladle_4 location4) (objectatlocation box_5 location1) (atlocation agent1 location4) (hold_1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 soapbottletype) (receptacletype_0 ?r_0 coffeetabletype)))) (hold_0) (hold_1) (hold_2) (hold_4) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
