(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bathtubbasintype toastertype ottomantype - receptacletype
   booktype basketballtype clothtype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bathtubbasin_1 sinkbasin_2 bathtubbasin_3 toaster_4 ottoman_5 microwave_6 fridge_7 - receptacle
   book_1 basketball_2 cloth_3 knife_4 mug_5 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 sinkbasin_2 sinkbasintype) (receptacletype_0 bathtubbasin_3 bathtubbasintype) (receptacletype_0 toaster_4 toastertype) (receptacletype_0 ottoman_5 ottomantype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 book_1 booktype) (objecttype_0 basketball_2 basketballtype) (objecttype_0 cloth_3 clothtype) (objecttype_0 knife_4 knifetype) (objecttype_0 mug_5 mugtype) (cancontain bathtubbasintype clothtype) (cancontain sinkbasintype clothtype) (cancontain sinkbasintype knifetype) (cancontain sinkbasintype mugtype) (cancontain ottomantype booktype) (cancontain ottomantype basketballtype) (cancontain ottomantype clothtype) (cancontain microwavetype mugtype) (cancontain fridgetype mugtype) (pickupable book_1) (pickupable basketball_2) (pickupable cloth_3) (cleanable cloth_3) (pickupable knife_4) (cleanable knife_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation bathtubbasin_1 location5) (receptacleatlocation sinkbasin_2 location5) (receptacleatlocation bathtubbasin_3 location2) (receptacleatlocation toaster_4 location4) (receptacleatlocation ottoman_5 location1) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location4) (inreceptacle book_1 ottoman_5) (inreceptacle basketball_2 ottoman_5) (inreceptacle cloth_3 ottoman_5) (inreceptacle knife_4 sinkbasin_2) (inreceptacle mug_5 sinkbasin_2) (objectatlocation book_1 location1) (objectatlocation basketball_2 location1) (objectatlocation cloth_3 location1) (objectatlocation knife_4 location5) (objectatlocation mug_5 location5) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o1 - obj)
 (and (inreceptacle ?o1 ?r) (objecttype_0 ?o1 clothtype) (receptacletype_0 ?r ottomantype) (exists (?o2 - obj)
 (and (not (= ?o1 ?o2)) (objecttype_0 ?o2 booktype) (receptacletype_0 ?r ottomantype) (inreceptacle ?o2 ?r))))))))
 (:metric minimize (total-cost))
)
