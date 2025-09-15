(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   stoveburnertype toiletpaperhangertype - receptacletype
   pantype toiletpaperrolltype - objecttype
   location1 - location
   stoveburner_1 toiletpaperhanger_2 toiletpaperhanger_3 microwave_4 - receptacle
   pan_1 - obj
 )
 (:init (receptacletype_0 stoveburner_1 stoveburnertype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 toiletpaperhanger_3 toiletpaperhangertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 pan_1 pantype) (objecttype_0 toiletpaperroll_2 toiletpaperrolltype) (objecttype_0 pan_3 pantype) (cancontain stoveburnertype pantype) (cancontain toiletpaperhangertype toiletpaperrolltype) (cancontain fridgetype pantype) (pickupable pan_1) (isreceptacleobject pan_1) (cleanable pan_1) (coolable pan_1) (pickupable toiletpaperroll_2) (pickupable pan_3) (isreceptacleobject pan_3) (cleanable pan_3) (coolable pan_3) (receptacleatlocation stoveburner_1 location1) (receptacleatlocation toiletpaperhanger_2 location3) (receptacleatlocation toiletpaperhanger_3 location3) (receptacleatlocation microwave_4 location2) (receptacleatlocation fridge_5 location1) (inreceptacle pan_1 fridge_5) (inreceptacle toiletpaperroll_2 toiletpaperhanger_3) (inreceptacle pan_3 stoveburner_1) (objectatlocation pan_1 location1) (objectatlocation toiletpaperroll_2 location3) (objectatlocation pan_3 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 pantype) (receptacletype_0 ?r_0 fridgetype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
