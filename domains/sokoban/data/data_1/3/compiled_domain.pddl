(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos15 pos41 - location
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos15) (and (clear pos15) (not (= ?l_to pos15))))) (hold_0)) (when (and (not (or (= ?l_from pos15) (and (clear pos15) (not (= ?l_to pos15))))) (not (or (and (= ?p player1) (= ?l_to pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_from pos41))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_to pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_from pos41))))) (hold_1)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos15) (and (clear pos15) (not (= ?l_to pos15))))) (hold_0)) (when (and (not (or (= ?l_p pos15) (and (clear pos15) (not (= ?l_to pos15))))) (not (or (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))) (hold_1)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos15) (and (clear pos15) (not (= ?l_to pos15))))) (hold_0)) (when (and (not (or (= ?l_p pos15) (and (clear pos15) (not (= ?l_to pos15))))) (not (or (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))) (hold_1)) (increase (total-cost) 1)))
)
