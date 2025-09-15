(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   laundryhampertype sidetabletype bathtubbasintype shelftype - receptacletype
   handtoweltype baseballbattype ladletype boxtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   laundryhamper_1 sidetable_2 sinkbasin_3 bathtubbasin_4 shelf_5 microwave_6 fridge_7 - receptacle
   handtowel_1 butterknife_2 baseballbat_3 ladle_4 box_5 - obj
 )
 (:init (receptacletype_0 laundryhamper_1 laundryhampertype) (receptacletype_0 sidetable_2 sidetabletype) (receptacletype_0 sinkbasin_3 sinkbasintype) (receptacletype_0 bathtubbasin_4 bathtubbasintype) (receptacletype_0 shelf_5 shelftype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 handtowel_1 handtoweltype) (objecttype_0 butterknife_2 butterknifetype) (objecttype_0 baseballbat_3 baseballbattype) (objecttype_0 ladle_4 ladletype) (objecttype_0 box_5 boxtype) (cancontain sidetabletype handtoweltype) (cancontain sidetabletype butterknifetype) (cancontain sidetabletype baseballbattype) (cancontain sidetabletype ladletype) (cancontain sidetabletype boxtype) (cancontain sinkbasintype handtoweltype) (cancontain sinkbasintype butterknifetype) (cancontain sinkbasintype ladletype) (cancontain bathtubbasintype handtoweltype) (cancontain shelftype handtoweltype) (cancontain shelftype boxtype) (pickupable handtowel_1) (pickupable butterknife_2) (cleanable butterknife_2) (pickupable baseballbat_3) (pickupable ladle_4) (cleanable ladle_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation laundryhamper_1 location1) (receptacleatlocation sidetable_2 location1) (receptacleatlocation sinkbasin_3 location1) (receptacleatlocation bathtubbasin_4 location3) (receptacleatlocation shelf_5 location5) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location5) (inreceptacle handtowel_1 bathtubbasin_4) (inreceptacle butterknife_2 sidetable_2) (inreceptacle baseballbat_3 sidetable_2) (inreceptacle ladle_4 sidetable_2) (inreceptacle box_5 shelf_5) (objectatlocation handtowel_1 location3) (objectatlocation butterknife_2 location1) (objectatlocation baseballbat_3 location1) (objectatlocation ladle_4 location1) (objectatlocation box_5 location5) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 boxtype) (receptacletype_0 ?r_0 shelftype))))))
 (:constraints (sometime (checked fridge_7)) (sometime (or (checked location4) (atlocation agent1 location2))) (sometime (holds agent1 ladle_4)) (sometime (or (checked location3) (objectatlocation box_5 location4))) (sometime (objectatlocation box_5 location1)) (sometime (or (atlocation agent1 location5) (atlocation agent1 location1))) (sometime (or (checked sinkbasin_3) (checked bathtubbasin_4))))
 (:metric minimize (total-cost))
)
