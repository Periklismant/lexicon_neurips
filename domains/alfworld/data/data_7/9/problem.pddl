(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   bathtubbasintype toiletpaperhangertype countertoptype stoveburnertype laundryhampertype - receptacletype
   ladletype baseballbattype newspapertype wateringcantype platetype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   bathtubbasin_1 toiletpaperhanger_2 countertop_3 stoveburner_4 laundryhamper_5 microwave_6 fridge_7 - receptacle
   ladle_1 baseballbat_2 newspaper_3 wateringcan_4 plate_5 - obj
 )
 (:init (receptacletype_0 bathtubbasin_1 bathtubbasintype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 countertop_3 countertoptype) (receptacletype_0 stoveburner_4 stoveburnertype) (receptacletype_0 laundryhamper_5 laundryhampertype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 ladle_1 ladletype) (objecttype_0 baseballbat_2 baseballbattype) (objecttype_0 newspaper_3 newspapertype) (objecttype_0 wateringcan_4 wateringcantype) (objecttype_0 plate_5 platetype) (cancontain countertoptype ladletype) (cancontain countertoptype baseballbattype) (cancontain countertoptype newspapertype) (cancontain countertoptype wateringcantype) (cancontain countertoptype platetype) (cancontain microwavetype platetype) (cancontain fridgetype platetype) (pickupable ladle_1) (cleanable ladle_1) (pickupable baseballbat_2) (pickupable newspaper_3) (pickupable wateringcan_4) (pickupable plate_5) (isreceptacleobject plate_5) (cleanable plate_5) (heatable plate_5) (coolable plate_5) (receptacleatlocation bathtubbasin_1 location3) (receptacleatlocation toiletpaperhanger_2 location2) (receptacleatlocation countertop_3 location4) (receptacleatlocation stoveburner_4 location2) (receptacleatlocation laundryhamper_5 location2) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle ladle_1 countertop_3) (inreceptacle baseballbat_2 countertop_3) (inreceptacle newspaper_3 countertop_3) (inreceptacle wateringcan_4 countertop_3) (inreceptacle plate_5 countertop_3) (objectatlocation ladle_1 location4) (objectatlocation baseballbat_2 location4) (objectatlocation newspaper_3 location4) (objectatlocation wateringcan_4 location4) (objectatlocation plate_5 location4) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (heatable ?o_0) (objecttype_0 ?o_0 platetype) (receptacletype_0 ?r_0 countertoptype) (ishot ?o_0) (inreceptacle ?o_0 ?r_0))))))
 (:constraints (sometime (holds agent1 newspaper_3)) (sometime (or (holds agent1 baseballbat_2) (checked toiletpaperhanger_2))) (sometime (holds agent1 wateringcan_4)) (sometime (holds agent1 plate_5)) (sometime-before (holds agent1 plate_5) (or (atlocation agent1 location5) (holds agent1 newspaper_3))) (sometime (objectatlocation plate_5 location1)) (sometime (checked ladle_1)) (sometime (atlocation agent1 location2)) (sometime-after (atlocation agent1 location2) (holds agent1 newspaper_3)))
 (:metric minimize (total-cost))
)
