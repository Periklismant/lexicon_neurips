(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   shelftype cabinettype coffeetabletype toiletpaperhangertype - receptacletype
   winebottletype eggtype mugtype candletype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   shelf_1 cabinet_2 microwave_3 coffeetable_4 toiletpaperhanger_5 microwave_6 fridge_7 - receptacle
   winebottle_1 egg_2 mug_3 candle_4 bowl_5 - obj
 )
 (:init (receptacletype_0 shelf_1 shelftype) (receptacletype_0 cabinet_2 cabinettype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 coffeetable_4 coffeetabletype) (receptacletype_0 toiletpaperhanger_5 toiletpaperhangertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 winebottle_1 winebottletype) (objecttype_0 egg_2 eggtype) (objecttype_0 mug_3 mugtype) (objecttype_0 candle_4 candletype) (objecttype_0 bowl_5 bowltype) (cancontain shelftype winebottletype) (cancontain shelftype mugtype) (cancontain shelftype candletype) (cancontain shelftype bowltype) (cancontain cabinettype winebottletype) (cancontain cabinettype mugtype) (cancontain cabinettype candletype) (cancontain cabinettype bowltype) (cancontain microwavetype eggtype) (cancontain microwavetype mugtype) (cancontain microwavetype bowltype) (cancontain coffeetabletype winebottletype) (cancontain coffeetabletype eggtype) (cancontain coffeetabletype mugtype) (cancontain coffeetabletype candletype) (cancontain coffeetabletype bowltype) (cancontain fridgetype winebottletype) (cancontain fridgetype eggtype) (cancontain fridgetype mugtype) (cancontain fridgetype bowltype) (pickupable winebottle_1) (pickupable egg_2) (cleanable egg_2) (heatable egg_2) (coolable egg_2) (sliceable egg_2) (pickupable mug_3) (isreceptacleobject mug_3) (cleanable mug_3) (heatable mug_3) (coolable mug_3) (pickupable candle_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation shelf_1 location2) (receptacleatlocation cabinet_2 location3) (receptacleatlocation microwave_3 location3) (receptacleatlocation coffeetable_4 location5) (receptacleatlocation toiletpaperhanger_5 location2) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location1) (inreceptacle winebottle_1 cabinet_2) (inreceptacle egg_2 microwave_3) (inreceptacle mug_3 microwave_6) (inreceptacle candle_4 coffeetable_4) (inreceptacle bowl_5 coffeetable_4) (objectatlocation winebottle_1 location3) (objectatlocation egg_2 location3) (objectatlocation mug_3 location4) (objectatlocation candle_4 location5) (objectatlocation bowl_5 location5) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o bowltype) (receptacletype_0 ?r cabinettype))))))
 (:metric minimize (total-cost))
)
