(define (domain liftedtcore_logistics-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    obj location city - object
    airport - location
    package truck airplane - obj
 )
 (:constants
   p2 p1 - package
   t1 t2 - truck
   l2_3 - location
   a2 a1 - airplane
 )
 (:predicates (at_ ?obj - obj ?loc - location) (in ?obj1 - obj ?obj2 - obj) (incity ?obj_0 - location ?city - city) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8))
 (:functions (total-cost))
 (:action loadtruck
  :parameters ( ?obj_1 - package ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (at_ ?obj_1 ?loc))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?truck) (when (or (and (= ?obj_1 p2) (= ?truck t2)) (in p2 t2)) (hold_0)) (when (or (and (= ?obj_1 p2) (= ?truck t1)) (in p2 t1)) (hold_1)) (when (and (or (and (= ?obj_1 p2) (= ?truck t1)) (in p2 t1)) (not (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))))) (not (hold_2))) (when (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))) (hold_2)) (when (and (in p2 a1) (not (or (and (= ?obj_1 p2) (= ?truck t2)) (in p2 t2)))) (not (hold_4))) (when (or (and (= ?obj_1 p2) (= ?truck t2)) (in p2 t2)) (hold_4)) (when (or (and (= ?obj_1 p1) (= ?truck t1)) (in p1 t1)) (hold_5)) (when (and (or (and (= ?obj_1 p1) (= ?truck t1)) (in p1 t1)) (not (in p1 a2))) (not (hold_6))) (when (and (in p1 a1) (not (or (and (= ?obj_1 p1) (= ?truck t1)) (in p1 t1)))) (not (hold_8))) (when (or (and (= ?obj_1 p1) (= ?truck t1)) (in p1 t1)) (hold_8)) (increase (total-cost) 1)))
 (:action loadairplane
  :parameters ( ?obj_1 - package ?airplane - airplane ?loc - location)
  :precondition (and (at_ ?obj_1 ?loc) (at_ ?airplane ?loc))
  :effect (and (not (at_ ?obj_1 ?loc)) (in ?obj_1 ?airplane) (when (and (in p2 t1) (not (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))))) (not (hold_2))) (when (and (at_ p1 l2_3) (not (and (= ?obj_1 p1) (= ?loc l2_3)))) (hold_2)) (when (or (and (= ?obj_1 p2) (= ?airplane a1)) (in p2 a1)) (hold_3)) (when (and (or (and (= ?obj_1 p2) (= ?airplane a1)) (in p2 a1)) (not (in p2 t2))) (not (hold_4))) (when (and (in p1 t1) (not (or (and (= ?obj_1 p1) (= ?airplane a2)) (in p1 a2)))) (not (hold_6))) (when (or (and (= ?obj_1 p1) (= ?airplane a2)) (in p1 a2)) (hold_6)) (when (or (and (= ?obj_1 p1) (= ?airplane a1)) (in p1 a1)) (hold_7)) (when (and (or (and (= ?obj_1 p1) (= ?airplane a1)) (in p1 a1)) (not (in p1 t1))) (not (hold_8))) (increase (total-cost) 1)))
 (:action unloadtruck
  :parameters ( ?obj - obj ?truck - truck ?loc - location)
  :precondition (and (at_ ?truck ?loc) (in ?obj ?truck))
  :effect (and (not (in ?obj ?truck)) (at_ ?obj ?loc) (when (and (in p2 t2) (not (and (= ?obj p2) (= ?truck t2)))) (hold_0)) (when (and (in p2 t1) (not (and (= ?obj p2) (= ?truck t1)))) (hold_1)) (when (and (in p2 t1) (not (and (= ?obj p2) (= ?truck t1))) (not (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)))) (not (hold_2))) (when (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)) (hold_2)) (when (and (in p2 a1) (not (and (in p2 t2) (not (and (= ?obj p2) (= ?truck t2)))))) (not (hold_4))) (when (and (in p2 t2) (not (and (= ?obj p2) (= ?truck t2)))) (hold_4)) (when (and (in p1 t1) (not (and (= ?obj p1) (= ?truck t1)))) (hold_5)) (when (and (in p1 t1) (not (and (= ?obj p1) (= ?truck t1))) (not (in p1 a2))) (not (hold_6))) (when (and (in p1 a1) (not (and (in p1 t1) (not (and (= ?obj p1) (= ?truck t1)))))) (not (hold_8))) (when (and (in p1 t1) (not (and (= ?obj p1) (= ?truck t1)))) (hold_8)) (increase (total-cost) 1)))
 (:action unloadairplane
  :parameters ( ?obj - obj ?airplane - airplane ?loc - location)
  :precondition (and (in ?obj ?airplane) (at_ ?airplane ?loc))
  :effect (and (not (in ?obj ?airplane)) (at_ ?obj ?loc) (when (and (in p2 t1) (not (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)))) (not (hold_2))) (when (or (and (= ?obj p1) (= ?loc l2_3)) (at_ p1 l2_3)) (hold_2)) (when (and (in p2 a1) (not (and (= ?obj p2) (= ?airplane a1)))) (hold_3)) (when (and (in p2 a1) (not (and (= ?obj p2) (= ?airplane a1))) (not (in p2 t2))) (not (hold_4))) (when (and (in p1 t1) (not (and (in p1 a2) (not (and (= ?obj p1) (= ?airplane a2)))))) (not (hold_6))) (when (and (in p1 a2) (not (and (= ?obj p1) (= ?airplane a2)))) (hold_6)) (when (and (in p1 a1) (not (and (= ?obj p1) (= ?airplane a1)))) (hold_7)) (when (and (in p1 a1) (not (and (= ?obj p1) (= ?airplane a1))) (not (in p1 t1))) (not (hold_8))) (increase (total-cost) 1)))
 (:action drivetruck
  :parameters ( ?truck - truck ?loc_from - location ?loc_to - location ?city - city)
  :precondition (and (at_ ?truck ?loc_from) (incity ?loc_from ?city) (incity ?loc_to ?city))
  :effect (and (not (at_ ?truck ?loc_from)) (at_ ?truck ?loc_to) (increase (total-cost) 1)))
 (:action flyairplane
  :parameters ( ?airplane - airplane ?loc_from_0 - airport ?loc_to_0 - airport)
  :precondition (and (at_ ?airplane ?loc_from_0))
  :effect (and (not (at_ ?airplane ?loc_from_0)) (at_ ?airplane ?loc_to_0) (increase (total-cost) 1)))
)
