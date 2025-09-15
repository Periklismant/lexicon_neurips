(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   diningtabletype stoveburnertype cabinettype bedtype - receptacletype
   lettucetype mugtype watchtype toiletpapertype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   diningtable_1 stoveburner_2 cabinet_3 diningtable_4 bed_5 microwave_6 fridge_7 - receptacle
   lettuce_1 mug_2 watch_3 toiletpaper_4 pot_5 - obj
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 stoveburner_2 stoveburnertype) (receptacletype_0 cabinet_3 cabinettype) (receptacletype_0 diningtable_4 diningtabletype) (receptacletype_0 bed_5 bedtype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 lettuce_1 lettucetype) (objecttype_0 mug_2 mugtype) (objecttype_0 watch_3 watchtype) (objecttype_0 toiletpaper_4 toiletpapertype) (objecttype_0 pot_5 pottype) (cancontain diningtabletype lettucetype) (cancontain diningtabletype mugtype) (cancontain diningtabletype watchtype) (cancontain diningtabletype toiletpapertype) (cancontain diningtabletype pottype) (cancontain stoveburnertype pottype) (cancontain cabinettype mugtype) (cancontain cabinettype toiletpapertype) (cancontain cabinettype pottype) (cancontain microwavetype mugtype) (cancontain fridgetype lettucetype) (cancontain fridgetype mugtype) (cancontain fridgetype pottype) (pickupable lettuce_1) (cleanable lettuce_1) (coolable lettuce_1) (sliceable lettuce_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (pickupable watch_3) (pickupable toiletpaper_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation diningtable_1 location1) (receptacleatlocation stoveburner_2 location4) (receptacleatlocation cabinet_3 location3) (receptacleatlocation diningtable_4 location3) (receptacleatlocation bed_5 location3) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location4) (inreceptacle lettuce_1 diningtable_4) (inreceptacle mug_2 fridge_7) (inreceptacle watch_3 diningtable_1) (inreceptacle toiletpaper_4 cabinet_3) (inreceptacle pot_5 diningtable_1) (objectatlocation lettuce_1 location3) (objectatlocation mug_2 location4) (objectatlocation watch_3 location1) (objectatlocation toiletpaper_4 location3) (objectatlocation pot_5 location1) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o mugtype) (receptacletype_0 ?r diningtabletype))))))
 (:metric minimize (total-cost))
)
