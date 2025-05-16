(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   player1 - person
   pos23 pos53 pos33 pos12 pos14 - location
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (hold_2))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (not (or (and (= ?p player1) (= ?l_to pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_from pos53)))))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos33) (and (clear pos33) (not (= ?l_to pos33))))) (hold_0)) (when (and (not (or (= ?l_from pos33) (and (clear pos33) (not (= ?l_to pos33))))) (not (or (not (or (= ?l_from pos23) (and (clear pos23) (not (= ?l_to pos23))))) (not (or (= ?l_from pos14) (and (clear pos14) (not (= ?l_to pos14)))))))) (not (hold_1))) (when (or (not (or (= ?l_from pos23) (and (clear pos23) (not (= ?l_to pos23))))) (not (or (= ?l_from pos14) (and (clear pos14) (not (= ?l_to pos14)))))) (hold_1)) (when (not (or (= ?l_from pos12) (and (clear pos12) (not (= ?l_to pos12))))) (hold_2)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (not (or (and (= ?p player1) (= ?l_from pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_p pos53)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (hold_0)) (when (and (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (not (or (not (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))))) (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14)))))))) (not (hold_1))) (when (or (not (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))))) (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14)))))) (hold_1)) (when (not (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))))) (hold_2)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (not (or (and (= ?p player1) (= ?l_from pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_p pos53)))))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (hold_0)) (when (and (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (not (or (not (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))))) (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14)))))))) (not (hold_1))) (when (or (not (or (= ?l_p pos23) (and (clear pos23) (not (= ?l_to pos23))))) (not (or (= ?l_p pos14) (and (clear pos14) (not (= ?l_to pos14)))))) (hold_1)) (when (not (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))))) (hold_2)) (increase (total-cost) 1)))
)
