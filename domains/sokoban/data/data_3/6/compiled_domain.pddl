(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   player1 - person
   pos35 pos41 pos22 pos45 pos21 - location
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (hold_2) (seen_psi_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (not (or (and (= ?p player1) (= ?l_to pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_from pos22)))))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (and (or (and (= ?p player1) (= ?l_to pos35)) (and (at_ player1 pos35) (not (and (= ?p player1) (= ?l_from pos35))))) (at_ stone1 pos22)) (hold_0)) (when (or (at_ stone1 pos41) (not (or (= ?l_from pos45) (and (clear pos45) (not (= ?l_to pos45)))))) (hold_1)) (when (or (and (= ?p player1) (= ?l_to pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_from pos22))))) (hold_2)) (when (not (or (= ?l_from pos21) (and (clear pos21) (not (= ?l_to pos21))))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (not (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22)))))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (and (or (and (= ?p player1) (= ?l_from pos35)) (and (at_ player1 pos35) (not (and (= ?p player1) (= ?l_p pos35))))) (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22)))))) (hold_0)) (when (or (and (= ?s stone1) (= ?l_to pos41)) (and (at_ stone1 pos41) (not (and (= ?s stone1) (= ?l_from pos41)))) (not (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45)))))) (hold_1)) (when (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22))))) (hold_2)) (when (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21))))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (not (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22)))))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (and (or (and (= ?p player1) (= ?l_from pos35)) (and (at_ player1 pos35) (not (and (= ?p player1) (= ?l_p pos35))))) (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22)))))) (hold_0)) (when (or (and (= ?s stone1) (= ?l_to pos41)) (and (at_ stone1 pos41) (not (and (= ?s stone1) (= ?l_from pos41)))) (not (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45)))))) (hold_1)) (when (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22))))) (hold_2)) (when (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21))))) (seen_psi_3)) (increase (total-cost) 1)))
)
