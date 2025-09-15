(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype diningtabletype shelftype toilettype toastertype - receptacletype
   appletype ladletype pantype watchtype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 diningtable_2 shelf_3 toilet_4 toaster_5 microwave_6 fridge_7 - receptacle
   apple_1 ladle_2 pan_3 watch_4 cup_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 diningtable_2 diningtabletype) (receptacletype_0 shelf_3 shelftype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 toaster_5 toastertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 apple_1 appletype) (objecttype_0 ladle_2 ladletype) (objecttype_0 pan_3 pantype) (objecttype_0 watch_4 watchtype) (objecttype_0 cup_5 cuptype) (cancontain safetype watchtype) (cancontain diningtabletype appletype) (cancontain diningtabletype ladletype) (cancontain diningtabletype pantype) (cancontain diningtabletype watchtype) (cancontain diningtabletype cuptype) (cancontain shelftype watchtype) (cancontain shelftype cuptype) (cancontain microwavetype appletype) (cancontain microwavetype cuptype) (cancontain fridgetype appletype) (cancontain fridgetype pantype) (cancontain fridgetype cuptype) (pickupable apple_1) (cleanable apple_1) (heatable apple_1) (coolable apple_1) (sliceable apple_1) (pickupable ladle_2) (cleanable ladle_2) (pickupable pan_3) (isreceptacleobject pan_3) (cleanable pan_3) (coolable pan_3) (pickupable watch_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation safe_1 location2) (receptacleatlocation diningtable_2 location2) (receptacleatlocation shelf_3 location5) (receptacleatlocation toilet_4 location4) (receptacleatlocation toaster_5 location2) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location2) (inreceptacle apple_1 diningtable_2) (inreceptacle ladle_2 diningtable_2) (inreceptacle pan_3 fridge_7) (inreceptacle watch_4 diningtable_2) (inreceptacle cup_5 microwave_6) (objectatlocation apple_1 location2) (objectatlocation ladle_2 location2) (objectatlocation pan_3 location2) (objectatlocation watch_4 location2) (objectatlocation cup_5 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 appletype) (receptacletype_0 ?r_0 diningtabletype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (atlocation agent1 location2)) (sometime-before (atlocation agent1 location2) (or (atlocation agent1 location4) (holds agent1 watch_4))) (sometime (or (atlocation agent1 location4) (checked cup_5))) (sometime (holds agent1 apple_1)) (sometime-before (holds agent1 apple_1) (or (objectatlocation apple_1 location5) (holds agent1 ladle_2))) (sometime (or (checked apple_1) (objectatlocation cup_5 location5))) (sometime (or (checked pan_3) (checked watch_4))))
 (:metric minimize (total-cost))
)
