(define (domain liftedtcore_logistics-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    obj location city - object
    airport - location
    package truck airplane - obj
 )
 (:constants
   p2 p1 - package
   a2 a1 - airplane
   l1_8 l2_5 l2_8 l2_7 l1_6 l1_2 - location
 )
 (:predicates (at_ ?obj - obj ?loc - location) (in ?obj1 - obj ?obj2 - obj) (incity ?obj_0 - location ?city - city) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5))
 (:functions (total-cost))
 (:action loadtruck
  :parameters ( ?obj_1 - package ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (at_ ?obj_1 ?loc))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?truck) (when (or (in p1 a1) (and (at_ p2 l2_7) (not (and (= ?obj_1 p2) (= ?loc l2_7))))) (hold_0)) (when (and (at_ p1 l2_8) (not (and (= ?obj_1 p1) (= ?loc l2_8)))) (hold_1)) (when (and (at_ p1 l2_8) (not (and (= ?obj_1 p1) (= ?loc l2_8))) (not (or (and (at_ p2 l1_2) (not (and (= ?obj_1 p2) (= ?loc l1_2)))) (and (at_ p1 l2_5) (not (and (= ?obj_1 p1) (= ?loc l2_5))))))) (not (hold_2))) (when (or (and (at_ p2 l1_2) (not (and (= ?obj_1 p2) (= ?loc l1_2)))) (and (at_ p1 l2_5) (not (and (= ?obj_1 p1) (= ?loc l2_5))))) (hold_2)) (when (and (at_ p2 l2_8) (not (and (= ?obj_1 p2) (= ?loc l2_8)))) (hold_3)) (when (or (and (at_ p2 l1_8) (not (and (= ?obj_1 p2) (= ?loc l1_8)))) (and (at_ p1 l1_6) (not (and (= ?obj_1 p1) (= ?loc l1_6))))) (hold_5)) (increase (total-cost) 1)))
 (:action loadairplane
  :parameters ( ?obj_1 - package ?airplane - airplane ?loc - location)
  :precondition (and (at_ ?obj_1 ?loc) (at_ ?airplane ?loc))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?airplane) (when (or (and (= ?obj_1 p1) (= ?airplane a1)) (in p1 a1) (and (at_ p2 l2_7) (not (and (= ?obj_1 p2) (= ?loc l2_7))))) (hold_0)) (when (and (at_ p1 l2_8) (not (and (= ?obj_1 p1) (= ?loc l2_8)))) (hold_1)) (when (and (at_ p1 l2_8) (not (and (= ?obj_1 p1) (= ?loc l2_8))) (not (or (and (at_ p2 l1_2) (not (and (= ?obj_1 p2) (= ?loc l1_2)))) (and (at_ p1 l2_5) (not (and (= ?obj_1 p1) (= ?loc l2_5))))))) (not (hold_2))) (when (or (and (at_ p2 l1_2) (not (and (= ?obj_1 p2) (= ?loc l1_2)))) (and (at_ p1 l2_5) (not (and (= ?obj_1 p1) (= ?loc l2_5))))) (hold_2)) (when (and (at_ p2 l2_8) (not (and (= ?obj_1 p2) (= ?loc l2_8)))) (hold_3)) (when (or (and (= ?obj_1 p2) (= ?airplane a2)) (in p2 a2)) (hold_4)) (when (or (and (at_ p2 l1_8) (not (and (= ?obj_1 p2) (= ?loc l1_8)))) (and (at_ p1 l1_6) (not (and (= ?obj_1 p1) (= ?loc l1_6))))) (hold_5)) (increase (total-cost) 1)))
 (:action unloadtruck
  :parameters ( ?obj - obj ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (in ?obj ?truck))
  :effect (and (not (in ?obj ?truck)) (at_ ?obj ?loc) (when (or (in p1 a1) (and (= ?obj p2) (= ?loc l2_7)) (at_ p2 l2_7)) (hold_0)) (when (or (and (= ?obj p1) (= ?loc l2_8)) (at_ p1 l2_8)) (hold_1)) (when (and (or (and (= ?obj p1) (= ?loc l2_8)) (at_ p1 l2_8)) (not (or (and (= ?obj p2) (= ?loc l1_2)) (at_ p2 l1_2) (and (= ?obj p1) (= ?loc l2_5)) (at_ p1 l2_5)))) (not (hold_2))) (when (or (and (= ?obj p2) (= ?loc l1_2)) (at_ p2 l1_2) (and (= ?obj p1) (= ?loc l2_5)) (at_ p1 l2_5)) (hold_2)) (when (or (and (= ?obj p2) (= ?loc l2_8)) (at_ p2 l2_8)) (hold_3)) (when (or (and (= ?obj p2) (= ?loc l1_8)) (at_ p2 l1_8) (and (= ?obj p1) (= ?loc l1_6)) (at_ p1 l1_6)) (hold_5)) (increase (total-cost) 1)))
 (:action unloadairplane
  :parameters ( ?obj - obj ?airplane - airplane ?loc - location)
  :precondition (and (in ?obj ?airplane) (at_ ?airplane ?loc))
  :effect (and (not (in ?obj ?airplane)) (at_ ?obj ?loc) (when (or (and (in p1 a1) (not (and (= ?obj p1) (= ?airplane a1)))) (and (= ?obj p2) (= ?loc l2_7)) (at_ p2 l2_7)) (hold_0)) (when (or (and (= ?obj p1) (= ?loc l2_8)) (at_ p1 l2_8)) (hold_1)) (when (and (or (and (= ?obj p1) (= ?loc l2_8)) (at_ p1 l2_8)) (not (or (and (= ?obj p2) (= ?loc l1_2)) (at_ p2 l1_2) (and (= ?obj p1) (= ?loc l2_5)) (at_ p1 l2_5)))) (not (hold_2))) (when (or (and (= ?obj p2) (= ?loc l1_2)) (at_ p2 l1_2) (and (= ?obj p1) (= ?loc l2_5)) (at_ p1 l2_5)) (hold_2)) (when (or (and (= ?obj p2) (= ?loc l2_8)) (at_ p2 l2_8)) (hold_3)) (when (and (in p2 a2) (not (and (= ?obj p2) (= ?airplane a2)))) (hold_4)) (when (or (and (= ?obj p2) (= ?loc l1_8)) (at_ p2 l1_8) (and (= ?obj p1) (= ?loc l1_6)) (at_ p1 l1_6)) (hold_5)) (increase (total-cost) 1)))
 (:action drivetruck
  :parameters ( ?truck - truck ?loc_from - location ?loc_to - location ?city - city)
  :precondition (and (at_ ?truck ?loc_from) (incity ?loc_from ?city) (incity ?loc_to ?city))
  :effect (and (not (at_ ?truck ?loc_from)) (at_ ?truck ?loc_to) (increase (total-cost) 1)))
 (:action flyairplane
  :parameters ( ?airplane - airplane ?loc_from_0 - airport ?loc_to_0 - airport)
  :precondition (and (at_ ?airplane ?loc_from_0))
  :effect (and (not (at_ ?airplane ?loc_from_0)) (at_ ?airplane ?loc_to_0) (increase (total-cost) 1)))
)
