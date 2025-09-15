(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype bathtubbasintype towelholdertype laundryhampertype - receptacletype
   cuptype penciltype boxtype keychaintype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 bathtubbasin_2 towelholder_3 microwave_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   cup_1 pencil_2 box_3 keychain_4 plate_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 bathtubbasin_2 bathtubbasintype) (receptacletype_0 towelholder_3 towelholdertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 cup_1 cuptype) (objecttype_0 pencil_2 penciltype) (objecttype_0 box_3 boxtype) (objecttype_0 keychain_4 keychaintype) (objecttype_0 plate_5 platetype) (cancontain dressertype cuptype) (cancontain dressertype penciltype) (cancontain dressertype boxtype) (cancontain dressertype keychaintype) (cancontain dressertype platetype) (cancontain microwavetype cuptype) (cancontain microwavetype platetype) (cancontain fridgetype cuptype) (cancontain fridgetype platetype) (pickupable cup_1) (isreceptacleobject cup_1) (cleanable cup_1) (heatable cup_1) (coolable cup_1) (pickupable pencil_2) (pickupable box_3) (isreceptacleobject box_3) (pickupable keychain_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation dresser_1 location1) (receptacleatlocation bathtubbasin_2 location1) (receptacleatlocation towelholder_3 location3) (receptacleatlocation microwave_4 location5) (receptacleatlocation laundryhamper_5 location3) (receptacleatlocation microwave_6 location1) (receptacleatlocation fridge_7 location1) (inreceptacle cup_1 fridge_7) (inreceptacle pencil_2 dresser_1) (inreceptacle box_3 dresser_1) (inreceptacle keychain_4 dresser_1) (inreceptacle plate_5 microwave_4) (objectatlocation cup_1 location1) (objectatlocation pencil_2 location1) (objectatlocation box_3 location1) (objectatlocation keychain_4 location1) (objectatlocation plate_5 location5) (atlocation agent1 location5) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o platetype) (receptacletype_0 ?r microwavetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
