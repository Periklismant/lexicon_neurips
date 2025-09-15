(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   shelftype stoveburnertype coffeetabletype - receptacletype
   booktype pottype - objecttype
   agent1 - agent
   location1 location2 location3 - location
   shelf_1 stoveburner_2 coffeetable_3 microwave_4 fridge_5 - receptacle
   book_1 pot_2 pot_3 - obj
 )
 (:init (receptacletype_0 shelf_1 shelftype) (receptacletype_0 stoveburner_2 stoveburnertype) (receptacletype_0 coffeetable_3 coffeetabletype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 book_1 booktype) (objecttype_0 pot_2 pottype) (objecttype_0 pot_3 pottype) (cancontain shelftype booktype) (cancontain shelftype pottype) (cancontain stoveburnertype pottype) (cancontain coffeetabletype booktype) (cancontain coffeetabletype pottype) (cancontain fridgetype pottype) (pickupable book_1) (pickupable pot_2) (isreceptacleobject pot_2) (cleanable pot_2) (coolable pot_2) (pickupable pot_3) (isreceptacleobject pot_3) (cleanable pot_3) (coolable pot_3) (receptacleatlocation shelf_1 location1) (receptacleatlocation stoveburner_2 location3) (receptacleatlocation coffeetable_3 location1) (receptacleatlocation microwave_4 location3) (receptacleatlocation fridge_5 location2) (inreceptacle book_1 shelf_1) (inreceptacle pot_2 fridge_5) (inreceptacle pot_3 fridge_5) (objectatlocation book_1 location1) (objectatlocation pot_2 location2) (objectatlocation pot_3 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o pottype) (receptacletype_0 ?r fridgetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
