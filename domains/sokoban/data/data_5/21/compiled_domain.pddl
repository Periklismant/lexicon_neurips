(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos45 pos43 pos13 pos42 pos44 pos24 pos14 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (seen_psi_2) (seen_phi_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos43) (and (clear pos43) (not (= ?l_to pos43)))) (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44)))) (or (not (or (and (= ?p player1) (= ?l_to pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_from pos24)))))) (seen_psi_2)) (or (= ?l_from pos14) (and (clear pos14) (not (= ?l_to pos14))) (not (seen_phi_3)) (not (clear pos14))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (or (and (= ?p player1) (= ?l_to pos13)) (and (at_ player1 pos13) (not (and (= ?p player1) (= ?l_from pos13)))) (not (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42)))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_to pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_from pos24))))) (hold_1)) (when (or (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))))) (at_ stone1 pos45)) (seen_psi_2)) (when (not (or (= ?l_from pos14) (and (clear pos14) (not (= ?l_to pos14))))) (seen_phi_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43)))) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44)))) (or (not (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24)))))) (seen_psi_2)) (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14))) (not (seen_phi_3)) (not (clear pos14))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?p player1) (= ?l_from pos13)) (and (at_ player1 pos13) (not (and (= ?p player1) (= ?l_p pos13)))) (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42)))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (hold_1)) (when (or (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (and (= ?s stone1) (= ?l_to pos45)) (and (at_ stone1 pos45) (not (and (= ?s stone1) (= ?l_from pos45))))) (seen_psi_2)) (when (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14))))) (seen_phi_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43)))) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44)))) (or (not (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24)))))) (seen_psi_2)) (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14))) (not (seen_phi_3)) (not (clear pos14))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?p player1) (= ?l_from pos13)) (and (at_ player1 pos13) (not (and (= ?p player1) (= ?l_p pos13)))) (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42)))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (hold_1)) (when (or (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (and (= ?s stone1) (= ?l_to pos45)) (and (at_ stone1 pos45) (not (and (= ?s stone1) (= ?l_from pos45))))) (seen_psi_2)) (when (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14))))) (seen_phi_3)) (increase (total-cost) 1)))
)
