(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   shelftype dressertype coffeemachinetype armchairtype - receptacletype
   breadtype glassbottletype peppershakertype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   shelf_1 dresser_2 shelf_3 coffeemachine_4 armchair_5 microwave_6 fridge_7 - receptacle
   bread_1 bread_2 glassbottle_3 peppershaker_4 cup_5 - obj
 )
 (:init (receptacletype_0 shelf_1 shelftype) (receptacletype_0 dresser_2 dressertype) (receptacletype_0 shelf_3 shelftype) (receptacletype_0 coffeemachine_4 coffeemachinetype) (receptacletype_0 armchair_5 armchairtype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 bread_1 breadtype) (objecttype_0 bread_2 breadtype) (objecttype_0 glassbottle_3 glassbottletype) (objecttype_0 peppershaker_4 peppershakertype) (objecttype_0 cup_5 cuptype) (cancontain shelftype glassbottletype) (cancontain shelftype peppershakertype) (cancontain shelftype cuptype) (cancontain dressertype glassbottletype) (cancontain dressertype cuptype) (cancontain microwavetype breadtype) (cancontain microwavetype glassbottletype) (cancontain microwavetype cuptype) (cancontain fridgetype breadtype) (cancontain fridgetype glassbottletype) (cancontain fridgetype cuptype) (pickupable bread_1) (heatable bread_1) (coolable bread_1) (sliceable bread_1) (pickupable bread_2) (heatable bread_2) (coolable bread_2) (sliceable bread_2) (pickupable glassbottle_3) (pickupable peppershaker_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation shelf_1 location2) (receptacleatlocation dresser_2 location4) (receptacleatlocation shelf_3 location5) (receptacleatlocation coffeemachine_4 location2) (receptacleatlocation armchair_5 location3) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location5) (inreceptacle bread_1 microwave_6) (inreceptacle bread_2 fridge_7) (inreceptacle glassbottle_3 fridge_7) (inreceptacle peppershaker_4 shelf_3) (inreceptacle cup_5 shelf_3) (objectatlocation bread_1 location3) (objectatlocation bread_2 location5) (objectatlocation glassbottle_3 location5) (objectatlocation peppershaker_4 location5) (objectatlocation cup_5 location5) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o cuptype) (receptacletype_0 ?r dressertype))))))
 (:metric minimize (total-cost))
)
