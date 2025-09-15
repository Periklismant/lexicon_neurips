(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   dressertype towelholdertype stoveburnertype bathtubbasintype - receptacletype
   glassbottletype basketballtype wateringcantype breadtype pantype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   dresser_1 towelholder_2 stoveburner_3 bathtubbasin_4 bathtubbasin_5 microwave_6 fridge_7 - receptacle
   glassbottle_1 basketball_2 wateringcan_3 bread_4 pan_5 - obj
 )
 (:init (receptacletype_0 dresser_1 dressertype) (receptacletype_0 towelholder_2 towelholdertype) (receptacletype_0 stoveburner_3 stoveburnertype) (receptacletype_0 bathtubbasin_4 bathtubbasintype) (receptacletype_0 bathtubbasin_5 bathtubbasintype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 glassbottle_1 glassbottletype) (objecttype_0 basketball_2 basketballtype) (objecttype_0 wateringcan_3 wateringcantype) (objecttype_0 bread_4 breadtype) (objecttype_0 pan_5 pantype) (cancontain dressertype glassbottletype) (cancontain dressertype basketballtype) (cancontain dressertype wateringcantype) (cancontain stoveburnertype pantype) (cancontain microwavetype glassbottletype) (cancontain microwavetype breadtype) (cancontain fridgetype glassbottletype) (cancontain fridgetype breadtype) (cancontain fridgetype pantype) (pickupable glassbottle_1) (pickupable basketball_2) (pickupable wateringcan_3) (pickupable bread_4) (heatable bread_4) (coolable bread_4) (sliceable bread_4) (pickupable pan_5) (isreceptacleobject pan_5) (cleanable pan_5) (coolable pan_5) (receptacleatlocation dresser_1 location5) (receptacleatlocation towelholder_2 location5) (receptacleatlocation stoveburner_3 location1) (receptacleatlocation bathtubbasin_4 location1) (receptacleatlocation bathtubbasin_5 location1) (receptacleatlocation microwave_6 location3) (receptacleatlocation fridge_7 location3) (inreceptacle glassbottle_1 fridge_7) (inreceptacle basketball_2 dresser_1) (inreceptacle wateringcan_3 dresser_1) (inreceptacle bread_4 microwave_6) (inreceptacle pan_5 stoveburner_3) (objectatlocation glassbottle_1 location3) (objectatlocation basketball_2 location5) (objectatlocation wateringcan_3 location5) (objectatlocation bread_4 location3) (objectatlocation pan_5 location1) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o breadtype) (receptacletype_0 ?r fridgetype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
