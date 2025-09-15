(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   shelftype towelholdertype handtowelholdertype laundryhampertype countertoptype - receptacletype
   statuetype soapbottletype toiletpapertype tomatotype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   shelf_1 towelholder_2 handtowelholder_3 laundryhamper_4 countertop_5 microwave_6 fridge_7 - receptacle
   statue_1 soapbottle_2 toiletpaper_3 tomato_4 pot_5 - obj
 )
 (:init (receptacletype_0 shelf_1 shelftype) (receptacletype_0 towelholder_2 towelholdertype) (receptacletype_0 handtowelholder_3 handtowelholdertype) (receptacletype_0 laundryhamper_4 laundryhampertype) (receptacletype_0 countertop_5 countertoptype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 statue_1 statuetype) (objecttype_0 soapbottle_2 soapbottletype) (objecttype_0 toiletpaper_3 toiletpapertype) (objecttype_0 tomato_4 tomatotype) (objecttype_0 pot_5 pottype) (cancontain shelftype statuetype) (cancontain shelftype soapbottletype) (cancontain shelftype toiletpapertype) (cancontain shelftype pottype) (cancontain countertoptype statuetype) (cancontain countertoptype soapbottletype) (cancontain countertoptype toiletpapertype) (cancontain countertoptype tomatotype) (cancontain countertoptype pottype) (cancontain microwavetype tomatotype) (cancontain fridgetype tomatotype) (cancontain fridgetype pottype) (pickupable statue_1) (pickupable soapbottle_2) (pickupable toiletpaper_3) (pickupable tomato_4) (cleanable tomato_4) (heatable tomato_4) (coolable tomato_4) (sliceable tomato_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation shelf_1 location1) (receptacleatlocation towelholder_2 location3) (receptacleatlocation handtowelholder_3 location5) (receptacleatlocation laundryhamper_4 location5) (receptacleatlocation countertop_5 location1) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location2) (inreceptacle statue_1 countertop_5) (inreceptacle soapbottle_2 shelf_1) (inreceptacle toiletpaper_3 countertop_5) (inreceptacle tomato_4 fridge_7) (inreceptacle pot_5 shelf_1) (objectatlocation statue_1 location1) (objectatlocation soapbottle_2 location1) (objectatlocation toiletpaper_3 location1) (objectatlocation tomato_4 location2) (objectatlocation pot_5 location1) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 tomatotype) (receptacletype_0 ?r_0 fridgetype))))))
 (:constraints (sometime (checked laundryhamper_4)) (sometime (or (atlocation agent1 location5) (checked location4))) (sometime (or (checked fridge_7) (objectatlocation soapbottle_2 location2))) (sometime (holds agent1 soapbottle_2)) (sometime (or (checked handtowelholder_3) (holds agent1 statue_1))) (sometime (or (checked location3) (holds agent1 toiletpaper_3))) (sometime (or (checked tomato_4) (checked soapbottle_2))))
 (:metric minimize (total-cost))
)
