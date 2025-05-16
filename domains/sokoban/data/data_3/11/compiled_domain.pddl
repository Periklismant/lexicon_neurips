(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos53 pos13 pos22 pos32 pos42 - location
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_psi_1))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22))) (seen_psi_1)) (not (or (and (= ?p player1) (= ?l_to pos42)) (and (at_ player1 pos42) (not (and (= ?p player1) (= ?l_from pos42)))))) (or (= ?l_from pos32) (and (clear pos32) (not (= ?l_to pos32)))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_to pos13)) (and (at_ player1 pos13) (not (and (= ?p player1) (= ?l_from pos13)))) (not (or (= ?l_from pos53) (and (clear pos53) (not (= ?l_to pos53)))))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))) (seen_psi_1)) (not (or (and (= ?p player1) (= ?l_from pos42)) (and (at_ player1 pos42) (not (and (= ?p player1) (= ?l_p pos42)))))) (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32)))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_from pos13)) (and (at_ player1 pos13) (not (and (= ?p player1) (= ?l_p pos13)))) (not (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53)))))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))) (seen_psi_1)) (not (or (and (= ?p player1) (= ?l_from pos42)) (and (at_ player1 pos42) (not (and (= ?p player1) (= ?l_p pos42)))))) (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32)))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_from pos13)) (and (at_ player1 pos13) (not (and (= ?p player1) (= ?l_p pos13)))) (not (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53)))))) (seen_psi_1)) (increase (total-cost) 1)))
)
