(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   safetype shelftype toilettype bedtype toiletpaperhangertype - receptacletype
   newspapertype remotecontroltype eggtype saltshakertype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   safe_1 shelf_2 toilet_3 bed_4 toiletpaperhanger_5 microwave_6 fridge_7 - receptacle
   newspaper_1 remotecontrol_2 egg_3 saltshaker_4 bowl_5 - obj
 )
 (:init (receptacletype_0 safe_1 safetype) (receptacletype_0 shelf_2 shelftype) (receptacletype_0 toilet_3 toilettype) (receptacletype_0 bed_4 bedtype) (receptacletype_0 toiletpaperhanger_5 toiletpaperhangertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 newspaper_1 newspapertype) (objecttype_0 remotecontrol_2 remotecontroltype) (objecttype_0 egg_3 eggtype) (objecttype_0 saltshaker_4 saltshakertype) (objecttype_0 bowl_5 bowltype) (cancontain shelftype newspapertype) (cancontain shelftype remotecontroltype) (cancontain shelftype saltshakertype) (cancontain shelftype bowltype) (cancontain toilettype newspapertype) (cancontain bedtype newspapertype) (cancontain microwavetype eggtype) (cancontain microwavetype bowltype) (cancontain fridgetype eggtype) (cancontain fridgetype bowltype) (pickupable newspaper_1) (pickupable remotecontrol_2) (pickupable egg_3) (cleanable egg_3) (heatable egg_3) (coolable egg_3) (sliceable egg_3) (pickupable saltshaker_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation safe_1 location1) (receptacleatlocation shelf_2 location1) (receptacleatlocation toilet_3 location2) (receptacleatlocation bed_4 location4) (receptacleatlocation toiletpaperhanger_5 location1) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location1) (inreceptacle newspaper_1 shelf_2) (inreceptacle remotecontrol_2 shelf_2) (inreceptacle egg_3 microwave_6) (inreceptacle saltshaker_4 shelf_2) (inreceptacle bowl_5 fridge_7) (objectatlocation newspaper_1 location1) (objectatlocation remotecontrol_2 location1) (objectatlocation egg_3 location4) (objectatlocation saltshaker_4 location1) (objectatlocation bowl_5 location1) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o bowltype) (receptacletype_0 ?r shelftype))))))
 (:metric minimize (total-cost))
)
