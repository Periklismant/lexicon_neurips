(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos22 pos24 pos31 pos21 pos34 pos42 - location
   stone1 - stone
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos31) (and (clear pos31) (not (= ?l_to pos31))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (and (at_ stone1 pos42) (or (= ?l_from pos34) (and (clear pos34) (not (= ?l_to pos34))))) (not (hold_1))) (when (not (or (= ?l_from pos34) (and (clear pos34) (not (= ?l_to pos34))))) (hold_1)) (when (not (or (= ?l_from pos31) (and (clear pos31) (not (= ?l_to pos31))))) (hold_2)) (when (or (and (= ?p player1) (= ?l_to pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_from pos24)))) (at_ stone1 pos22)) (seen_psi_3)) (when (not (or (= ?l_from pos21) (and (clear pos21) (not (= ?l_to pos21))))) (hold_4)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))) (hold_0)) (when (and (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))) (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (not (hold_1))) (when (not (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (hold_1)) (when (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))))) (hold_2)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24)))) (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22))))) (seen_psi_3)) (when (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21))))) (hold_4)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))) (hold_0)) (when (and (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))) (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (not (hold_1))) (when (not (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (hold_1)) (when (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))))) (hold_2)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24)))) (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22))))) (seen_psi_3)) (when (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21))))) (hold_4)) (increase (total-cost) 1)))
)
