(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   garbagecantype toilettype tvstandtype laundryhampertype sofatype - receptacletype
   pantype breadtype spraybottletype penciltype boxtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   garbagecan_1 toilet_2 tvstand_3 laundryhamper_4 sofa_5 microwave_6 fridge_7 - receptacle
   pan_1 bread_2 spraybottle_3 pencil_4 box_5 - obj
 )
 (:init (receptacletype_0 garbagecan_1 garbagecantype) (receptacletype_0 toilet_2 toilettype) (receptacletype_0 tvstand_3 tvstandtype) (receptacletype_0 laundryhamper_4 laundryhampertype) (receptacletype_0 sofa_5 sofatype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pan_1 pantype) (objecttype_0 bread_2 breadtype) (objecttype_0 spraybottle_3 spraybottletype) (objecttype_0 pencil_4 penciltype) (objecttype_0 box_5 boxtype) (cancontain garbagecantype breadtype) (cancontain garbagecantype spraybottletype) (cancontain garbagecantype penciltype) (cancontain toilettype spraybottletype) (cancontain sofatype boxtype) (cancontain microwavetype breadtype) (cancontain fridgetype pantype) (cancontain fridgetype breadtype) (pickupable pan_1) (isreceptacleobject pan_1) (cleanable pan_1) (coolable pan_1) (pickupable bread_2) (heatable bread_2) (coolable bread_2) (sliceable bread_2) (pickupable spraybottle_3) (pickupable pencil_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation garbagecan_1 location2) (receptacleatlocation toilet_2 location2) (receptacleatlocation tvstand_3 location2) (receptacleatlocation laundryhamper_4 location5) (receptacleatlocation sofa_5 location1) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location1) (inreceptacle pan_1 fridge_7) (inreceptacle bread_2 fridge_7) (inreceptacle spraybottle_3 toilet_2) (inreceptacle pencil_4 garbagecan_1) (inreceptacle box_5 sofa_5) (objectatlocation pan_1 location1) (objectatlocation bread_2 location1) (objectatlocation spraybottle_3 location2) (objectatlocation pencil_4 location2) (objectatlocation box_5 location1) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 pantype) (receptacletype_0 ?r_0 fridgetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (atlocation agent1 location1)) (sometime-before (atlocation agent1 location1) (or (objectatlocation spraybottle_3 location4) (checked toilet_2))))
 (:metric minimize (total-cost))
)
