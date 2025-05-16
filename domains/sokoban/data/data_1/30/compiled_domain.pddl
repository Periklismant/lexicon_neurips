(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   stone1 - stone
   pos22 pos54 - location
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (and (at_ stone1 pos22) (or (= ?l_from pos54) (and (clear pos54) (not (= ?l_to pos54))))) (not (hold_1))) (when (not (or (= ?l_from pos54) (and (clear pos54) (not (= ?l_to pos54))))) (hold_1)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22))))) (hold_0)) (when (and (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22))))) (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (not (hold_1))) (when (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (hold_1)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22))))) (hold_0)) (when (and (or (and (= ?s stone1) (= ?l_to pos22)) (and (at_ stone1 pos22) (not (and (= ?s stone1) (= ?l_from pos22))))) (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (not (hold_1))) (when (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (hold_1)) (increase (total-cost) 1)))
)
