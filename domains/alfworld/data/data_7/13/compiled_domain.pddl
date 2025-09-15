(define (domain liftedtcore_alfred-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :action-costs)
 (:types
    receptacletype objecttype checkable - object
    agent location receptacle obj - checkable
 )
 (:constants
   coffeemachine_3 - receptacle
   agent1 - agent
   pillow_3 apple_2 bowl_5 soapbottle_4 pencil_1 - obj
   location1 location2 location4 location3 - location
   sinkbasintype fridgetype microwavetype - receptacletype
   butterknifetype knifetype - objecttype
 )
 (:predicates (atlocation ?a - agent ?l - location) (receptacleatlocation ?r - receptacle ?l - location) (objectatlocation ?o - obj ?l - location) (openable ?r - receptacle) (opened ?r - receptacle) (inreceptacle ?o - obj ?r - receptacle) (isreceptacleobject ?o - obj) (inreceptacleobject ?innerobject - obj ?outobject - obj) (isreceptacleobjectfull ?o - obj) (wasinreceptacle ?o - obj ?r - receptacle) (checked ?c - checkable) (examined ?l - location) (receptacletype_0 ?r - receptacle ?rt - receptacletype) (cancontain ?rt - receptacletype ?ot - objecttype) (objecttype_0 ?o - obj ?t - objecttype) (holds ?a - agent ?o - obj) (holdsany ?a - agent) (holdsanyreceptacleobject ?a - agent) (full ?r - receptacle) (isclean ?o - obj) (cleanable ?o - obj) (ishot ?o - obj) (heatable ?o - obj) (iscool ?o - obj) (coolable ?o - obj) (pickupable ?o - obj) (moveable ?o - obj) (toggleable ?o - obj) (ison ?o - obj) (istoggled ?o - obj) (sliceable ?o - obj) (issliced ?o - obj) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8))
 (:functions (total-cost))
 (:action look
  :parameters ( ?a - agent ?l - location)
  :precondition (and (atlocation ?a ?l))
  :effect (and (checked ?l) (increase (total-cost) 1)))
 (:action inventory
  :parameters ( ?a - agent)
  :effect (and (checked ?a) (increase (total-cost) 1)))
 (:action examinereceptacle
  :parameters ( ?a - agent ?r - receptacle)
  :precondition (and (exists (?l_0 - location)
 (and (atlocation ?a ?l_0) (receptacleatlocation ?r ?l_0))))
  :effect (and (checked ?r) (when (or (= ?r coffeemachine_3) (checked coffeemachine_3)) (hold_6)) (increase (total-cost) 1)))
 (:action examineobject
  :parameters ( ?a - agent ?o - obj)
  :precondition (and (or (exists (?l_0 - location)
 (exists (?r_0 - receptacle)
 (and (atlocation ?a ?l_0) (receptacleatlocation ?r_0 ?l_0) (inreceptacle ?o ?r_0) (or (not (openable ?r_0)) (opened ?r_0))))) (holds ?a ?o)))
  :effect (and (checked ?o) (when (and (holds agent1 bowl_5) (not (or (= ?o bowl_5) (checked bowl_5)))) (not (hold_1))) (when (or (= ?o bowl_5) (checked bowl_5)) (hold_1)) (when (or (= ?o soapbottle_4) (checked soapbottle_4)) (hold_7)) (when (or (= ?o pillow_3) (checked pillow_3)) (hold_8)) (increase (total-cost) 1)))
 (:action gotolocation
  :parameters ( ?a - agent ?lstart - location ?lend - location)
  :precondition (and (atlocation ?a ?lstart) (or (not (or (and (= ?a agent1) (= ?lend location2)) (and (atlocation agent1 location2) (not (and (= ?a agent1) (= ?lstart location2)))))) (seen_psi_3)))
  :effect (and (not (atlocation ?a ?lstart)) (atlocation ?a ?lend) (when (or (and (= ?a agent1) (= ?lend location2)) (and (atlocation agent1 location2) (not (and (= ?a agent1) (= ?lstart location2))))) (hold_2)) (when (or (and (= ?a agent1) (= ?lend location1)) (and (atlocation agent1 location1) (not (and (= ?a agent1) (= ?lstart location1)))) (objectatlocation pencil_1 location4)) (seen_psi_3)) (increase (total-cost) 1)))
 (:action openobject
  :parameters ( ?a - agent ?l - location ?r - receptacle)
  :precondition (and (openable ?r) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (not (opened ?r)))
  :effect (and (opened ?r) (checked ?r) (when (or (= ?r coffeemachine_3) (checked coffeemachine_3)) (hold_6)) (increase (total-cost) 1)))
 (:action closeobject
  :parameters ( ?a - agent ?l - location ?r - receptacle)
  :precondition (and (openable ?r) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (opened ?r))
  :effect (and (not (opened ?r)) (increase (total-cost) 1)))
 (:action pickupobject
  :parameters ( ?a - agent ?l - location ?o - obj ?r - receptacle)
  :precondition (and (pickupable ?o) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (inreceptacle ?o ?r) (not (holdsany ?a)) (or (not (openable ?r)) (opened ?r)))
  :effect (and (not (inreceptacle ?o ?r)) (holds ?a ?o) (holdsany ?a) (not (objectatlocation ?o ?l)) (when (or (and (= ?a agent1) (= ?o bowl_5)) (holds agent1 bowl_5)) (hold_0)) (when (and (or (and (= ?a agent1) (= ?o bowl_5)) (holds agent1 bowl_5)) (not (checked bowl_5))) (not (hold_1))) (when (or (atlocation agent1 location1) (and (objectatlocation pencil_1 location4) (not (and (= ?o pencil_1) (= ?l location4))))) (seen_psi_3)) (when (or (and (= ?a agent1) (= ?o pillow_3)) (holds agent1 pillow_3) (and (= ?a agent1) (= ?o pencil_1)) (holds agent1 pencil_1)) (hold_4)) (when (or (and (objectatlocation apple_2 location3) (not (and (= ?o apple_2) (= ?l location3)))) (and (objectatlocation apple_2 location2) (not (and (= ?o apple_2) (= ?l location2))))) (hold_5)) (increase (total-cost) 1)))
 (:action putobject
  :parameters ( ?a - agent ?l - location ?o - obj ?r - receptacle ?ot - objecttype ?rt - receptacletype)
  :precondition (and (holds ?a ?o) (atlocation ?a ?l) (receptacleatlocation ?r ?l) (or (not (openable ?r)) (opened ?r)) (objecttype_0 ?o ?ot) (receptacletype_0 ?r ?rt) (cancontain ?rt ?ot))
  :effect (and (inreceptacle ?o ?r) (objectatlocation ?o ?l) (not (holds ?a ?o)) (not (holdsany ?a)) (when (and (holds agent1 bowl_5) (not (and (= ?a agent1) (= ?o bowl_5)))) (hold_0)) (when (and (holds agent1 bowl_5) (not (and (= ?a agent1) (= ?o bowl_5))) (not (checked bowl_5))) (not (hold_1))) (when (or (atlocation agent1 location1) (and (= ?o pencil_1) (= ?l location4)) (objectatlocation pencil_1 location4)) (seen_psi_3)) (when (or (and (holds agent1 pillow_3) (not (and (= ?a agent1) (= ?o pillow_3)))) (and (holds agent1 pencil_1) (not (and (= ?a agent1) (= ?o pencil_1))))) (hold_4)) (when (or (and (= ?o apple_2) (= ?l location3)) (objectatlocation apple_2 location3) (and (= ?o apple_2) (= ?l location2)) (objectatlocation apple_2 location2)) (hold_5)) (increase (total-cost) 1)))
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
