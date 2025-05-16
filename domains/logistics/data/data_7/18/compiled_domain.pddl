(define (domain liftedtcore_logistics-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    obj location city - object
    airport - location
    package truck airplane - obj
 )
 (:constants
   p1 p2 - package
   l2_1 l1_1 - airport
   l1_5 l1_2 l2_4 l1_4 l1_3 - location
   t2 - truck
   a1 a2 - airplane
 )
 (:predicates (at_ ?obj - obj ?loc - location) (in ?obj1 - obj ?obj2 - obj) (incity ?obj_0 - location ?city - city) (hold_0) (hold_1) (seen_psi_2) (hold_3) (hold_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (hold_9))
 (:functions (total-cost))
 (:action loadtruck
  :parameters ( ?obj_1 - package ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (at_ ?obj_1 ?loc) (or (not (and (at_ p1 l1_1) (not (and (= ?obj_1 p1) (= ?loc l1_1))))) (seen_psi_2)) (or (not (and (at_ p2 l1_3) (not (and (= ?obj_1 p2) (= ?loc l1_3))))) (seen_psi_7)))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?truck) (when (or (and (= ?obj_1 p2) (= ?truck t2)) (in p2 t2)) (hold_0)) (when (and (at_ p1 l1_1) (not (and (= ?obj_1 p1) (= ?loc l1_1)))) (hold_1)) (when (and (at_ p2 l2_4) (not (and (= ?obj_1 p2) (= ?loc l2_4)))) (seen_psi_2)) (when (and (at_ p1 l1_4) (not (and (= ?obj_1 p1) (= ?loc l1_4)))) (hold_3)) (when (and (at_ p1 l1_4) (not (and (= ?obj_1 p1) (= ?loc l1_4))) (not (and (at_ p2 l2_1) (not (and (= ?obj_1 p2) (= ?loc l2_1)))))) (not (hold_4))) (when (and (at_ p2 l2_1) (not (and (= ?obj_1 p2) (= ?loc l2_1)))) (hold_4)) (when (or (and (= ?obj_1 p2) (= ?truck t2)) (in p2 t2) (and (at_ p2 l1_5) (not (and (= ?obj_1 p2) (= ?loc l1_5))))) (hold_5)) (when (and (at_ p2 l1_3) (not (and (= ?obj_1 p2) (= ?loc l1_3)))) (hold_6)) (when (or (and (at_ p2 l2_4) (not (and (= ?obj_1 p2) (= ?loc l2_4)))) (and (at_ p1 l1_2) (not (and (= ?obj_1 p1) (= ?loc l1_2))))) (seen_psi_7)) (increase (total-cost) 1)))
 (:action loadairplane
  :parameters ( ?obj_1 - package ?airplane - airplane ?loc - location)
  :precondition (and (at_ ?obj_1 ?loc) (at_ ?airplane ?loc) (or (not (and (at_ p1 l1_1) (not (and (= ?obj_1 p1) (= ?loc l1_1))))) (seen_psi_2)) (or (not (and (at_ p2 l1_3) (not (and (= ?obj_1 p2) (= ?loc l1_3))))) (seen_psi_7)))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?airplane) (when (and (at_ p1 l1_1) (not (and (= ?obj_1 p1) (= ?loc l1_1)))) (hold_1)) (when (and (at_ p2 l2_4) (not (and (= ?obj_1 p2) (= ?loc l2_4)))) (seen_psi_2)) (when (and (at_ p1 l1_4) (not (and (= ?obj_1 p1) (= ?loc l1_4)))) (hold_3)) (when (and (at_ p1 l1_4) (not (and (= ?obj_1 p1) (= ?loc l1_4))) (not (and (at_ p2 l2_1) (not (and (= ?obj_1 p2) (= ?loc l2_1)))))) (not (hold_4))) (when (and (at_ p2 l2_1) (not (and (= ?obj_1 p2) (= ?loc l2_1)))) (hold_4)) (when (or (in p2 t2) (and (at_ p2 l1_5) (not (and (= ?obj_1 p2) (= ?loc l1_5))))) (hold_5)) (when (and (at_ p2 l1_3) (not (and (= ?obj_1 p2) (= ?loc l1_3)))) (hold_6)) (when (or (and (at_ p2 l2_4) (not (and (= ?obj_1 p2) (= ?loc l2_4)))) (and (at_ p1 l1_2) (not (and (= ?obj_1 p1) (= ?loc l1_2))))) (seen_psi_7)) (when (or (and (= ?obj_1 p1) (= ?airplane a2)) (in p1 a2) (and (= ?obj_1 p2) (= ?airplane a1)) (in p2 a1)) (hold_8)) (when (and (or (and (= ?obj_1 p1) (= ?airplane a2)) (in p1 a2)) (or (and (= ?obj_1 p2) (= ?airplane a2)) (in p2 a2))) (hold_9)) (increase (total-cost) 1)))
 (:action unloadtruck
  :parameters ( ?obj - obj ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (in ?obj ?truck) (or (not (or (and (= ?obj p1) (= ?loc l1_1)) (at_ p1 l1_1))) (seen_psi_2)) (or (not (or (and (= ?obj p2) (= ?loc l1_3)) (at_ p2 l1_3))) (seen_psi_7)))
  :effect (and (not (in ?obj ?truck)) (at_ ?obj ?loc) (when (and (in p2 t2) (not (and (= ?obj p2) (= ?truck t2)))) (hold_0)) (when (or (and (= ?obj p1) (= ?loc l1_1)) (at_ p1 l1_1)) (hold_1)) (when (or (and (= ?obj p2) (= ?loc l2_4)) (at_ p2 l2_4)) (seen_psi_2)) (when (or (and (= ?obj p1) (= ?loc l1_4)) (at_ p1 l1_4)) (hold_3)) (when (and (or (and (= ?obj p1) (= ?loc l1_4)) (at_ p1 l1_4)) (not (or (and (= ?obj p2) (= ?loc l2_1)) (at_ p2 l2_1)))) (not (hold_4))) (when (or (and (= ?obj p2) (= ?loc l2_1)) (at_ p2 l2_1)) (hold_4)) (when (or (and (in p2 t2) (not (and (= ?obj p2) (= ?truck t2)))) (and (= ?obj p2) (= ?loc l1_5)) (at_ p2 l1_5)) (hold_5)) (when (or (and (= ?obj p2) (= ?loc l1_3)) (at_ p2 l1_3)) (hold_6)) (when (or (and (= ?obj p2) (= ?loc l2_4)) (at_ p2 l2_4) (and (= ?obj p1) (= ?loc l1_2)) (at_ p1 l1_2)) (seen_psi_7)) (increase (total-cost) 1)))
 (:action unloadairplane
  :parameters ( ?obj - obj ?airplane - airplane ?loc - location)
  :precondition (and (in ?obj ?airplane) (at_ ?airplane ?loc) (or (not (or (and (= ?obj p1) (= ?loc l1_1)) (at_ p1 l1_1))) (seen_psi_2)) (or (not (or (and (= ?obj p2) (= ?loc l1_3)) (at_ p2 l1_3))) (seen_psi_7)))
  :effect (and (not (in ?obj ?airplane)) (at_ ?obj ?loc) (when (or (and (= ?obj p1) (= ?loc l1_1)) (at_ p1 l1_1)) (hold_1)) (when (or (and (= ?obj p2) (= ?loc l2_4)) (at_ p2 l2_4)) (seen_psi_2)) (when (or (and (= ?obj p1) (= ?loc l1_4)) (at_ p1 l1_4)) (hold_3)) (when (and (or (and (= ?obj p1) (= ?loc l1_4)) (at_ p1 l1_4)) (not (or (and (= ?obj p2) (= ?loc l2_1)) (at_ p2 l2_1)))) (not (hold_4))) (when (or (and (= ?obj p2) (= ?loc l2_1)) (at_ p2 l2_1)) (hold_4)) (when (or (in p2 t2) (and (= ?obj p2) (= ?loc l1_5)) (at_ p2 l1_5)) (hold_5)) (when (or (and (= ?obj p2) (= ?loc l1_3)) (at_ p2 l1_3)) (hold_6)) (when (or (and (= ?obj p2) (= ?loc l2_4)) (at_ p2 l2_4) (and (= ?obj p1) (= ?loc l1_2)) (at_ p1 l1_2)) (seen_psi_7)) (when (or (and (in p1 a2) (not (and (= ?obj p1) (= ?airplane a2)))) (and (in p2 a1) (not (and (= ?obj p2) (= ?airplane a1))))) (hold_8)) (when (and (in p1 a2) (not (and (= ?obj p1) (= ?airplane a2))) (in p2 a2) (not (and (= ?obj p2) (= ?airplane a2)))) (hold_9)) (increase (total-cost) 1)))
 (:action drivetruck
  :parameters ( ?truck - truck ?loc_from - location ?loc_to - location ?city - city)
  :precondition (and (at_ ?truck ?loc_from) (incity ?loc_from ?city) (incity ?loc_to ?city))
  :effect (and (not (at_ ?truck ?loc_from)) (at_ ?truck ?loc_to) (increase (total-cost) 1)))
 (:action flyairplane
  :parameters ( ?airplane - airplane ?loc_from_0 - airport ?loc_to_0 - airport)
  :precondition (and (at_ ?airplane ?loc_from_0))
  :effect (and (not (at_ ?airplane ?loc_from_0)) (at_ ?airplane ?loc_to_0) (increase (total-cost) 1)))
)
