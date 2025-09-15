(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   handtowelholdertype diningtabletype stoveburnertype toastertype towelholdertype - receptacletype
   remotecontroltype booktype vasetype clothtype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   handtowelholder_1 diningtable_2 stoveburner_3 toaster_4 towelholder_5 microwave_6 fridge_7 - receptacle
   remotecontrol_1 book_2 vase_3 cloth_4 pan_5 - obj
 )
 (:init (receptacletype_0 handtowelholder_1 handtowelholdertype) (receptacletype_0 diningtable_2 diningtabletype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 toaster_4 toastertype) (receptacletype_0 towelholder_5 towelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 remotecontrol_1 remotecontroltype) (objecttype_0 book_2 booktype) (objecttype_0 vase_3 vasetype) (objecttype_0 cloth_4 clothtype) (objecttype_0 pan_5 pantype) (cancontain diningtabletype remotecontroltype) (cancontain diningtabletype booktype) (cancontain diningtabletype vasetype) (cancontain diningtabletype clothtype) (cancontain diningtabletype pantype) (cancontain stoveburnertype pantype) (cancontain fridgetype pantype) (pickupable remotecontrol_1) (pickupable book_2) (pickupable vase_3) (pickupable cloth_4) (cleanable cloth_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation handtowelholder_1 location5) (receptacleatlocation diningtable_2 location3) (receptacleatlocation stoveburner_3 location1) (receptacleatlocation toaster_4 location5) (receptacleatlocation towelholder_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location5) (inreceptacle remotecontrol_1 diningtable_2) (inreceptacle book_2 diningtable_2) (inreceptacle vase_3 diningtable_2) (inreceptacle cloth_4 diningtable_2) (inreceptacle pan_5 stoveburner_3) (objectatlocation remotecontrol_1 location3) (objectatlocation book_2 location3) (objectatlocation vase_3 location3) (objectatlocation cloth_4 location3) (objectatlocation pan_5 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 booktype) (receptacletype_0 ?r_0 diningtabletype))))))
 (:constraints (sometime (atlocation agent1 location2)) (sometime (atlocation agent1 location5)) (sometime (or (checked microwave_6) (holds agent1 vase_3))))
 (:metric minimize (total-cost))
)
