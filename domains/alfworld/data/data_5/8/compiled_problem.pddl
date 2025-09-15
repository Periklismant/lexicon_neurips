(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   garbagecantype toilettype shelftype diningtabletype - receptacletype
   booktype mugtype creditcardtype toiletpapertype platetype - objecttype
   garbagecan_1 toilet_2 shelf_4 microwave_6 fridge_7 - receptacle
   mug_2 toiletpaper_4 - obj
 )
 (:init (receptacletype_0 garbagecan_1 garbagecantype) (receptacletype_0 toilet_2 toilettype) (receptacletype_0 sinkbasin_3 sinkbasintype) (receptacletype_0 shelf_4 shelftype) (receptacletype_0 diningtable_5 diningtabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 book_1 booktype) (objecttype_0 mug_2 mugtype) (objecttype_0 creditcard_3 creditcardtype) (objecttype_0 toiletpaper_4 toiletpapertype) (objecttype_0 plate_5 platetype) (cancontain garbagecantype toiletpapertype) (cancontain toilettype toiletpapertype) (cancontain sinkbasintype mugtype) (cancontain sinkbasintype platetype) (cancontain shelftype booktype) (cancontain shelftype mugtype) (cancontain shelftype creditcardtype) (cancontain shelftype toiletpapertype) (cancontain shelftype platetype) (cancontain diningtabletype booktype) (cancontain diningtabletype mugtype) (cancontain diningtabletype creditcardtype) (cancontain diningtabletype toiletpapertype) (cancontain diningtabletype platetype) (cancontain microwavetype mugtype) (cancontain microwavetype platetype) (cancontain fridgetype mugtype) (cancontain fridgetype platetype) (pickupable book_1) (pickupable mug_2) (isreceptacleobject mug_2) (cleanable mug_2) (heatable mug_2) (coolable mug_2) (pickupable creditcard_3) (pickupable toiletpaper_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation garbagecan_1 location4) (receptacleatlocation toilet_2 location4) (receptacleatlocation sinkbasin_3 location2) (receptacleatlocation shelf_4 location4) (receptacleatlocation diningtable_5 location5) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location1) (inreceptacle book_1 diningtable_5) (inreceptacle mug_2 fridge_7) (inreceptacle creditcard_3 shelf_4) (inreceptacle toiletpaper_4 garbagecan_1) (inreceptacle plate_5 microwave_6) (objectatlocation book_1 location5) (objectatlocation mug_2 location1) (objectatlocation creditcard_3 location4) (objectatlocation toiletpaper_4 location4) (objectatlocation plate_5 location4) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 shelftype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
