(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos25 pos23 pos12 pos15 pos22 pos44 pos24 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (seen_phi_0) (hold_1) (seen_psi_2) (hold_3) (seen_psi_4))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos23) (and (clear pos23) (not (= ?l_to pos23))) (not (seen_phi_0)) (not (clear pos23))) (or (not (or (and (= ?p player1) (= ?l_to pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_from pos24)))))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos23) (and (clear pos23) (not (= ?l_to pos23))))) (seen_phi_0)) (when (or (not (or (= ?l_from pos12) (and (clear pos12) (not (= ?l_to pos12))))) (at_ stone1 pos25)) (seen_psi_2)) (when (or (and (= ?p player1) (= ?l_to pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_from pos24))))) (hold_3)) (when (or (at_ stone1 pos22) (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44)))))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))) (not (seen_phi_0)) (not (clear pos23))) (or (not (or (and (= ?s stone1) (= ?l_to pos15)) (and (at_ stone1 pos15) (not (and (= ?s stone1) (= ?l_from pos15)))))) (seen_psi_2)) (or (not (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24)))))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))))) (seen_phi_0)) (when (or (and (= ?s stone1) (= ?l_to pos15)) (and (at_ stone1 pos15) (not (and (= ?s stone1) (= ?l_from pos15))))) (hold_1)) (when (or (not (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))))) (and (= ?s stone1) (= ?l_to pos25)) (and (at_ stone1 pos25) (not (and (= ?s stone1) (= ?l_from pos25))))) (seen_psi_2)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (hold_3)) (when (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22)))) (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44)))))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))) (not (seen_phi_0)) (not (clear pos23))) (or (not (or (and (= ?s stone1) (= ?l_to pos15)) (and (at_ stone1 pos15) (not (and (= ?s stone1) (= ?l_from pos15)))))) (seen_psi_2)) (or (not (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24)))))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))))) (seen_phi_0)) (when (or (and (= ?s stone1) (= ?l_to pos15)) (and (at_ stone1 pos15) (not (and (= ?s stone1) (= ?l_from pos15))))) (hold_1)) (when (or (not (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))))) (and (= ?s stone1) (= ?l_to pos25)) (and (at_ stone1 pos25) (not (and (= ?s stone1) (= ?l_from pos25))))) (seen_psi_2)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (hold_3)) (when (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22)))) (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44)))))) (seen_psi_4)) (increase (total-cost) 1)))
)
