(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos43 pos44 pos41 pos32 pos24 - location
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_psi_1) (hold_2) (seen_psi_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos43) (and (clear pos43) (not (= ?l_to pos43))) (seen_psi_1)) (or (= ?l_from pos32) (and (clear pos32) (not (= ?l_to pos32))) (seen_psi_3)) (or (= ?l_from pos41) (and (clear pos41) (not (= ?l_to pos41)))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos43) (and (clear pos43) (not (= ?l_to pos43))))) (hold_0)) (when (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))))) (seen_psi_1)) (when (not (or (= ?l_from pos32) (and (clear pos32) (not (= ?l_to pos32))))) (hold_2)) (when (not (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))) (seen_psi_1)) (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))) (seen_psi_3)) (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41)))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))))) (hold_0)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (seen_psi_1)) (when (not (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))))) (hold_2)) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))) (seen_psi_1)) (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))) (seen_psi_3)) (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41)))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))))) (hold_0)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (seen_psi_1)) (when (not (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))))) (hold_2)) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_psi_3)) (increase (total-cost) 1)))
)
