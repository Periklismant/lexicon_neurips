(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   safetype drawertype countertoptype shelftype - receptacletype
   booktype toiletpaperrolltype clothtype soapbottletype bowltype - objecttype
   location2 location3 location4 - location
   safe_1 sinkbasin_2 drawer_3 countertop_4 shelf_5 microwave_6 fridge_7 - receptacle
   book_1 toiletpaperroll_2 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 sinkbasin_2 sinkbasintype) (receptacletype_0 drawer_3 drawertype) (receptacletype_0 countertop_4 countertoptype) (receptacletype_0 shelf_5 shelftype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 book_1 booktype) (objecttype_0 toiletpaperroll_2 toiletpaperrolltype) (objecttype_0 cloth_3 clothtype) (objecttype_0 soapbottle_4 soapbottletype) (objecttype_0 bowl_5 bowltype) (cancontain sinkbasintype clothtype) (cancontain sinkbasintype bowltype) (cancontain drawertype booktype) (cancontain drawertype toiletpaperrolltype) (cancontain drawertype clothtype) (cancontain drawertype soapbottletype) (cancontain countertoptype booktype) (cancontain countertoptype toiletpaperrolltype) (cancontain countertoptype clothtype) (cancontain countertoptype soapbottletype) (cancontain countertoptype bowltype) (cancontain shelftype booktype) (cancontain shelftype toiletpaperrolltype) (cancontain shelftype clothtype) (cancontain shelftype soapbottletype) (cancontain shelftype bowltype) (cancontain microwavetype bowltype) (cancontain fridgetype bowltype) (pickupable book_1) (pickupable toiletpaperroll_2) (pickupable cloth_3) (cleanable cloth_3) (pickupable soapbottle_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation safe_1 location2) (receptacleatlocation sinkbasin_2 location5) (receptacleatlocation drawer_3 location4) (receptacleatlocation countertop_4 location5) (receptacleatlocation shelf_5 location2) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location4) (inreceptacle book_1 shelf_5) (inreceptacle toiletpaperroll_2 drawer_3) (inreceptacle cloth_3 drawer_3) (inreceptacle soapbottle_4 countertop_4) (inreceptacle bowl_5 shelf_5) (objectatlocation book_1 location2) (objectatlocation toiletpaperroll_2 location4) (objectatlocation cloth_3 location4) (objectatlocation soapbottle_4 location5) (objectatlocation bowl_5 location2) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 toiletpaperrolltype) (receptacletype_0 ?r_0 drawertype)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
