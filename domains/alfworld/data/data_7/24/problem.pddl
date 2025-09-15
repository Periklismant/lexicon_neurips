(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype diningtabletype shelftype toilettype toastertype - receptacletype
   kettletype breadtype winebottletype newspapertype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 diningtable_2 shelf_3 toilet_4 toaster_5 microwave_6 fridge_7 - receptacle
   kettle_1 bread_2 winebottle_3 newspaper_4 mug_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 diningtable_2 diningtabletype) (receptacletype_0 shelf_3 shelftype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 toaster_5 toastertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 kettle_1 kettletype) (objecttype_0 bread_2 breadtype) (objecttype_0 winebottle_3 winebottletype) (objecttype_0 newspaper_4 newspapertype) (objecttype_0 mug_5 mugtype) (cancontain diningtabletype kettletype) (cancontain diningtabletype breadtype) (cancontain diningtabletype winebottletype) (cancontain diningtabletype newspapertype) (cancontain diningtabletype mugtype) (cancontain shelftype kettletype) (cancontain shelftype winebottletype) (cancontain shelftype newspapertype) (cancontain shelftype mugtype) (cancontain toilettype newspapertype) (cancontain microwavetype breadtype) (cancontain microwavetype mugtype) (cancontain fridgetype breadtype) (cancontain fridgetype winebottletype) (cancontain fridgetype mugtype) (pickupable kettle_1) (cleanable kettle_1) (pickupable bread_2) (heatable bread_2) (coolable bread_2) (sliceable bread_2) (pickupable winebottle_3) (pickupable newspaper_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation safe_1 location3) (receptacleatlocation diningtable_2 location2) (receptacleatlocation shelf_3 location2) (receptacleatlocation toilet_4 location5) (receptacleatlocation toaster_5 location4) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle kettle_1 diningtable_2) (inreceptacle bread_2 diningtable_2) (inreceptacle winebottle_3 fridge_7) (inreceptacle newspaper_4 diningtable_2) (inreceptacle mug_5 microwave_6) (objectatlocation kettle_1 location2) (objectatlocation bread_2 location2) (objectatlocation winebottle_3 location1) (objectatlocation newspaper_4 location2) (objectatlocation mug_5 location2) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 mugtype) (receptacletype_0 ?r_0 microwavetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (atlocation agent1 location1)) (sometime-before (atlocation agent1 location1) (checked location5)) (sometime (holds agent1 mug_5)) (sometime-before (holds agent1 mug_5) (checked mug_5)) (sometime (or (checked winebottle_3) (checked newspaper_4))) (sometime (or (atlocation agent1 location3) (checked winebottle_3))) (sometime (holds agent1 kettle_1)) (sometime (or (holds agent1 winebottle_3) (checked bread_2))) (sometime (or (checked location5) (objectatlocation bread_2 location1))))
 (:metric minimize (total-cost))
)
