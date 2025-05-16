(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos34 pos43 pos25 pos13 pos42 pos44 pos24 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_psi_1) (seen_phi_2) (seen_phi_3) (hold_4) (seen_psi_5))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24))) (seen_psi_1)) (or (= ?l_from pos25) (and (clear pos25) (not (= ?l_to pos25))) (not (seen_phi_2)) (not (clear pos25))) (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))) (not (seen_phi_3)) (not (clear pos44))) (or (= ?l_from pos43) (and (clear pos43) (not (= ?l_to pos43))) (seen_psi_5)) (not (or (and (= ?p player1) (= ?l_to pos44)) (and (at_ player1 pos44) (not (and (= ?p player1) (= ?l_from pos44)))))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24))))) (hold_0)) (when (not (or (= ?l_from pos34) (and (clear pos34) (not (= ?l_to pos34))))) (seen_psi_1)) (when (not (or (= ?l_from pos25) (and (clear pos25) (not (= ?l_to pos25))))) (seen_phi_2)) (when (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))))) (seen_phi_3)) (when (not (or (= ?l_from pos43) (and (clear pos43) (not (= ?l_to pos43))))) (hold_4)) (when (or (at_ stone1 pos42) (not (or (= ?l_from pos13) (and (clear pos13) (not (= ?l_to pos13)))))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))) (seen_psi_1)) (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))) (not (seen_phi_2)) (not (clear pos25))) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))) (not (seen_phi_3)) (not (clear pos44))) (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))) (seen_psi_5)) (not (or (and (= ?p player1) (= ?l_from pos44)) (and (at_ player1 pos44) (not (and (= ?p player1) (= ?l_p pos44)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (hold_0)) (when (not (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (seen_psi_1)) (when (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))))) (seen_phi_2)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (seen_phi_3)) (when (not (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))))) (hold_4)) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42)))) (not (or (= ?l_p pos13) (and (clear pos13) (not (= ?l_to pos13)))))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))) (seen_psi_1)) (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))) (not (seen_phi_2)) (not (clear pos25))) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))) (not (seen_phi_3)) (not (clear pos44))) (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))) (seen_psi_5)) (not (or (and (= ?p player1) (= ?l_from pos44)) (and (at_ player1 pos44) (not (and (= ?p player1) (= ?l_p pos44)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (hold_0)) (when (not (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (seen_psi_1)) (when (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))))) (seen_phi_2)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (seen_phi_3)) (when (not (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43))))) (hold_4)) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42)))) (not (or (= ?l_p pos13) (and (clear pos13) (not (= ?l_to pos13)))))) (seen_psi_5)) (increase (total-cost) 1)))
)
