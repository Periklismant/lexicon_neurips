(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos44 pos24 pos35 - location
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_psi_1))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))) (seen_psi_1)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_0)) (when (or (not (or (= ?l_from pos35) (and (clear pos35) (not (= ?l_to pos35))))) (not (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24)))))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))) (seen_psi_1)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_0)) (when (or (not (or (= ?l_p pos35) (and (clear pos35) (not (= ?l_to pos35))))) (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24)))))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))) (seen_psi_1)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_0)) (when (or (not (or (= ?l_p pos35) (and (clear pos35) (not (= ?l_to pos35))))) (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24)))))) (seen_psi_1)) (increase (total-cost) 1)))
)
