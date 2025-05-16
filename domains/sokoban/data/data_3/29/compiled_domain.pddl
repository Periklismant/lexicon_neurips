(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos11 pos13 pos22 pos24 pos51 - location
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (seen_phi_0) (hold_1) (seen_psi_2) (seen_phi_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22))) (not (seen_phi_0)) (not (clear pos22))) (or (= ?l_from pos13) (and (clear pos13) (not (= ?l_to pos13))) (seen_psi_2)) (or (= ?l_from pos11) (and (clear pos11) (not (= ?l_to pos11))) (not (seen_phi_3)) (not (clear pos11))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22))))) (seen_phi_0)) (when (not (or (= ?l_from pos13) (and (clear pos13) (not (= ?l_to pos13))))) (hold_1)) (when (or (not (or (= ?l_from pos51) (and (clear pos51) (not (= ?l_to pos51))))) (not (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24)))))) (seen_psi_2)) (when (not (or (= ?l_from pos11) (and (clear pos11) (not (= ?l_to pos11))))) (seen_phi_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))) (not (seen_phi_0)) (not (clear pos22))) (or (= ?l_p pos13) (and (clear pos13) (not (= ?l_to pos13))) (seen_psi_2)) (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))) (not (seen_phi_3)) (not (clear pos11))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (seen_phi_0)) (when (not (or (= ?l_p pos13) (and (clear pos13) (not (= ?l_to pos13))))) (hold_1)) (when (or (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24)))))) (seen_psi_2)) (when (not (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))))) (seen_phi_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))) (not (seen_phi_0)) (not (clear pos22))) (or (= ?l_p pos13) (and (clear pos13) (not (= ?l_to pos13))) (seen_psi_2)) (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))) (not (seen_phi_3)) (not (clear pos11))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (seen_phi_0)) (when (not (or (= ?l_p pos13) (and (clear pos13) (not (= ?l_to pos13))))) (hold_1)) (when (or (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24)))))) (seen_psi_2)) (when (not (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))))) (seen_phi_3)) (increase (total-cost) 1)))
)
