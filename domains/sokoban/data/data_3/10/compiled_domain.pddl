(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   player1 - person
   pos43 pos44 pos52 pos55 pos34 - location
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (hold_2) (seen_psi_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (not (or (and (= ?p player1) (= ?l_to pos43)) (and (at_ player1 pos43) (not (and (= ?p player1) (= ?l_from pos43)))))) (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (or (and (= ?p player1) (= ?l_to pos34)) (and (at_ player1 pos34) (not (and (= ?p player1) (= ?l_from pos34))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_to pos34)) (and (at_ player1 pos34) (not (and (= ?p player1) (= ?l_from pos34))))) (or (= ?l_from pos52) (and (clear pos52) (not (= ?l_to pos52))))) (not (hold_1))) (when (not (or (= ?l_from pos52) (and (clear pos52) (not (= ?l_to pos52))))) (hold_1)) (when (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_2)) (when (not (or (= ?l_from pos55) (and (clear pos55) (not (= ?l_to pos55))))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (not (or (and (= ?p player1) (= ?l_from pos43)) (and (at_ player1 pos43) (not (and (= ?p player1) (= ?l_p pos43)))))) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?p player1) (= ?l_from pos34)) (and (at_ player1 pos34) (not (and (= ?p player1) (= ?l_p pos34))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_from pos34)) (and (at_ player1 pos34) (not (and (= ?p player1) (= ?l_p pos34))))) (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))))) (not (hold_1))) (when (not (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))))) (hold_1)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_2)) (when (not (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (not (or (and (= ?p player1) (= ?l_from pos43)) (and (at_ player1 pos43) (not (and (= ?p player1) (= ?l_p pos43)))))) (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?p player1) (= ?l_from pos34)) (and (at_ player1 pos34) (not (and (= ?p player1) (= ?l_p pos34))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_from pos34)) (and (at_ player1 pos34) (not (and (= ?p player1) (= ?l_p pos34))))) (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))))) (not (hold_1))) (when (not (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52))))) (hold_1)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_2)) (when (not (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))))) (seen_psi_3)) (increase (total-cost) 1)))
)
