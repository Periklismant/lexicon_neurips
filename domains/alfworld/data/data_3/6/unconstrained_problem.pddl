(define (problem alfred-problem)
 (:domain alfred-domain)
 (:objects
   diningtabletype laundryhampertype toastertype - receptacletype
   tennisrackettype candletype bowltype - objecttype
   agent1 - agent
   location1 location2 location3 - location
   diningtable_1 laundryhamper_2 toaster_3 microwave_4 fridge_5 - receptacle
   tennisracket_1 candle_2 bowl_3 - obj
 )
 (:init (receptacletype_0 diningtable_1 diningtabletype) (receptacletype_0 laundryhamper_2 laundryhampertype) (receptacletype_0 toaster_3 toastertype) (receptacletype_0 microwave_4 microwavetype) (receptacletype_0 fridge_5 fridgetype) (objecttype_0 tennisracket_1 tennisrackettype) (objecttype_0 candle_2 candletype) (objecttype_0 bowl_3 bowltype) (cancontain diningtabletype tennisrackettype) (cancontain diningtabletype candletype) (cancontain diningtabletype bowltype) (cancontain microwavetype bowltype) (cancontain fridgetype bowltype) (pickupable tennisracket_1) (pickupable candle_2) (pickupable bowl_3) (isreceptacleobject bowl_3) (cleanable bowl_3) (coolable bowl_3) (receptacleatlocation diningtable_1 location2) (receptacleatlocation laundryhamper_2 location1) (receptacleatlocation toaster_3 location2) (receptacleatlocation microwave_4 location3) (receptacleatlocation fridge_5 location2) (inreceptacle tennisracket_1 diningtable_1) (inreceptacle candle_2 diningtable_1) (inreceptacle bowl_3 fridge_5) (objectatlocation tennisracket_1 location2) (objectatlocation candle_2 location2) (objectatlocation bowl_3 location2) (atlocation agent1 location3) (= (total-cost) 0))
 (:goal (and (exists (?r - receptacle)
 (exists (?o - obj)
 (and (inreceptacle ?o ?r) (objecttype_0 ?o tennisrackettype) (receptacletype_0 ?r diningtabletype))))))
 (:metric minimize (total-cost))
)
