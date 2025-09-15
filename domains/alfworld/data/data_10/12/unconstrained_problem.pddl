(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   laundryhampertype toiletpaperhangertype handtowelholdertype - receptacletype
   toiletpaperrolltype bowltype toiletpapertype handtoweltype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   microwave_1 laundryhamper_2 toiletpaperhanger_3 handtowelholder_4 handtowelholder_5 microwave_6 fridge_7 - receptacle
   toiletpaperroll_1 bowl_2 toiletpaper_3 handtowel_4 plate_5 - obj
 )
 (:init (receptacletype_0 microwave_1 microwavetype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 toiletpaperhanger_3 toiletpaperhangertype) (receptacletype_0 handtowelholder_4 handtowelholdertype) (receptacletype_0 handtowelholder_5 handtowelholdertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 toiletpaperroll_1 toiletpaperrolltype) (objecttype_0 bowl_2 bowltype) (objecttype_0 toiletpaper_3 toiletpapertype) (objecttype_0 handtowel_4 handtoweltype) (objecttype_0 plate_5 platetype) (cancontain microwavetype bowltype) (cancontain microwavetype platetype) (cancontain toiletpaperhangertype toiletpaperrolltype) (cancontain toiletpaperhangertype toiletpapertype) (cancontain handtowelholdertype handtoweltype) (cancontain fridgetype bowltype) (cancontain fridgetype platetype) (pickupable toiletpaperroll_1) (pickupable bowl_2) (isreceptacleobject bowl_2) (cleanable bowl_2) (coolable bowl_2) (pickupable toiletpaper_3) (pickupable handtowel_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation microwave_1 location3) (receptacleatlocation laundryhamper_2 location3) (receptacleatlocation toiletpaperhanger_3 location3) (receptacleatlocation handtowelholder_4 location5) (receptacleatlocation handtowelholder_5 location5) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle toiletpaperroll_1 toiletpaperhanger_3) (inreceptacle bowl_2 fridge_7) (inreceptacle toiletpaper_3 toiletpaperhanger_3) (inreceptacle handtowel_4 handtowelholder_5) (inreceptacle plate_5 microwave_6) (objectatlocation toiletpaperroll_1 location3) (objectatlocation bowl_2 location3) (objectatlocation toiletpaper_3 location3) (objectatlocation handtowel_4 location5) (objectatlocation plate_5 location2) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o toiletpapertype) (receptacletype_0 ?r toiletpaperhangertype))))))
 (:metric minimize (total-cost))
)
