(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   player1 - person
   pos23 pos21 pos52 - location
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_psi_1))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (not (or (and (= ?p player1) (= ?l_to pos23)) (and (at_ player1 pos23) (not (and (= ?p player1) (= ?l_from pos23)))))) (seen_psi_1)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (or (and (= ?p player1) (= ?l_to pos23)) (and (at_ player1 pos23) (not (and (= ?p player1) (= ?l_from pos23))))) (hold_0)) (when (or (at_ stone1 pos21) (not (or (= ?l_from pos52) (and (clear pos52) (not (= ?l_to pos52)))))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (not (or (and (= ?p player1) (= ?l_from pos23)) (and (at_ player1 pos23) (not (and (= ?p player1) (= ?l_p pos23)))))) (seen_psi_1)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?p player1) (= ?l_from pos23)) (and (at_ player1 pos23) (not (and (= ?p player1) (= ?l_p pos23))))) (hold_0)) (when (or (and (= ?s stone1) (= ?l_to pos21)) (and (at_ stone1 pos21) (not (and (= ?s stone1) (= ?l_from pos21)))) (not (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52)))))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (not (or (and (= ?p player1) (= ?l_from pos23)) (and (at_ player1 pos23) (not (and (= ?p player1) (= ?l_p pos23)))))) (seen_psi_1)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?p player1) (= ?l_from pos23)) (and (at_ player1 pos23) (not (and (= ?p player1) (= ?l_p pos23))))) (hold_0)) (when (or (and (= ?s stone1) (= ?l_to pos21)) (and (at_ stone1 pos21) (not (and (= ?s stone1) (= ?l_from pos21)))) (not (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52)))))) (seen_psi_1)) (increase (total-cost) 1)))
)
