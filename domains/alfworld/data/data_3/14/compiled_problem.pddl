(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   cabinettype tvstandtype toiletpaperhangertype sidetabletype - receptacletype
   peppershakertype tomatotype forktype cellphonetype boxtype - objecttype
   location3 location4 - location
   cabinet_1 tvstand_2 toiletpaperhanger_3 sidetable_4 fridge_5 microwave_6 fridge_7 - receptacle
   fork_3 cellphone_4 - obj
 )
 (:init (receptacletype_0 cabinet_1 cabinettype) (receptacletype_0 tvstand_2 tvstandtype) (receptacletype_0 toiletpaperhanger_3 toiletpaperhangertype) (receptacletype_0 sidetable_4 sidetabletype) (receptacletype_0 fridge_5 fridgetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 peppershaker_1 peppershakertype) (objecttype_0 tomato_2 tomatotype) (objecttype_0 fork_3 forktype) (objecttype_0 cellphone_4 cellphonetype) (objecttype_0 box_5 boxtype) (cancontain cabinettype peppershakertype) (cancontain cabinettype boxtype) (cancontain sidetabletype peppershakertype) (cancontain sidetabletype tomatotype) (cancontain sidetabletype forktype) (cancontain sidetabletype cellphonetype) (cancontain sidetabletype boxtype) (cancontain fridgetype tomatotype) (cancontain microwavetype tomatotype) (pickupable peppershaker_1) (pickupable tomato_2) (cleanable tomato_2) (heatable tomato_2) (coolable tomato_2) (sliceable tomato_2) (pickupable fork_3) (cleanable fork_3) (pickupable cellphone_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation cabinet_1 location2) (receptacleatlocation tvstand_2 location5) (receptacleatlocation toiletpaperhanger_3 location2) (receptacleatlocation sidetable_4 location3) (receptacleatlocation fridge_5 location5) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location4) (inreceptacle peppershaker_1 sidetable_4) (inreceptacle tomato_2 fridge_5) (inreceptacle fork_3 sidetable_4) (inreceptacle cellphone_4 sidetable_4) (inreceptacle box_5 sidetable_4) (objectatlocation peppershaker_1 location3) (objectatlocation tomato_2 location5) (objectatlocation fork_3 location3) (objectatlocation cellphone_4 location3) (objectatlocation box_5 location3) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 boxtype) (receptacletype_0 ?r_0 cabinettype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
