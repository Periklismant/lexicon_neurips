(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos12 pos41 pos54 pos11 pos35 pos14 pos45 pos42 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos45) (and (clear pos45) (not (= ?l_to pos45))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos41) (and (clear pos41) (not (= ?l_to pos41))))) (hold_0)) (when (and (not (or (= ?l_from pos41) (and (clear pos41) (not (= ?l_to pos41))))) (not (or (and (= ?p player1) (= ?l_to pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_from pos14)))) (and (= ?p player1) (= ?l_to pos12)) (and (at_ player1 pos12) (not (and (= ?p player1) (= ?l_from pos12))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_to pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_from pos14)))) (and (= ?p player1) (= ?l_to pos12)) (and (at_ player1 pos12) (not (and (= ?p player1) (= ?l_from pos12))))) (hold_1)) (when (not (or (= ?l_from pos45) (and (clear pos45) (not (= ?l_to pos45))))) (hold_2)) (when (or (not (or (= ?l_from pos11) (and (clear pos11) (not (= ?l_to pos11))))) (at_ stone1 pos35)) (seen_psi_3)) (when (and (not (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42))))) (not (or (= ?l_from pos54) (and (clear pos54) (not (= ?l_to pos54)))))) (hold_4)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (hold_0)) (when (and (not (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (not (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14)))) (and (= ?p player1) (= ?l_from pos12)) (and (at_ player1 pos12) (not (and (= ?p player1) (= ?l_p pos12))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14)))) (and (= ?p player1) (= ?l_from pos12)) (and (at_ player1 pos12) (not (and (= ?p player1) (= ?l_p pos12))))) (hold_1)) (when (not (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45))))) (hold_2)) (when (or (not (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))))) (and (= ?s stone1) (= ?l_to pos35)) (and (at_ stone1 pos35) (not (and (= ?s stone1) (= ?l_from pos35))))) (seen_psi_3)) (when (and (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54)))))) (hold_4)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45))) (seen_psi_3)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (hold_0)) (when (and (not (or (= ?l_p pos41) (and (clear pos41) (not (= ?l_to pos41))))) (not (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14)))) (and (= ?p player1) (= ?l_from pos12)) (and (at_ player1 pos12) (not (and (= ?p player1) (= ?l_p pos12))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14)))) (and (= ?p player1) (= ?l_from pos12)) (and (at_ player1 pos12) (not (and (= ?p player1) (= ?l_p pos12))))) (hold_1)) (when (not (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45))))) (hold_2)) (when (or (not (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))))) (and (= ?s stone1) (= ?l_to pos35)) (and (at_ stone1 pos35) (not (and (= ?s stone1) (= ?l_from pos35))))) (seen_psi_3)) (when (and (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (not (or (= ?l_p pos54) (and (clear pos54) (not (= ?l_to pos54)))))) (hold_4)) (increase (total-cost) 1)))
)
