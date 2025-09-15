(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   handtowelholdertype - receptacletype
   breadtype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 - location
   fridge_1 handtowelholder_2 sinkbasin_3 microwave_4 fridge_5 - receptacle
   knife_1 bread_2 bowl_3 - obj
 )
 (:init (receptacletype_0 fridge_1 fridgetype) (receptacletype_0 handtowelholder_2 handtowelholdertype) (receptacletype_0 sinkbasin_3 sinkbasintype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 knife_1 knifetype) (objecttype_0 bread_2 breadtype) (objecttype_0 bowl_3 bowltype) (cancontain fridgetype breadtype) (cancontain fridgetype bowltype) (cancontain sinkbasintype knifetype) (cancontain sinkbasintype bowltype) (cancontain microwavetype breadtype) (cancontain microwavetype bowltype) (pickupable knife_1) (cleanable knife_1) (pickupable bread_2) (heatable bread_2) (coolable bread_2) (sliceable bread_2) (pickupable bowl_3) (isreceptacleobject bowl_3) (cleanable bowl_3) (coolable bowl_3) (receptacleatlocation fridge_1 location1) (receptacleatlocation handtowelholder_2 location1) (receptacleatlocation sinkbasin_3 location2) (receptacleatlocation microwave_4 location3) (receptacleatlocation fridge_5 location2) (inreceptacle knife_1 sinkbasin_3) (inreceptacle bread_2 fridge_1) (inreceptacle bowl_3 sinkbasin_3) (objectatlocation knife_1 location2) (objectatlocation bread_2 location1) (objectatlocation bowl_3 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 bowltype) (receptacletype_0 ?r_0 sinkbasintype))))))
 (:constraints (sometime (checked sinkbasin_3)) (sometime (holdsany agent1)) (sometime (or (objectatlocation bread_2 location2) (holdsany agent1))))
 (:metric minimize (total-cost))
)
