(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype toiletpaperhangertype dressertype sofatype desktype - receptacletype
   pantype bowltype wateringcantype eggtype boxtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 toiletpaperhanger_2 dresser_3 sofa_4 desk_5 microwave_6 fridge_7 - receptacle
   pan_1 bowl_2 wateringcan_3 egg_4 box_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 dresser_3 dressertype) (receptacletype_0 sofa_4 sofatype) (receptacletype_0 desk_5 desktype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 pan_1 pantype) (objecttype_0 bowl_2 bowltype) (objecttype_0 wateringcan_3 wateringcantype) (objecttype_0 egg_4 eggtype) (objecttype_0 box_5 boxtype) (cancontain dressertype bowltype) (cancontain dressertype wateringcantype) (cancontain dressertype boxtype) (cancontain sofatype boxtype) (cancontain desktype bowltype) (cancontain desktype wateringcantype) (cancontain desktype boxtype) (cancontain microwavetype bowltype) (cancontain microwavetype eggtype) (cancontain fridgetype pantype) (cancontain fridgetype bowltype) (cancontain fridgetype eggtype) (pickupable pan_1) (isreceptacleobject pan_1) (cleanable pan_1) (coolable pan_1) (pickupable bowl_2) (isreceptacleobject bowl_2) (cleanable bowl_2) (coolable bowl_2) (pickupable wateringcan_3) (pickupable egg_4) (cleanable egg_4) (heatable egg_4) (coolable egg_4) (sliceable egg_4) (pickupable box_5) (isreceptacleobject box_5) (receptacleatlocation safe_1 location1) (receptacleatlocation toiletpaperhanger_2 location4) (receptacleatlocation dresser_3 location5) (receptacleatlocation sofa_4 location2) (receptacleatlocation desk_5 location2) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location5) (inreceptacle pan_1 fridge_7) (inreceptacle bowl_2 dresser_3) (inreceptacle wateringcan_3 desk_5) (inreceptacle egg_4 microwave_6) (inreceptacle box_5 desk_5) (objectatlocation pan_1 location5) (objectatlocation bowl_2 location5) (objectatlocation wateringcan_3 location2) (objectatlocation egg_4 location4) (objectatlocation box_5 location2) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o eggtype) (receptacletype_0 ?r microwavetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
