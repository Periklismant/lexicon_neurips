(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   handtowelholdertype toiletpaperhangertype coffeetabletype tvstandtype sofatype - receptacletype
   alarmclocktype watchtype soapbartype bowltype mugtype - objecttype
   agent1 - agent
   location1 location2 location3 location4 location5 - location
   handtowelholder_1 toiletpaperhanger_2 coffeetable_3 tvstand_4 sofa_5 microwave_6 fridge_7 - receptacle
   alarmclock_1 watch_2 soapbar_3 bowl_4 mug_5 - obj
 )
 (:init (receptacletype_0 handtowelholder_1 handtowelholdertype) (receptacletype_0 toiletpaperhanger_2 toiletpaperhangertype) (receptacletype_0 coffeetable_3 coffeetabletype) (receptacletype_0 tvstand_4 tvstandtype) (receptacletype_0 sofa_5 sofatype) (receptacletype_0 microwave_6 microwavetype) (receptacletype_0 fridge_7 fridgetype) (objecttype_0 alarmclock_1 alarmclocktype) (objecttype_0 watch_2 watchtype) (objecttype_0 soapbar_3 soapbartype) (objecttype_0 bowl_4 bowltype) (objecttype_0 mug_5 mugtype) (cancontain coffeetabletype alarmclocktype) (cancontain coffeetabletype watchtype) (cancontain coffeetabletype soapbartype) (cancontain coffeetabletype bowltype) (cancontain coffeetabletype mugtype) (cancontain microwavetype bowltype) (cancontain microwavetype mugtype) (cancontain fridgetype bowltype) (cancontain fridgetype mugtype) (pickupable alarmclock_1) (pickupable watch_2) (pickupable soapbar_3) (cleanable soapbar_3) (pickupable bowl_4) (isreceptacleobject bowl_4) (cleanable bowl_4) (coolable bowl_4) (pickupable mug_5) (isreceptacleobject mug_5) (cleanable mug_5) (heatable mug_5) (coolable mug_5) (receptacleatlocation handtowelholder_1 location4) (receptacleatlocation toiletpaperhanger_2 location4) (receptacleatlocation coffeetable_3 location2) (receptacleatlocation tvstand_4 location5) (receptacleatlocation sofa_5 location4) (receptacleatlocation microwave_6 location2) (receptacleatlocation fridge_7 location1) (inreceptacle alarmclock_1 coffeetable_3) (inreceptacle watch_2 coffeetable_3) (inreceptacle soapbar_3 coffeetable_3) (inreceptacle bowl_4 coffeetable_3) (inreceptacle mug_5 fridge_7) (objectatlocation alarmclock_1 location2) (objectatlocation watch_2 location2) (objectatlocation soapbar_3 location2) (objectatlocation bowl_4 location2) (objectatlocation mug_5 location1) (atlocation agent1 location1) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o alarmclocktype) (receptacletype_0 ?r coffeetabletype))))))
 (:metric minimize (total-cost))
)
