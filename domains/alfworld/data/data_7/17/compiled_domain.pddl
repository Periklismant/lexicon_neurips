(define (domain liftedtcore_alfred-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :action-costs)
 (:types
    receptacletype objecttype checkable - object
    agent location receptacle obj - checkable
 )
 (:constants
   location1 location2 location3 location4 location5 - location
   microwave_6 - receptacle
   agent1 - agent
   tissuebox_2 box_5 ladle_4 dishsponge_3 soapbottle_1 - obj
   sinkbasintype fridgetype microwavetype - receptacletype
   butterknifetype knifetype - objecttype
 )
 (:predicates (atlocation ?a - agent ?l - location) (receptacleatlocation ?r - receptacle ?l - location) (objectatlocation ?o - obj ?l - location) (openable ?r - receptacle) (opened ?r - receptacle) (inreceptacle ?o - obj ?r - receptacle) (isreceptacleobject ?o - obj) (inreceptacleobject ?innerobject - obj ?outobject - obj) (isreceptacleobjectfull ?o - obj) (wasinreceptacle ?o - obj ?r - receptacle) (checked ?c - checkable) (examined ?l - location) (receptacletype_0 ?r - receptacle ?rt - receptacletype) (cancontain ?rt - receptacletype ?ot - objecttype) (objecttype_0 ?o - obj ?t - objecttype) (holds ?a - agent ?o - obj) (holdsany ?a - agent) (holdsanyreceptacleobject ?a - agent) (full ?r - receptacle) (isclean ?o - obj) (cleanable ?o - obj) (ishot ?o - obj) (heatable ?o - obj) (iscool ?o - obj) (coolable ?o - obj) (pickupable ?o - obj) (moveable ?o - obj) (toggleable ?o - obj) (ison ?o - obj) (istoggled ?o - obj) (sliceable ?o - obj) (issliced ?o - obj) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (seen_psi_5) (hold_6) (hold_7) (hold_8) (hold_9))
 (:functions (total-cost))
 (:action look
  :parameters ( ?a - agent ?l - location)
  :precondition (and (atlocation ?a ?l))
  :effect (and (checked ?l) (when (or (= ?l location5) (checked location5)) (hold_6)) (increase (total-cost) 1)))
 (:action inventory
  :parameters ( ?a - agent)
  :effect (and (checked ?a) (increase (total-cost) 1)))
 (:action examinereceptacle
  :parameters ( ?a - agent ?r - receptacle)
  :precondition (and (exists (?l_0 - location)
 (and (atlocation ?a ?l_0) (receptacleatlocation ?r ?l_0))))
  :effect (and (checked ?r) (when (or (= ?r microwave_6) (checked microwave_6)) (seen_psi_3)) (increase (total-cost) 1)))
 (:action examineobject
  :parameters ( ?a - agent ?o - obj)
  :precondition (and (or (exists (?l_0 - location)
 (exists (?r_0 - receptacle)
 (and (atlocation ?a ?l_0) (receptacleatlocation ?r_0 ?l_0) (inreceptacle ?o ?r_0) (or (not (openable ?r_0)) (opened ?r_0))))) (holds ?a ?o)))
  :effect (and (checked ?o) (when (and (atlocation agent1 location1) (not (or (= ?o dishsponge_3) (checked dishsponge_3)))) (not (hold_1))) (when (or (= ?o dishsponge_3) (checked dishsponge_3)) (hold_1)) (when (or (= ?o ladle_4) (checked ladle_4) (atlocation agent1 location3)) (hold_7)) (when (or (= ?o tissuebox_2) (checked tissuebox_2) (objectatlocation box_5 location2)) (hold_9)) (increase (total-cost) 1)))
 (:action gotolocation
  :parameters ( ?a - agent ?lstart - location ?lend - location)
  :precondition (and (atlocation ?a ?lstart))
  :effect (and (not (atlocation ?a ?lstart)) (atlocation ?a ?lend) (when (or (and (= ?a agent1) (= ?lend location1)) (and (atlocation agent1 location1) (not (and (= ?a agent1) (= ?lstart location1))))) (hold_0)) (when (and (or (and (= ?a agent1) (= ?lend location1)) (and (atlocation agent1 location1) (not (and (= ?a agent1) (= ?lstart location1))))) (not (checked dishsponge_3))) (not (hold_1))) (when (or (checked ladle_4) (and (= ?a agent1) (= ?lend location3)) (and (atlocation agent1 location3) (not (and (= ?a agent1) (= ?lstart location3))))) (hold_7)) (when (or (and (= ?a agent1) (= ?lend location3)) (and (atlocation agent1 location3) (not (and (= ?a agent1) (= ?lstart location3)))) (holds agent1 box_5)) (hold_8)) (increase (total-cost) 1)))
 (:action openobject
  :parameters ( ?a - agent ?l - location ?r - receptacle)
  :precondition (and (openable ?r) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (not (opened ?r)))
  :effect (and (opened ?r) (checked ?r) (when (or (= ?r microwave_6) (checked microwave_6)) (seen_psi_3)) (increase (total-cost) 1)))
 (:action closeobject
  :parameters ( ?a - agent ?l - location ?r - receptacle)
  :precondition (and (openable ?r) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (opened ?r))
  :effect (and (not (opened ?r)) (increase (total-cost) 1)))
 (:action pickupobject
  :parameters ( ?a - agent ?l - location ?o - obj ?r - receptacle)
  :precondition (and (pickupable ?o) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (inreceptacle ?o ?r) (not (holdsany ?a)) (or (not (openable ?r)) (opened ?r)) (or (not (or (and (= ?a agent1) (= ?o soapbottle_1)) (holds agent1 soapbottle_1))) (seen_psi_3)) (or (not (and (objectatlocation soapbottle_1 location4) (not (and (= ?o soapbottle_1) (= ?l location4))))) (seen_psi_5)))
  :effect (and (not (inreceptacle ?o ?r)) (holds ?a ?o) (holdsany ?a) (not (objectatlocation ?o ?l)) (when (or (and (= ?a agent1) (= ?o soapbottle_1)) (holds agent1 soapbottle_1)) (hold_2)) (when (and (objectatlocation soapbottle_1 location4) (not (and (= ?o soapbottle_1) (= ?l location4)))) (hold_4)) (when (or (and (objectatlocation dishsponge_3 location3) (not (and (= ?o dishsponge_3) (= ?l location3)))) (and (= ?a agent1) (= ?o dishsponge_3)) (holds agent1 dishsponge_3)) (seen_psi_5)) (when (or (atlocation agent1 location3) (and (= ?a agent1) (= ?o box_5)) (holds agent1 box_5)) (hold_8)) (when (or (checked tissuebox_2) (and (objectatlocation box_5 location2) (not (and (= ?o box_5) (= ?l location2))))) (hold_9)) (increase (total-cost) 1)))
 (:action putobject
  :parameters ( ?a - agent ?l - location ?o - obj ?r - receptacle ?ot - objecttype ?rt - receptacletype)
  :precondition (and (holds ?a ?o) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (or (not (openable ?r)) (opened ?r)) (objecttype_0 ?o ?ot) (receptacletype_0 ?r ?rt) (cancontain ?rt ?ot) (or (not (and (holds agent1 soapbottle_1) (not (and (= ?a agent1) (= ?o soapbottle_1))))) (seen_psi_3)) (or (not (or (and (= ?o soapbottle_1) (= ?l location4)) (objectatlocation soapbottle_1 location4))) (seen_psi_5)))
  :effect (and (inreceptacle ?o ?r) (objectatlocation ?o ?l) (not (holds ?a ?o)) (not (holdsany ?a)) (when (and (holds agent1 soapbottle_1) (not (and (= ?a agent1) (= ?o soapbottle_1)))) (hold_2)) (when (or (and (= ?o soapbottle_1) (= ?l location4)) (objectatlocation soapbottle_1 location4)) (hold_4)) (when (or (and (= ?o dishsponge_3) (= ?l location3)) (objectatlocation dishsponge_3 location3) (and (holds agent1 dishsponge_3) (not (and (= ?a agent1) (= ?o dishsponge_3))))) (seen_psi_5)) (when (or (atlocation agent1 location3) (and (holds agent1 box_5) (not (and (= ?a agent1) (= ?o box_5))))) (hold_8)) (when (or (checked tissuebox_2) (and (= ?o box_5) (= ?l location2)) (objectatlocation box_5 location2)) (hold_9)) (increase (total-cost) 1)))
 (:action cleanobject
  :parameters ( ?a - agent ?l - location ?r - receptacle ?o - obj)
  :precondition (and (cleanable ?o) (receptacletype_0 ?r sinkbasintype) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (holds ?a ?o))
  :effect (and (isclean ?o) (increase (total-cost) 1)))
 (:action heatobject
  :parameters ( ?a - agent ?l - location ?r - receptacle ?o - obj)
  :precondition (and (heatable ?o) (receptacletype_0 ?r microwavetype) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (holds ?a ?o))
  :effect (and (ishot ?o) (not (iscool ?o)) (increase (total-cost) 1)))
 (:action coolobject
  :parameters ( ?a - agent ?l - location ?r - receptacle ?o - obj)
  :precondition (and (coolable ?o) (receptacletype_0 ?r fridgetype) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (holds ?a ?o))
  :effect (and (iscool ?o) (not (ishot ?o)) (increase (total-cost) 1)))
 (:action toggleobject
  :parameters ( ?a - agent ?l - location ?o - obj ?r - receptacle)
  :precondition (and (toggleable ?o) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (inreceptacle ?o ?r))
  :effect (and (when (ison ?o) (not (ison ?o))) (when (not (ison ?o)) (ison ?o)) (istoggled ?o) (increase (total-cost) 1)))
 (:action sliceobject
  :parameters ( ?a - agent ?l - location ?co - obj ?ko - obj)
  :precondition (and (sliceable ?co) (or (objecttype_0 ?ko knifetype) (objecttype_0 ?ko butterknifetype)) (atlocation ?a ?l) (objectatlocation ?co ?l) (holds ?a ?ko))
  :effect (and (issliced ?co) (increase (total-cost) 1)))
 (:action help
  :parameters ( ?a - agent)
  :effect (and (checked ?a) (increase (total-cost) 1)))
)
