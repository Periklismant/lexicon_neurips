(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bedtype safetype bathtubbasintype handtowelholdertype - receptacletype
   vasetype bowltype dishspongetype booktype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bed_1 safe_2 bathtubbasin_3 handtowelholder_4 microwave_5 microwave_6 fridge_7 - receptacle
   vase_1 bowl_2 dishsponge_3 book_4 pot_5 - obj
 )
 (:init (receptacletype_0 bed_1 bedtype) (receptacletype_0 safe_2 safetype) (receptacletype_0 bathtubbasin_3 bathtubbasintype) (receptacletype_0 handtowelholder_4 handtowelholdertype) (receptacletype_0 microwave_5 microwavetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 vase_1 vasetype) (objecttype_0 bowl_2 bowltype) (objecttype_0 dishsponge_3 dishspongetype) (objecttype_0 book_4 booktype) (objecttype_0 pot_5 pottype) (cancontain bedtype booktype) (cancontain safetype vasetype) (cancontain bathtubbasintype dishspongetype) (cancontain microwavetype bowltype) (cancontain fridgetype bowltype) (cancontain fridgetype pottype) (pickupable vase_1) (pickupable bowl_2) (isreceptacleobject bowl_2) (cleanable bowl_2) (coolable bowl_2) (pickupable dishsponge_3) (cleanable dishsponge_3) (pickupable book_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation bed_1 location1) (receptacleatlocation safe_2 location5) (receptacleatlocation bathtubbasin_3 location2) (receptacleatlocation handtowelholder_4 location5) (receptacleatlocation microwave_5 location5) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location2) (inreceptacle vase_1 safe_2) (inreceptacle bowl_2 microwave_6) (inreceptacle dishsponge_3 bathtubbasin_3) (inreceptacle book_4 bed_1) (inreceptacle pot_5 fridge_7) (objectatlocation vase_1 location5) (objectatlocation bowl_2 location4) (objectatlocation dishsponge_3 location2) (objectatlocation book_4 location1) (objectatlocation pot_5 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o dishspongetype) (receptacletype_0 ?r bathtubbasintype))))))
 (:metric minimize (total-cost))
)
