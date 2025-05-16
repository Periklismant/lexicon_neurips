(define (domain liftedtcore_logistics-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    obj location city - object
    airport - location
    package truck airplane - obj
 )
 (:constants
   p2 p1 - package
   l2_1 - airport
   l2_2 l2_3 - location
   a1 a2 - airplane
 )
 (:predicates (at_ ?obj - obj ?loc - location) (in ?obj1 - obj ?obj2 - obj) (incity ?obj_0 - location ?city - city) (hold_0) (hold_1) (hold_2) (hold_3))
 (:functions (total-cost))
 (:action loadtruck
  :parameters ( ?obj_1 - package ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (at_ ?obj_1 ?loc))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?truck) (when (and (at_ p1 l2_1) (not (and (= ?obj_1 p1) (= ?loc l2_1)))) (hold_0)) (when (and (at_ p1 l2_1) (not (and (= ?obj_1 p1) (= ?loc l2_1))) (not (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))))) (not (hold_1))) (when (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))) (hold_1)) (when (or (in p2 a1) (and (at_ p1 l2_2) (not (and (= ?obj_1 p1) (= ?loc l2_2))))) (hold_3)) (increase (total-cost) 1)))
 (:action loadairplane
  :parameters ( ?obj_1 - package ?airplane - airplane ?loc - location)
  :precondition (and (at_ ?obj_1 ?loc) (at_ ?airplane ?loc))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?airplane) (when (and (at_ p1 l2_1) (not (and (= ?obj_1 p1) (= ?loc l2_1)))) (hold_0)) (when (and (at_ p1 l2_1) (not (and (= ?obj_1 p1) (= ?loc l2_1))) (not (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))))) (not (hold_1))) (when (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))) (hold_1)) (when (or (and (= ?obj_1 p2) (= ?airplane a2)) (in p2 a2)) (hold_2)) (when (or (and (= ?obj_1 p2) (= ?airplane a1)) (in p2 a1) (and (at_ p1 l2_2) (not (and (= ?obj_1 p1) (= ?loc l2_2))))) (hold_3)) (increase (total-cost) 1)))
 (:action unloadtruck
  :parameters ( ?obj - obj ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (in ?obj ?truck))
  :effect (and (not (in ?obj ?truck)) (at_ ?obj ?loc) (when (or (and (= ?obj p1) (= ?loc l2_1)) (at_ p1 l2_1)) (hold_0)) (when (and (or (and (= ?obj p1) (= ?loc l2_1)) (at_ p1 l2_1)) (not (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)))) (not (hold_1))) (when (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)) (hold_1)) (when (or (in p2 a1) (and (= ?obj p1) (= ?loc l2_2)) (at_ p1 l2_2)) (hold_3)) (increase (total-cost) 1)))
 (:action unloadairplane
  :parameters ( ?obj - obj ?airplane - airplane ?loc - location)
  :precondition (and (in ?obj ?airplane) (at_ ?airplane ?loc))
  :effect (and (not (in ?obj ?airplane)) (at_ ?obj ?loc) (when (or (and (= ?obj p1) (= ?loc l2_1)) (at_ p1 l2_1)) (hold_0)) (when (and (or (and (= ?obj p1) (= ?loc l2_1)) (at_ p1 l2_1)) (not (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)))) (not (hold_1))) (when (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)) (hold_1)) (when (and (in p2 a2) (not (and (= ?obj p2) (= ?airplane a2)))) (hold_2)) (when (or (and (in p2 a1) (not (and (= ?obj p2) (= ?airplane a1)))) (and (= ?obj p1) (= ?loc l2_2)) (at_ p1 l2_2)) (hold_3)) (increase (total-cost) 1)))
 (:action drivetruck
  :parameters ( ?truck - truck ?loc_from - location ?loc_to - location ?city - city)
  :precondition (and (at_ ?truck ?loc_from) (incity ?loc_from ?city) (incity ?loc_to ?city))
  :effect (and (not (at_ ?truck ?loc_from)) (at_ ?truck ?loc_to) (increase (total-cost) 1)))
 (:action flyairplane
  :parameters ( ?airplane - airplane ?loc_from_0 - airport ?loc_to_0 - airport)
  :precondition (and (at_ ?airplane ?loc_from_0))
  :effect (and (not (at_ ?airplane ?loc_from_0)) (at_ ?airplane ?loc_to_0) (increase (total-cost) 1)))
)
