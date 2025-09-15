(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bathtubbasintype diningtabletype countertoptype toastertype - receptacletype
   statuetype basketballtype watchtype tissueboxtype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   microwave_1 bathtubbasin_2 diningtable_3 countertop_4 toaster_5 microwave_6 fridge_7 - receptacle
   statue_1 basketball_2 watch_3 tissuebox_4 mug_5 - obj
 )
 (:init (receptacletype_0 microwave_1 microwavetype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 diningtable_3 diningtabletype) (receptacletype_0 countertop_4 countertoptype) (receptacletype_0 toaster_5 toastertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 statue_1 statuetype) (objecttype_0 basketball_2 basketballtype) (objecttype_0 watch_3 watchtype) (objecttype_0 tissuebox_4 tissueboxtype) (objecttype_0 mug_5 mugtype) (cancontain microwavetype mugtype) (cancontain diningtabletype statuetype) (cancontain diningtabletype basketballtype) (cancontain diningtabletype watchtype) (cancontain diningtabletype tissueboxtype) (cancontain diningtabletype mugtype) (cancontain countertoptype statuetype) (cancontain countertoptype basketballtype) (cancontain countertoptype watchtype) (cancontain countertoptype tissueboxtype) (cancontain countertoptype mugtype) (cancontain fridgetype mugtype) (pickupable statue_1) (pickupable basketball_2) (pickupable watch_3) (pickupable tissuebox_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation microwave_1 location3) (receptacleatlocation bathtubbasin_2 location2) (receptacleatlocation diningtable_3 location5) (receptacleatlocation countertop_4 location4) (receptacleatlocation toaster_5 location2) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location2) (inreceptacle statue_1 diningtable_3) (inreceptacle basketball_2 diningtable_3) (inreceptacle watch_3 countertop_4) (inreceptacle tissuebox_4 countertop_4) (inreceptacle mug_5 fridge_7) (objectatlocation statue_1 location5) (objectatlocation basketball_2 location5) (objectatlocation watch_3 location4) (objectatlocation tissuebox_4 location4) (objectatlocation mug_5 location2) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 watchtype) (receptacletype_0 ?r countertoptype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 statuetype) (receptacletype_0 ?r countertoptype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
