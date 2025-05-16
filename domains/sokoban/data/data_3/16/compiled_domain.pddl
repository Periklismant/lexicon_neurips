(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos42 pos52 pos41 pos32 pos21 pos14 - location
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (seen_phi_0) (hold_1) (hold_2) (hold_3) (seen_psi_4))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42))) (not (seen_phi_0)) (not (clear pos42))) (or (= ?l_from pos52) (and (clear pos52) (not (= ?l_to pos52))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42))))) (seen_phi_0)) (when (or (and (= ?p player1) (= ?l_to pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_from pos14))))) (hold_1)) (when (and (or (and (= ?p player1) (= ?l_to pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_from pos14))))) (or (= ?l_from pos41) (and (clear pos41) (not (= ?l_to pos41))))) (not (hold_2))) (when (not (or (= ?l_from pos41) (and (clear pos41) (not (= ?l_to pos41))))) (hold_2)) (when (not (or (= ?l_from pos52) (and (clear pos52) (not (= ?l_to pos52))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_to pos32)) (and (at_ player1 pos32) (not (and (= ?p player1) (= ?l_from pos32)))) (not (or (= ?l_from pos21) (and (clear pos21) (not (= ?l_to pos21)))))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))) (not (seen_phi_0)) (not (clear pos42))) (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (seen_phi_0)) (when (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (hold_1)) (when (and (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (not (hold_2))) (when (not (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (hold_2)) (when (not (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_from pos32)) (and (at_ player1 pos32) (not (and (= ?p player1) (= ?l_p pos32)))) (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21)))))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))) (not (seen_phi_0)) (not (clear pos42))) (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (seen_phi_0)) (when (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (hold_1)) (when (and (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (not (hold_2))) (when (not (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (hold_2)) (when (not (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_from pos32)) (and (at_ player1 pos32) (not (and (= ?p player1) (= ?l_p pos32)))) (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21)))))) (seen_psi_4)) (increase (total-cost) 1)))
)
