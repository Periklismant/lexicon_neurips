(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos33 pos22 pos24 pos21 - location
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (seen_phi_0) (hold_1) (hold_2) (hold_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos33) (and (clear pos33) (not (= ?l_to pos33))) (not (seen_phi_0)) (not (clear pos33))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos33) (and (clear pos33) (not (= ?l_to pos33))))) (seen_phi_0)) (when (or (and (= ?p player1) (= ?l_to pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_from pos24))))) (hold_1)) (when (and (or (and (= ?p player1) (= ?l_to pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_from pos24))))) (not (or (and (= ?p player1) (= ?l_to pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_from pos22))))))) (not (hold_2))) (when (or (and (= ?p player1) (= ?l_to pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_from pos22))))) (hold_2)) (when (not (or (= ?l_from pos21) (and (clear pos21) (not (= ?l_to pos21))))) (hold_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))) (not (seen_phi_0)) (not (clear pos33))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (seen_phi_0)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (hold_1)) (when (and (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (not (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22))))))) (not (hold_2))) (when (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22))))) (hold_2)) (when (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21))))) (hold_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))) (not (seen_phi_0)) (not (clear pos33))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos33) (and (clear pos33) (not (= ?l_to pos33))))) (seen_phi_0)) (when (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (hold_1)) (when (and (or (and (= ?p player1) (= ?l_from pos24)) (and (at_ player1 pos24) (not (and (= ?p player1) (= ?l_p pos24))))) (not (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22))))))) (not (hold_2))) (when (or (and (= ?p player1) (= ?l_from pos22)) (and (at_ player1 pos22) (not (and (= ?p player1) (= ?l_p pos22))))) (hold_2)) (when (not (or (= ?l_p pos21) (and (clear pos21) (not (= ?l_to pos21))))) (hold_3)) (increase (total-cost) 1)))
)
