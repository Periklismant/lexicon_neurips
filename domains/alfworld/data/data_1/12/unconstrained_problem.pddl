(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   toiletpaperhangertype garbagecantype sofatype towelholdertype - receptacletype
   tomatotype laptoptype newspapertype soapbartype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   toiletpaperhanger_1 garbagecan_2 sofa_3 towelholder_4 sofa_5 microwave_6 fridge_7 - receptacle
   tomato_1 laptop_2 newspaper_3 soapbar_4 plate_5 - obj
 )
 (:init (receptacletype_0 toiletpaperhanger_1 toiletpaperhangertype) (receptacletype_0 garbagecan_2 garbagecantype) (receptacletype_0 sofa_3 sofatype) (receptacletype_0 towelholder_4 towelholdertype) (receptacletype_0 sofa_5 sofatype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 tomato_1 tomatotype) (objecttype_0 laptop_2 laptoptype) (objecttype_0 newspaper_3 newspapertype) (objecttype_0 soapbar_4 soapbartype) (objecttype_0 plate_5 platetype) (cancontain garbagecantype tomatotype) (cancontain garbagecantype newspapertype) (cancontain garbagecantype soapbartype) (cancontain sofatype laptoptype) (cancontain sofatype newspapertype) (cancontain microwavetype tomatotype) (cancontain microwavetype platetype) (cancontain fridgetype tomatotype) (cancontain fridgetype platetype) (pickupable tomato_1) (cleanable tomato_1) (heatable tomato_1) (coolable tomato_1) (sliceable tomato_1) (pickupable laptop_2) (pickupable newspaper_3) (pickupable soapbar_4) (cleanable soapbar_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation toiletpaperhanger_1 location1) (receptacleatlocation garbagecan_2 location5) (receptacleatlocation sofa_3 location2) (receptacleatlocation towelholder_4 location4) (receptacleatlocation sofa_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location3) (inreceptacle tomato_1 garbagecan_2) (inreceptacle laptop_2 sofa_5) (inreceptacle newspaper_3 garbagecan_2) (inreceptacle soapbar_4 garbagecan_2) (inreceptacle plate_5 microwave_6) (objectatlocation tomato_1 location5) (objectatlocation laptop_2 location3) (objectatlocation newspaper_3 location5) (objectatlocation soapbar_4 location5) (objectatlocation plate_5 location2) (atlocation agent1 location4) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o tomatotype) (receptacletype_0 ?r garbagecantype))))))
 (:metric minimize (total-cost))
)
