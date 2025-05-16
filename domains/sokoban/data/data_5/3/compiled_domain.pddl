(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos15 pos43 pos14 pos53 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos53) (and (clear pos53) (not (= ?l_to pos53)))) (not (or (and (= ?p player1) (= ?l_to pos43)) (and (at_ player1 pos43) (not (and (= ?p player1) (= ?l_from pos43)))))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos15) (and (clear pos15) (not (= ?l_to pos15))))) (hold_0)) (when (not (or (= ?l_from pos14) (and (clear pos14) (not (= ?l_to pos14))))) (hold_1)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53)))) (not (or (and (= ?p player1) (= ?l_from pos43)) (and (at_ player1 pos43) (not (and (= ?p player1) (= ?l_p pos43)))))) (not (or (and (= ?s stone1) (= ?l_to pos43)) (and (at_ stone1 pos43) (not (and (= ?s stone1) (= ?l_from pos43)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos15) (and (clear pos15) (not (= ?l_to pos15))))) (hold_0)) (when (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14))))) (hold_1)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53)))) (not (or (and (= ?p player1) (= ?l_from pos43)) (and (at_ player1 pos43) (not (and (= ?p player1) (= ?l_p pos43)))))) (not (or (and (= ?s stone1) (= ?l_to pos43)) (and (at_ stone1 pos43) (not (and (= ?s stone1) (= ?l_from pos43)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos15) (and (clear pos15) (not (= ?l_to pos15))))) (hold_0)) (when (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14))))) (hold_1)) (increase (total-cost) 1)))
)
