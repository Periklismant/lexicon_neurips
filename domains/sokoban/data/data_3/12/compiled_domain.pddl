(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos25 pos53 pos54 pos55 pos33 pos35 pos51 pos42 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_psi_1) (hold_2) (seen_psi_3) (hold_4) (seen_psi_5))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos54) (and (clear pos54) (not (= ?l_to pos54))) (seen_psi_1)) (or (= ?l_from pos25) (and (clear pos25) (not (= ?l_to pos25))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos54) (and (clear pos54) (not (= ?l_to pos54))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_to pos55)) (and (at_ player1 pos55) (not (and (= ?p player1) (= ?l_from pos55)))) (not (or (= ?l_from pos51) (and (clear pos51) (not (= ?l_to pos51)))))) (seen_psi_1)) (when (not (or (= ?l_from pos25) (and (clear pos25) (not (= ?l_to pos25))))) (hold_2)) (when (or (at_ stone1 pos42) (not (or (= ?l_from pos53) (and (clear pos53) (not (= ?l_to pos53)))))) (seen_psi_3)) (when (or (and (= ?p player1) (= ?l_to pos33)) (and (at_ player1 pos33) (not (and (= ?p player1) (= ?l_from pos33))))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))) (seen_psi_1)) (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))) (seen_psi_3)) (or (not (or (and (= ?s stone1) (= ?l_to pos35)) (and (at_ stone1 pos35) (not (and (= ?s stone1) (= ?l_from pos35)))))) (seen_psi_5)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_from pos55)) (and (at_ player1 pos55) (not (and (= ?p player1) (= ?l_p pos55)))) (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51)))))) (seen_psi_1)) (when (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))))) (hold_2)) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42)))) (not (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53)))))) (seen_psi_3)) (when (or (and (= ?s stone1) (= ?l_to pos35)) (and (at_ stone1 pos35) (not (and (= ?s stone1) (= ?l_from pos35))))) (hold_4)) (when (or (and (= ?p player1) (= ?l_from pos33)) (and (at_ player1 pos33) (not (and (= ?p player1) (= ?l_p pos33))))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))) (seen_psi_1)) (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))) (seen_psi_3)) (or (not (or (and (= ?s stone1) (= ?l_to pos35)) (and (at_ stone1 pos35) (not (and (= ?s stone1) (= ?l_from pos35)))))) (seen_psi_5)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (hold_0)) (when (or (and (= ?p player1) (= ?l_from pos55)) (and (at_ player1 pos55) (not (and (= ?p player1) (= ?l_p pos55)))) (not (or (= ?l_p pos51) (and (clear pos51) (not (= ?l_to pos51)))))) (seen_psi_1)) (when (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))))) (hold_2)) (when (or (and (= ?s stone1) (= ?l_to pos42)) (and (at_ stone1 pos42) (not (and (= ?s stone1) (= ?l_from pos42)))) (not (or (= ?l_p pos53) (and (clear pos53) (not (= ?l_to pos53)))))) (seen_psi_3)) (when (or (and (= ?s stone1) (= ?l_to pos35)) (and (at_ stone1 pos35) (not (and (= ?s stone1) (= ?l_from pos35))))) (hold_4)) (when (or (and (= ?p player1) (= ?l_from pos33)) (and (at_ player1 pos33) (not (and (= ?p player1) (= ?l_p pos33))))) (seen_psi_5)) (increase (total-cost) 1)))
)
