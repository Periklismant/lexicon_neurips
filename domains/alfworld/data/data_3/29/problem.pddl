(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   shelftype stoveburnertype towelholdertype desktype - receptacletype
   lettucetype appletype candletype breadtype boxtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   shelf_1 stoveburner_2 stoveburner_3 towelholder_4 desk_5 microwave_6 fridge_7 - receptacle
   lettuce_1 apple_2 candle_3 bread_4 box_5 - obj
 )
 (:init (receptacletype_0 shelf_1 shelftype) (receptacletype_0 stoveburner_2 stoveburnertype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 towelholder_4 towelholdertype) (receptacletype_0 desk_5 desktype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 lettuce_1 lettucetype) (objecttype_0 apple_2 appletype) (objecttype_0 candle_3 candletype) (objecttype_0 bread_4 breadtype) (objecttype_0 box_5 boxtype) (cancontain shelftype candletype) (cancontain shelftype boxtype) (cancontain desktype candletype) (cancontain desktype boxtype) (cancontain microwavetype appletype) (cancontain microwavetype breadtype) (cancontain fridgetype lettucetype) (cancontain fridgetype appletype) (cancontain fridgetype breadtype) (pickupable lettuce_1) (cleanable lettuce_1) (coolable lettuce_1) (sliceable lettuce_1) (pickupable apple_2) (cleanable apple_2) (heatable apple_2) (coolable apple_2) (sliceable apple_2) (pickupable candle_3) (pickupable bread_4) (heatable bread_4) (coolable bread_4) (sliceable bread_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation shelf_1 location5) (receptacleatlocation stoveburner_2 location1) (receptacleatlocation stoveburner_3 location3) (receptacleatlocation towelholder_4 location2) (receptacleatlocation desk_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle lettuce_1 fridge_7) (inreceptacle apple_2 fridge_7) (inreceptacle candle_3 shelf_1) (inreceptacle bread_4 microwave_6) (inreceptacle box_5 desk_5) (objectatlocation lettuce_1 location1) (objectatlocation apple_2 location1) (objectatlocation candle_3 location5) (objectatlocation bread_4 location2) (objectatlocation box_5 location3) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 breadtype) (receptacletype_0 ?r_0 fridgetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (or (atlocation agent1 location5) (objectatlocation lettuce_1 location4))) (sometime (holds agent1 bread_4)) (sometime-after (holds agent1 bread_4) (atlocation agent1 location4)) (sometime (checked towelholder_4)))
 (:metric minimize (total-cost))
)
