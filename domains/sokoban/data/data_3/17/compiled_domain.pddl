(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos35 pos24 pos55 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos35) (and (clear pos35) (not (= ?l_to pos35)))) (not (or (and (= ?p player1) (= ?l_to pos35)) (and (at_ player1 pos35) (not (and (= ?p player1) (= ?l_from pos35)))))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (or (not (or (= ?l_from pos55) (and (clear pos55) (not (= ?l_to pos55))))) (at_ stone1 pos24)) (hold_0)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos35) (and (clear pos35) (not (= ?l_to pos35)))) (not (or (and (= ?p player1) (= ?l_from pos35)) (and (at_ player1 pos35) (not (and (= ?p player1) (= ?l_p pos35)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (not (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))))) (and (= ?s stone1) (= ?l_to pos24)) (and (at_ stone1 pos24) (not (and (= ?s stone1) (= ?l_from pos24))))) (hold_0)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos35) (and (clear pos35) (not (= ?l_to pos35)))) (not (or (and (= ?p player1) (= ?l_from pos35)) (and (at_ player1 pos35) (not (and (= ?p player1) (= ?l_p pos35)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (not (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))))) (and (= ?s stone1) (= ?l_to pos24)) (and (at_ stone1 pos24) (not (and (= ?s stone1) (= ?l_from pos24))))) (hold_0)) (increase (total-cost) 1)))
)
