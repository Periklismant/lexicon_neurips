(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   sidetabletype bathtubbasintype shelftype toiletpaperhangertype countertoptype - receptacletype
   watchtype saltshakertype cellphonetype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sidetable_1 bathtubbasin_2 shelf_3 toiletpaperhanger_4 countertop_5 microwave_6 fridge_7 - receptacle
   watch_1 saltshaker_2 butterknife_3 cellphone_4 pot_5 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 shelf_3 shelftype) (receptacletype_0 toiletpaperhanger_4 toiletpaperhangertype) (receptacletype_0 countertop_5 countertoptype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 watch_1 watchtype) (objecttype_0 saltshaker_2 saltshakertype) (objecttype_0 butterknife_3 butterknifetype) (objecttype_0 cellphone_4 cellphonetype) (objecttype_0 pot_5 pottype) (cancontain sidetabletype watchtype) (cancontain sidetabletype saltshakertype) (cancontain sidetabletype butterknifetype) (cancontain sidetabletype cellphonetype) (cancontain sidetabletype pottype) (cancontain shelftype watchtype) (cancontain shelftype saltshakertype) (cancontain shelftype cellphonetype) (cancontain shelftype pottype) (cancontain countertoptype watchtype) (cancontain countertoptype saltshakertype) (cancontain countertoptype butterknifetype) (cancontain countertoptype cellphonetype) (cancontain countertoptype pottype) (cancontain fridgetype pottype) (pickupable watch_1) (pickupable saltshaker_2) (pickupable butterknife_3) (cleanable butterknife_3) (pickupable cellphone_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation sidetable_1 location3) (receptacleatlocation bathtubbasin_2 location4) (receptacleatlocation shelf_3 location1) (receptacleatlocation toiletpaperhanger_4 location3) (receptacleatlocation countertop_5 location1) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location5) (inreceptacle watch_1 shelf_3) (inreceptacle saltshaker_2 sidetable_1) (inreceptacle butterknife_3 sidetable_1) (inreceptacle cellphone_4 sidetable_1) (inreceptacle pot_5 sidetable_1) (objectatlocation watch_1 location1) (objectatlocation saltshaker_2 location3) (objectatlocation butterknife_3 location3) (objectatlocation cellphone_4 location3) (objectatlocation pot_5 location3) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o cellphonetype) (receptacletype_0 ?r countertoptype))))))
 (:metric minimize (total-cost))
)
