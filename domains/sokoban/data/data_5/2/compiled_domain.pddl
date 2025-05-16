(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos42 pos33 pos51 pos44 pos34 pos53 - location
   stone1 - stone
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_phi_1) (hold_2) (hold_3) (hold_4) (hold_5))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42))) (not (seen_phi_1)) (not (clear pos42))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos33) (and (clear pos33) (not (= ?l_to pos33))))) (hold_0)) (when (not (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42))))) (seen_phi_1)) (when (not (or (= ?l_from pos53) (and (clear pos53) (not (= ?l_to pos53))))) (hold_2)) (when (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_3)) (when (and (not (or (= ?l_from pos44) (and (clear pos44) (not (= ?l_to pos44))))) (not (or (not (or (= ?l_from pos51) (and (clear pos51) (not (= ?l_to pos51))))) (at_ stone1 pos34)))) (not (hold_4))) (when (or (not (or (= ?l_from pos51) (and (clear pos51) (not (= ?l_to pos51))))) (at_ stone1 pos34)) (hold_4)) (when (or (and (= ?p player1) (= ?l_to pos51)) (and (at_ player1 pos51) (not (and (= ?p player1) (= ?l_from pos51))))) (hold_5)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))) (not (seen_phi_1)) (not (clear pos42))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (hold_0)) (when (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (seen_phi_1)) (when (not (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53))))) (hold_2)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_3)) (when (and (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (not (or (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (and (= ?s stone1) (= ?l_to pos34)) (and (at_ stone1 pos34) (not (and (= ?s stone1) (= ?l_from pos34))))))) (not (hold_4))) (when (or (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (and (= ?s stone1) (= ?l_to pos34)) (and (at_ stone1 pos34) (not (and (= ?s stone1) (= ?l_from pos34))))) (hold_4)) (when (or (and (= ?p player1) (= ?l_from pos51)) (and (at_ player1 pos51) (not (and (= ?p player1) (= ?l_p pos51))))) (hold_5)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))) (not (seen_phi_1)) (not (clear pos42))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (hold_0)) (when (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (seen_phi_1)) (when (not (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53))))) (hold_2)) (when (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (hold_3)) (when (and (not (or (= ?l_p pos44) (and (clear pos44) (not (= ?l_to pos44))))) (not (or (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (and (= ?s stone1) (= ?l_to pos34)) (and (at_ stone1 pos34) (not (and (= ?s stone1) (= ?l_from pos34))))))) (not (hold_4))) (when (or (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (and (= ?s stone1) (= ?l_to pos34)) (and (at_ stone1 pos34) (not (and (= ?s stone1) (= ?l_from pos34))))) (hold_4)) (when (or (and (= ?p player1) (= ?l_from pos51)) (and (at_ player1 pos51) (not (and (= ?p player1) (= ?l_p pos51))))) (hold_5)) (increase (total-cost) 1)))
)
