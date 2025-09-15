(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   sidetabletype drawertype laundryhampertype toiletpaperhangertype - receptacletype
   dishspongetype winebottletype soapbottletype papertoweltype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sidetable_1 drawer_2 laundryhamper_3 toiletpaperhanger_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   dishsponge_1 winebottle_2 soapbottle_3 papertowel_4 pan_5 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 drawer_2 drawertype) (receptacletype_0 laundryhamper_3 laundryhampertype) (receptacletype_0 toiletpaperhanger_4 toiletpaperhangertype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 dishsponge_1 dishspongetype) (objecttype_0 winebottle_2 winebottletype) (objecttype_0 soapbottle_3 soapbottletype) (objecttype_0 papertowel_4 papertoweltype) (objecttype_0 pan_5 pantype) (cancontain sidetabletype dishspongetype) (cancontain sidetabletype winebottletype) (cancontain sidetabletype soapbottletype) (cancontain sidetabletype papertoweltype) (cancontain sidetabletype pantype) (cancontain drawertype dishspongetype) (cancontain drawertype soapbottletype) (cancontain fridgetype winebottletype) (cancontain fridgetype pantype) (pickupable dishsponge_1) (cleanable dishsponge_1) (pickupable winebottle_2) (pickupable soapbottle_3) (pickupable papertowel_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation sidetable_1 location5) (receptacleatlocation drawer_2 location3) (receptacleatlocation laundryhamper_3 location3) (receptacleatlocation toiletpaperhanger_4 location5) (receptacleatlocation laundryhamper_5 location4) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location2) (inreceptacle dishsponge_1 sidetable_1) (inreceptacle winebottle_2 sidetable_1) (inreceptacle soapbottle_3 sidetable_1) (inreceptacle papertowel_4 sidetable_1) (inreceptacle pan_5 sidetable_1) (objectatlocation dishsponge_1 location5) (objectatlocation winebottle_2 location5) (objectatlocation soapbottle_3 location5) (objectatlocation papertowel_4 location5) (objectatlocation pan_5 location5) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 dishspongetype) (receptacletype_0 ?r_0 sidetabletype))))))
 (:constraints (sometime (atlocation agent1 location1)) (sometime (or (objectatlocation soapbottle_3 location4) (atlocation agent1 location5))) (sometime (or (checked toiletpaperhanger_4) (checked dishsponge_1))) (sometime (holds agent1 soapbottle_3)) (sometime (checked location3)))
 (:metric minimize (total-cost))
)
