(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos15 pos42 pos51 pos22 pos43 pos34 pos53 - location
   stone1 - stone
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_phi_1) (hold_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22)))) (or (= ?l_from pos51) (and (clear pos51) (not (= ?l_to pos51))) (not (seen_phi_1)) (not (clear pos51))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (or (at_ stone1 pos34) (not (or (= ?l_from pos43) (and (clear pos43) (not (= ?l_to pos43)))))) (hold_0)) (when (not (or (= ?l_from pos51) (and (clear pos51) (not (= ?l_to pos51))))) (seen_phi_1)) (when (or (and (= ?p player1) (= ?l_to pos15)) (and (at_ player1 pos15) (not (and (= ?p player1) (= ?l_from pos15))))) (hold_2)) (when (or (and (= ?p player1) (= ?l_to pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_from pos53))))) (hold_3)) (when (and (or (and (= ?p player1) (= ?l_to pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_from pos53))))) (not (at_ stone1 pos42))) (not (hold_4))) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22)))) (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))) (not (seen_phi_1)) (not (clear pos51))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?s stone1) (= ?l_to pos34)) (and (at_ stone1 pos34) (not (and (= ?s stone1) (= ?l_from pos34)))) (not (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43)))))) (hold_0)) (when (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (seen_phi_1)) (when (or (and (= ?p player1) (= ?l_from pos15)) (and (at_ player1 pos15) (not (and (= ?p player1) (= ?l_p pos15))))) (hold_2)) (when (or (and (= ?p player1) (= ?l_from pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_p pos53))))) (hold_3)) (when (and (or (and (= ?p player1) (= ?l_from pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_p pos53))))) (not (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))))) (not (hold_4))) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))) (hold_4)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22)))) (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))) (not (seen_phi_1)) (not (clear pos51))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?s stone1) (= ?l_to pos34)) (and (at_ stone1 pos34) (not (and (= ?s stone1) (= ?l_from pos34)))) (not (or (= ?l_p pos43) (and (clear pos43) (not (= ?l_to pos43)))))) (hold_0)) (when (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51))))) (seen_phi_1)) (when (or (and (= ?p player1) (= ?l_from pos15)) (and (at_ player1 pos15) (not (and (= ?p player1) (= ?l_p pos15))))) (hold_2)) (when (or (and (= ?p player1) (= ?l_from pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_p pos53))))) (hold_3)) (when (and (or (and (= ?p player1) (= ?l_from pos53)) (and (at_ player1 pos53) (not (and (= ?p player1) (= ?l_p pos53))))) (not (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))))) (not (hold_4))) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42))))) (hold_4)) (increase (total-cost) 1)))
)
