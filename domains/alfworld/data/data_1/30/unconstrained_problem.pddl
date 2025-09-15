(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype handtowelholdertype sidetabletype - receptacletype
   kettletype ladletype pantype mugtype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 handtowelholder_2 sidetable_3 safe_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   kettle_1 ladle_2 pan_3 mug_4 pot_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 handtowelholder_2 handtowelholdertype) (receptacletype_0 sidetable_3 sidetabletype) (receptacletype_0 safe_4 safetype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 kettle_1 kettletype) (objecttype_0 ladle_2 ladletype) (objecttype_0 pan_3 pantype) (objecttype_0 mug_4 mugtype) (objecttype_0 pot_5 pottype) (cancontain sidetabletype kettletype) (cancontain sidetabletype ladletype) (cancontain sidetabletype pantype) (cancontain sidetabletype mugtype) (cancontain sidetabletype pottype) (cancontain microwavetype mugtype) (cancontain fridgetype pantype) (cancontain fridgetype mugtype) (cancontain fridgetype pottype) (pickupable kettle_1) (cleanable kettle_1) (pickupable ladle_2) (cleanable ladle_2) (pickupable pan_3) (isreceptacleobject pan_3) (cleanable pan_3) (coolable pan_3) (pickupable mug_4) (isreceptacleobject mug_4) (cleanable mug_4) (heatable mug_4) (coolable mug_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation safe_1 location1) (receptacleatlocation handtowelholder_2 location4) (receptacleatlocation sidetable_3 location3) (receptacleatlocation safe_4 location4) (receptacleatlocation handtowelholder_5 location5) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location5) (inreceptacle kettle_1 sidetable_3) (inreceptacle ladle_2 sidetable_3) (inreceptacle pan_3 sidetable_3) (inreceptacle mug_4 sidetable_3) (inreceptacle pot_5 sidetable_3) (objectatlocation kettle_1 location3) (objectatlocation ladle_2 location3) (objectatlocation pan_3 location3) (objectatlocation mug_4 location3) (objectatlocation pot_5 location3) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o pantype) (receptacletype_0 ?r fridgetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
