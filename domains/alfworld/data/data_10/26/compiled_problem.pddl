(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   toiletpaperhangertype diningtabletype sidetabletype - receptacletype
   creditcardtype laptoptype newspapertype eggtype bowltype - objecttype
   location5 - location
   sinkbasin_1 toiletpaperhanger_2 diningtable_3 sidetable_5 fridge_7 - receptacle
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 diningtable_3 diningtabletype) (receptacletype_0 toiletpaperhanger_4 toiletpaperhangertype) (receptacletype_0 sidetable_5 sidetabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 creditcard_1 creditcardtype) (objecttype_0 laptop_2 laptoptype) (objecttype_0 newspaper_3 newspapertype) (objecttype_0 egg_4 eggtype) (objecttype_0 bowl_5 bowltype) (cancontain sinkbasintype eggtype) (cancontain sinkbasintype bowltype) (cancontain diningtabletype creditcardtype) (cancontain diningtabletype laptoptype) (cancontain diningtabletype newspapertype) (cancontain diningtabletype eggtype) (cancontain diningtabletype bowltype) (cancontain sidetabletype creditcardtype) (cancontain sidetabletype laptoptype) (cancontain sidetabletype newspapertype) (cancontain sidetabletype eggtype) (cancontain sidetabletype bowltype) (cancontain microwavetype eggtype) (cancontain microwavetype bowltype) (cancontain fridgetype eggtype) (cancontain fridgetype bowltype) (pickupable creditcard_1) (pickupable laptop_2) (pickupable newspaper_3) (pickupable egg_4) (cleanable egg_4) (heatable egg_4) (coolable egg_4) (sliceable egg_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation sinkbasin_1 location3) (receptacleatlocation toiletpaperhanger_2 location3) (receptacleatlocation diningtable_3 location4) (receptacleatlocation toiletpaperhanger_4 location1) (receptacleatlocation sidetable_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location2) (inreceptacle creditcard_1 diningtable_3) (inreceptacle laptop_2 diningtable_3) (inreceptacle newspaper_3 sidetable_5) (inreceptacle egg_4 fridge_7) (inreceptacle bowl_5 sinkbasin_1) (objectatlocation creditcard_1 location4) (objectatlocation laptop_2 location4) (objectatlocation newspaper_3 location4) (objectatlocation egg_4 location2) (objectatlocation bowl_5 location3) (atlocation agent1 location5) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 eggtype) (receptacletype_0 ?r_0 microwavetype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_5) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12)))
 (:metric minimize (total-cost))
)
