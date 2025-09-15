(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   countertoptype diningtabletype bathtubbasintype - receptacletype
   remotecontroltype toiletpapertype spoontype toiletpaperrolltype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   countertop_1 microwave_2 countertop_3 diningtable_4 bathtubbasin_5 microwave_6 fridge_7 - receptacle
   remotecontrol_1 toiletpaper_2 spoon_3 toiletpaperroll_4 cup_5 - obj
 )
 (:init (receptacletype_0 countertop_1 countertoptype) (receptacletype_0 microwave_2 microwavetype) (receptacletype_0 countertop_3 countertoptype) (receptacletype_0 diningtable_4 diningtabletype) (receptacletype_0 bathtubbasin_5 bathtubbasintype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 remotecontrol_1 remotecontroltype) (objecttype_0 toiletpaper_2 toiletpapertype) (objecttype_0 spoon_3 spoontype) (objecttype_0 toiletpaperroll_4 toiletpaperrolltype) (objecttype_0 cup_5 cuptype) (cancontain countertoptype remotecontroltype) (cancontain countertoptype toiletpapertype) (cancontain countertoptype spoontype) (cancontain countertoptype toiletpaperrolltype) (cancontain countertoptype cuptype) (cancontain microwavetype cuptype) (cancontain diningtabletype remotecontroltype) (cancontain diningtabletype toiletpapertype) (cancontain diningtabletype spoontype) (cancontain diningtabletype toiletpaperrolltype) (cancontain diningtabletype cuptype) (cancontain fridgetype cuptype) (pickupable remotecontrol_1) (pickupable toiletpaper_2) (pickupable spoon_3) (cleanable spoon_3) (pickupable toiletpaperroll_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation countertop_1 location5) (receptacleatlocation microwave_2 location5) (receptacleatlocation countertop_3 location5) (receptacleatlocation diningtable_4 location4) (receptacleatlocation bathtubbasin_5 location4) (receptacleatlocation microwave_6 location4) (receptacleatlocation fridge_7 location1) (inreceptacle remotecontrol_1 countertop_3) (inreceptacle toiletpaper_2 countertop_1) (inreceptacle spoon_3 countertop_3) (inreceptacle toiletpaperroll_4 diningtable_4) (inreceptacle cup_5 countertop_3) (objectatlocation remotecontrol_1 location5) (objectatlocation toiletpaper_2 location5) (objectatlocation spoon_3 location5) (objectatlocation toiletpaperroll_4 location4) (objectatlocation cup_5 location5) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o spoontype) (receptacletype_0 ?r diningtabletype))))))
 (:metric minimize (total-cost))
)
