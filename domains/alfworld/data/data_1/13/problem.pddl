(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   sidetabletype drawertype laundryhampertype toiletpaperhangertype - receptacletype
   boxtype glassbottletype wateringcantype lettucetype pottype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sidetable_1 drawer_2 laundryhamper_3 toiletpaperhanger_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   box_1 glassbottle_2 wateringcan_3 lettuce_4 pot_5 - obj
 )
 (:init (receptacletype_0 sidetable_1 sidetabletype) (receptacletype_0 drawer_2 drawertype) (receptacletype_0 laundryhamper_3 laundryhampertype) (receptacletype_0 toiletpaperhanger_4 toiletpaperhangertype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 box_1 boxtype) (objecttype_0 glassbottle_2 glassbottletype) (objecttype_0 wateringcan_3 wateringcantype) (objecttype_0 lettuce_4 lettucetype) (objecttype_0 pot_5 pottype) (cancontain sidetabletype boxtype) (cancontain sidetabletype glassbottletype) (cancontain sidetabletype wateringcantype) (cancontain sidetabletype lettucetype) (cancontain sidetabletype pottype) (cancontain drawertype wateringcantype) (cancontain microwavetype glassbottletype) (cancontain fridgetype glassbottletype) (cancontain fridgetype lettucetype) (cancontain fridgetype pottype) (pickupable box_1) (isreceptacleobject box_1) (pickupable glassbottle_2) (pickupable wateringcan_3) (pickupable lettuce_4) (cleanable lettuce_4) (coolable lettuce_4) (sliceable lettuce_4) (pickupable pot_5) (isreceptacleobject pot_5) (cleanable pot_5) (coolable pot_5) (receptacleatlocation sidetable_1 location4) (receptacleatlocation drawer_2 location2) (receptacleatlocation laundryhamper_3 location2) (receptacleatlocation toiletpaperhanger_4 location5) (receptacleatlocation laundryhamper_5 location5) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location3) (inreceptacle box_1 sidetable_1) (inreceptacle glassbottle_2 microwave_6) (inreceptacle wateringcan_3 sidetable_1) (inreceptacle lettuce_4 sidetable_1) (inreceptacle pot_5 sidetable_1) (objectatlocation box_1 location4) (objectatlocation glassbottle_2 location3) (objectatlocation wateringcan_3 location4) (objectatlocation lettuce_4 location4) (objectatlocation pot_5 location4) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (coolable ?o_0) (objecttype_0 ?o_0 lettucetype) (receptacletype_0 ?r_0 fridgetype) (iscool ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (atlocation agent1 location3)) (sometime-before (atlocation agent1 location3) (or (checked box_1) (objectatlocation glassbottle_2 location2))))
 (:metric minimize (total-cost))
)
