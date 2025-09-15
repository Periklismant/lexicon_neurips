(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype shelftype toilettype drawertype - receptacletype
   pentype spoontype bowltype lettucetype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 shelf_2 toilet_3 toilet_4 drawer_5 microwave_6 fridge_7 - receptacle
   pen_1 spoon_2 bowl_3 lettuce_4 pan_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 shelf_2 shelftype) (receptacletype_0 toilet_3 toilettype) (receptacletype_0 toilet_4 toilettype) (receptacletype_0 drawer_5 drawertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pen_1 pentype) (objecttype_0 spoon_2 spoontype) (objecttype_0 bowl_3 bowltype) (objecttype_0 lettuce_4 lettucetype) (objecttype_0 pan_5 pantype) (cancontain dressertype pentype) (cancontain dressertype bowltype) (cancontain shelftype pentype) (cancontain shelftype bowltype) (cancontain drawertype pentype) (cancontain drawertype spoontype) (cancontain microwavetype bowltype) (cancontain fridgetype bowltype) (cancontain fridgetype lettucetype) (cancontain fridgetype pantype) (pickupable pen_1) (pickupable spoon_2) (cleanable spoon_2) (pickupable bowl_3) (isreceptacleobject bowl_3) (cleanable bowl_3) (coolable bowl_3) (pickupable lettuce_4) (cleanable lettuce_4) (coolable lettuce_4) (sliceable lettuce_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation dresser_1 location5) (receptacleatlocation shelf_2 location4) (receptacleatlocation toilet_3 location3) (receptacleatlocation toilet_4 location1) (receptacleatlocation drawer_5 location5) (receptacleatlocation microwave_6 location5) (receptacleatlocation fridge_7 location1) (inreceptacle pen_1 dresser_1) (inreceptacle spoon_2 drawer_5) (inreceptacle bowl_3 microwave_6) (inreceptacle lettuce_4 fridge_7) (inreceptacle pan_5 fridge_7) (objectatlocation pen_1 location5) (objectatlocation spoon_2 location5) (objectatlocation bowl_3 location5) (objectatlocation lettuce_4 location1) (objectatlocation pan_5 location1) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o bowltype) (receptacletype_0 ?r dressertype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
