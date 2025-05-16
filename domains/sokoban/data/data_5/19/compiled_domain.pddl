(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos31 pos25 pos54 pos55 pos44 pos52 pos21 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (seen_phi_0) (hold_1) (seen_psi_2) (hold_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos55) (and (clear pos55) (not (= ?l_to pos55)))) (or (= ?l_from pos54) (and (clear pos54) (not (= ?l_to pos54))) (not (seen_phi_0)) (not (clear pos54))) (or (= ?l_from pos52) (and (clear pos52) (not (= ?l_to pos52)))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos54) (and (clear pos54) (not (= ?l_to pos54))))) (seen_phi_0)) (when (or (and (= ?p player1) (= ?l_to pos54)) (and (at_ player1 pos54) (not (and (= ?p player1) (= ?l_from pos54)))) (not (or (= ?l_from pos25) (and (clear pos25) (not (= ?l_to pos25)))))) (seen_psi_2)) (when (and (or (and (= ?p player1) (= ?l_to pos21)) (and (at_ player1 pos21) (not (and (= ?p player1) (= ?l_from pos21))))) (not (or (= ?l_from pos31) (and (clear pos31) (not (= ?l_to pos31)))))) (hold_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55)))) (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))) (not (seen_phi_0)) (not (clear pos54))) (or (not (or (and (= ?s stone1) (= ?l_to pos44)) (and (at_ stone1 pos44) (not (and (= ?s stone1) (= ?l_from pos44)))))) (seen_psi_2)) (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52)))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (seen_phi_0)) (when (or (and (= ?s stone1) (= ?l_to pos44)) (and (at_ stone1 pos44) (not (and (= ?s stone1) (= ?l_from pos44))))) (hold_1)) (when (or (and (= ?p player1) (= ?l_from pos54)) (and (at_ player1 pos54) (not (and (= ?p player1) (= ?l_p pos54)))) (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25)))))) (seen_psi_2)) (when (and (or (and (= ?p player1) (= ?l_from pos21)) (and (at_ player1 pos21) (not (and (= ?p player1) (= ?l_p pos21))))) (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31)))))) (hold_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55)))) (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))) (not (seen_phi_0)) (not (clear pos54))) (or (not (or (and (= ?s stone1) (= ?l_to pos44)) (and (at_ stone1 pos44) (not (and (= ?s stone1) (= ?l_from pos44)))))) (seen_psi_2)) (or (= ?l_p pos52) (and (clear pos52) (not (= ?l_to pos52)))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54))))) (seen_phi_0)) (when (or (and (= ?s stone1) (= ?l_to pos44)) (and (at_ stone1 pos44) (not (and (= ?s stone1) (= ?l_from pos44))))) (hold_1)) (when (or (and (= ?p player1) (= ?l_from pos54)) (and (at_ player1 pos54) (not (and (= ?p player1) (= ?l_p pos54)))) (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25)))))) (seen_psi_2)) (when (and (or (and (= ?p player1) (= ?l_from pos21)) (and (at_ player1 pos21) (not (and (= ?p player1) (= ?l_p pos21))))) (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31)))))) (hold_3)) (increase (total-cost) 1)))
)
