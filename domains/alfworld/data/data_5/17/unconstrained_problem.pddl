(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   coffeemachinetype stoveburnertype coffeetabletype - receptacletype
   saltshakertype pantype alarmclocktype clothtype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   sinkbasin_1 microwave_2 coffeemachine_3 stoveburner_4 coffeetable_5 microwave_6 fridge_7 - receptacle
   saltshaker_1 pan_2 alarmclock_3 cloth_4 bowl_5 - obj
 )
 (:init (receptacletype_0 sinkbasin_1 sinkbasintype) (receptacletype_0 microwave_2 microwavetype) (receptacletype_0 coffeemachine_3 coffeemachinetype) (receptacletype_0 stoveburner_4 stoveburnertype) (receptacletype_0 coffeetable_5 coffeetabletype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 saltshaker_1 saltshakertype) (objecttype_0 pan_2 pantype) (objecttype_0 alarmclock_3 alarmclocktype) (objecttype_0 cloth_4 clothtype) (objecttype_0 bowl_5 bowltype) (cancontain sinkbasintype pantype) (cancontain sinkbasintype clothtype) (cancontain sinkbasintype bowltype) (cancontain microwavetype bowltype) (cancontain stoveburnertype pantype) (cancontain coffeetabletype saltshakertype) (cancontain coffeetabletype pantype) (cancontain coffeetabletype alarmclocktype) (cancontain coffeetabletype clothtype) (cancontain coffeetabletype bowltype) (cancontain fridgetype pantype) (cancontain fridgetype bowltype) (pickupable saltshaker_1) (pickupable pan_2) (isreceptacleobject pan_2) (cleanable pan_2) (coolable pan_2) (pickupable alarmclock_3) (pickupable cloth_4) (cleanable cloth_4) (pickupable bowl_5) (isreceptacleobject bowl_5) (cleanable bowl_5) (coolable bowl_5) (receptacleatlocation sinkbasin_1 location4) (receptacleatlocation microwave_2 location5) (receptacleatlocation coffeemachine_3 location1) (receptacleatlocation stoveburner_4 location1) (receptacleatlocation coffeetable_5 location3) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location2) (inreceptacle saltshaker_1 coffeetable_5) (inreceptacle pan_2 sinkbasin_1) (inreceptacle alarmclock_3 coffeetable_5) (inreceptacle cloth_4 coffeetable_5) (inreceptacle bowl_5 fridge_7) (objectatlocation saltshaker_1 location3) (objectatlocation pan_2 location4) (objectatlocation alarmclock_3 location3) (objectatlocation cloth_4 location3) (objectatlocation bowl_5 location2) (atlocation agent1 location2) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (coolable ?o) (objecttype_0 ?o bowltype) (receptacletype_0 ?r coffeetabletype) (iscool ?o) (inreceptacle ?o ?r))))))
 (:metric minimize (total-cost))
)
