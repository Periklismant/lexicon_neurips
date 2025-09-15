(define (problem liftedtcore_alfred-problem)
 (:domain liftedtcore_alfred-domain)
 (:objects
   diningtabletype laundryhampertype toastertype - receptacletype
   tennisrackettype candletype bowltype - objecttype
   location1 location2 location3 - location
   diningtable_1 laundryhamper_2 toaster_3 microwave_4 - receptacle
   bowl_3 - obj
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 toaster_3 toastertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 tennisracket_1 tennisrackettype) (objecttype_0 candle_2 candletype) (objecttype_0 bowl_3 bowltype) (cancontain diningtabletype tennisrackettype) (cancontain diningtabletype candletype) (cancontain diningtabletype bowltype) (cancontain microwavetype bowltype) (cancontain fridgetype bowltype) (pickupable tennisracket_1) (pickupable candle_2) (pickupable bowl_3) (isreceptacleobject bowl_3) (cleanable bowl_3) (coolable bowl_3) (receptacleatlocation diningtable_1 location2) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation toaster_3 location2) (receptacleatlocation microwave_4 location3) (receptacleatlocation fridge_5 location2) (inreceptacle tennisracket_1 diningtable_1) (inreceptacle candle_2 diningtable_1) (inreceptacle bowl_3 fridge_5) (objectatlocation tennisracket_1 location2) (objectatlocation candle_2 location2) (objectatlocation bowl_3 location2) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r_0 - receptacle)
 (exists (?o_0 - obj)
 (and (inreceptacle ?o_0 ?r_0) (objecttype_0 ?o_0 tennisrackettype) (receptacletype_0 ?r_0 diningtabletype)))) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
