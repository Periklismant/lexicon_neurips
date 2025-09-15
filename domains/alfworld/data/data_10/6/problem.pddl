(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   toiletpaperhangertype bathtubbasintype - receptacletype
   breadtype bowltype - objecttype
   agent1 - agent
   location1 location2 - location
   toiletpaperhanger_1 bathtubbasin_2 microwave_3 fridge_4 - receptacle
   bread_1 bowl_2 - obj
 )
 (:init (receptacletype_0 toiletpaperhanger_1 toiletpaperhangertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 microwave_3 microwavetype) (receptacletype_0 fridge_4 fridgetype) (objecttype_0 bread_1 breadtype) (objecttype_0 bowl_2 bowltype) (cancontain microwavetype breadtype) (cancontain microwavetype bowltype) (cancontain fridgetype breadtype) (cancontain fridgetype bowltype) (pickupable bread_1) (heatable bread_1) (coolable bread_1) (sliceable bread_1) (pickupable bowl_2) (isreceptacleobject bowl_2) (cleanable bowl_2) (coolable bowl_2) (receptacleatlocation toiletpaperhanger_1 location2) (receptacleatlocation bathtubbasin_2 location2) (receptacleatlocation microwave_3 location2) (receptacleatlocation fridge_4 location1) (inreceptacle bread_1 fridge_4) (inreceptacle bowl_2 fridge_4) (objectatlocation bread_1 location1) (objectatlocation bowl_2 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 bowltype) (receptacletype_0 ?r_0 fridgetype))))))
 (:constraints (sometime (checked microwave_3)) (sometime (and (holds agent1 bread_1) (holdsany agent1))) (sometime (checked bowl_2)) (sometime (or (checked bowl_2) (holdsany agent1))) (sometime (holdsany agent1)) (sometime (and (holdsany agent1) (objectatlocation bread_1 location2))) (sometime (holdsany agent1)) (sometime (or (holds agent1 bread_1) (inreceptacleobject bread_1 bowl_2))) (sometime (holds agent1 bread_1)) (sometime (or (atlocation agent1 location2) (checked location1))))
 (:metric minimize (total-cost))
)
