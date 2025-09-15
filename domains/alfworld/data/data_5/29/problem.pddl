(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   armchairtype coffeemachinetype sofatype laundryhampertype - receptacletype
   glassbottletype breadtype pillowtype clothtype boxtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   armchair_1 armchair_2 coffeemachine_3 sofa_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   glassbottle_1 bread_2 pillow_3 cloth_4 box_5 - obj
 )
 (:init (receptacletype_0 armchair_1 armchairtype) (receptacletype_0 armchair_2 armchairtype) (receptacletype_0 coffeemachine_3 coffeemachinetype) (receptacletype_0 sofa_4 sofatype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 glassbottle_1 glassbottletype) (objecttype_0 bread_2 breadtype) (objecttype_0 pillow_3 pillowtype) (objecttype_0 cloth_4 clothtype) (objecttype_0 box_5 boxtype) (cancontain armchairtype pillowtype) (cancontain armchairtype clothtype) (cancontain armchairtype boxtype) (cancontain sofatype pillowtype) (cancontain sofatype clothtype) (cancontain sofatype boxtype) (cancontain laundryhampertype clothtype) (cancontain microwavetype glassbottletype) (cancontain microwavetype breadtype) (cancontain fridgetype glassbottletype) (cancontain fridgetype breadtype) (pickupable glassbottle_1) (pickupable bread_2) (heatable bread_2) (coolable bread_2) (sliceable bread_2) (pickupable pillow_3) (pickupable cloth_4) (cleanable cloth_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation armchair_1 location4) (receptacleatlocation armchair_2 location2) (receptacleatlocation coffeemachine_3 location5) (receptacleatlocation sofa_4 location2) (receptacleatlocation laundryhamper_5 location4) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location1) (inreceptacle glassbottle_1 microwave_6) (inreceptacle bread_2 microwave_6) (inreceptacle pillow_3 armchair_2) (inreceptacle cloth_4 sofa_4) (inreceptacle box_5 sofa_4) (objectatlocation glassbottle_1 location4) (objectatlocation bread_2 location4) (objectatlocation pillow_3 location2) (objectatlocation cloth_4 location2) (objectatlocation box_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 boxtype) (receptacletype_0 ?r_0 sofatype))))))
 (:constraints (sometime (atlocation agent1 location4)) (sometime (atlocation agent1 location2)) (sometime (or (holds agent1 bread_2) (checked armchair_2))) (sometime (or (atlocation agent1 location5) (objectatlocation pillow_3 location5))) (sometime (or (holds agent1 pillow_3) (atlocation agent1 location2))))
 (:metric minimize (total-cost))
)
