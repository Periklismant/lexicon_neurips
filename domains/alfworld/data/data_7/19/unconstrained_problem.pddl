(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   cabinettype tvstandtype stoveburnertype sidetabletype - receptacletype
   soapbottletype peppershakertype pantype basketballtype cuptype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   cabinet_1 tvstand_2 stoveburner_3 sidetable_4 microwave_5 microwave_6 fridge_7 - receptacle
   soapbottle_1 peppershaker_2 pan_3 basketball_4 cup_5 - obj
 )
 (:init (receptacletype_0 cabinet_1 cabinettype) (receptacletype_0 tvstand_2 tvstandtype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 sidetable_4 sidetabletype) (receptacletype_0 microwave_5 microwavetype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 soapbottle_1 soapbottletype) (objecttype_0 peppershaker_2 peppershakertype) (objecttype_0 pan_3 pantype) (objecttype_0 basketball_4 basketballtype) (objecttype_0 cup_5 cuptype) (cancontain cabinettype soapbottletype) (cancontain cabinettype peppershakertype) (cancontain cabinettype pantype) (cancontain cabinettype cuptype) (cancontain stoveburnertype pantype) (cancontain sidetabletype soapbottletype) (cancontain sidetabletype peppershakertype) (cancontain sidetabletype pantype) (cancontain sidetabletype basketballtype) (cancontain sidetabletype cuptype) (cancontain microwavetype cuptype) (cancontain fridgetype pantype) (cancontain fridgetype cuptype) (pickupable soapbottle_1) (pickupable peppershaker_2) (pickupable pan_3) (isreceptacleobject pan_3) (cleanable pan_3) (coolable pan_3) (pickupable basketball_4) (pickupable cup_5) (isreceptacleobject cup_5) (cleanable cup_5) (heatable cup_5) (coolable cup_5) (receptacleatlocation cabinet_1 location3) (receptacleatlocation tvstand_2 location4) (receptacleatlocation stoveburner_3 location5) (receptacleatlocation sidetable_4 location1) (receptacleatlocation microwave_5 location4) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle soapbottle_1 sidetable_4) (inreceptacle peppershaker_2 cabinet_1) (inreceptacle pan_3 stoveburner_3) (inreceptacle basketball_4 sidetable_4) (inreceptacle cup_5 cabinet_1) (objectatlocation soapbottle_1 location1) (objectatlocation peppershaker_2 location3) (objectatlocation pan_3 location5) (objectatlocation basketball_4 location1) (objectatlocation cup_5 location3) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o cuptype) (receptacletype_0 ?r cabinettype))))))
 (:metric minimize (total-cost))
)
