(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos52 pos11 pos45 pos55 pos14 - location
   player1 - person
   stone1 - stone
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (seen_phi_2))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos45) (and (clear pos45) (not (= ?l_to pos45)))) (or (= ?l_from pos55) (and (clear pos55) (not (= ?l_to pos55))) (not (seen_phi_2)) (not (clear pos55))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (or (and (= ?p player1) (= ?l_to pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_from pos14))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_to pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_from pos14))))) (not (or (and (= ?p player1) (= ?l_to pos11)) (and (at_ player1 pos11) (not (and (= ?p player1) (= ?l_from pos11)))) (at_ stone1 pos52)))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_to pos11)) (and (at_ player1 pos11) (not (and (= ?p player1) (= ?l_from pos11)))) (at_ stone1 pos52)) (hold_1)) (when (not (or (= ?l_from pos55) (and (clear pos55) (not (= ?l_to pos55))))) (seen_phi_2)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45)))) (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))) (not (seen_phi_2)) (not (clear pos55))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (not (or (and (= ?p player1) (= ?l_from pos11)) (and (at_ player1 pos11) (not (and (= ?p player1) (= ?l_p pos11)))) (and (= ?s stone1) (= ?l_to pos52)) (and (at_ stone1 pos52) (not (and (= ?s stone1) (= ?l_from pos52))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_from pos11)) (and (at_ player1 pos11) (not (and (= ?p player1) (= ?l_p pos11)))) (and (= ?s stone1) (= ?l_to pos52)) (and (at_ stone1 pos52) (not (and (= ?s stone1) (= ?l_from pos52))))) (hold_1)) (when (not (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))))) (seen_phi_2)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos45) (and (clear pos45) (not (= ?l_to pos45)))) (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))) (not (seen_phi_2)) (not (clear pos55))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_from pos14)) (and (at_ player1 pos14) (not (and (= ?p player1) (= ?l_p pos14))))) (not (or (and (= ?p player1) (= ?l_from pos11)) (and (at_ player1 pos11) (not (and (= ?p player1) (= ?l_p pos11)))) (and (= ?s stone1) (= ?l_to pos52)) (and (at_ stone1 pos52) (not (and (= ?s stone1) (= ?l_from pos52))))))) (not (hold_1))) (when (or (and (= ?p player1) (= ?l_from pos11)) (and (at_ player1 pos11) (not (and (= ?p player1) (= ?l_p pos11)))) (and (= ?s stone1) (= ?l_to pos52)) (and (at_ stone1 pos52) (not (and (= ?s stone1) (= ?l_from pos52))))) (hold_1)) (when (not (or (= ?l_p pos55) (and (clear pos55) (not (= ?l_to pos55))))) (seen_phi_2)) (increase (total-cost) 1)))
)
