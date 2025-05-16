(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos42 pos33 pos11 pos24 pos44 pos22 pos31 - location
   stone1 - stone
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (seen_psi_1) (seen_phi_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42))) (seen_psi_1)) (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22)))) (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24))) (not (seen_phi_2)) (not (clear pos24))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos42) (and (clear pos42) (not (= ?l_to pos42))))) (hold_0)) (when (or (at_ stone1 pos44) (and (= ?p player1) (= ?l_to pos42)) (and (at_ player1 pos42) (not (and (= ?p player1) (= ?l_from pos42))))) (seen_psi_1)) (when (not (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_phi_2)) (when (or (not (or (= ?l_from pos11) (and (clear pos11) (not (= ?l_to pos11))))) (at_ stone1 pos33)) (hold_3)) (when (or (and (= ?p player1) (= ?l_to pos31)) (and (at_ player1 pos31) (not (and (= ?p player1) (= ?l_from pos31)))) (at_ stone1 pos33)) (hold_4)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))) (seen_psi_1)) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22)))) (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))) (not (seen_phi_2)) (not (clear pos24))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (hold_0)) (when (or (and (= ?s stone1) (= ?l_to pos44)) (and (at_ stone1 pos44) (not (and (= ?s stone1) (= ?l_from pos44)))) (and (= ?p player1) (= ?l_from pos42)) (and (at_ player1 pos42) (not (and (= ?p player1) (= ?l_p pos42))))) (seen_psi_1)) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_phi_2)) (when (or (not (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))))) (and (= ?s stone1) (= ?l_to pos33)) (and (at_ stone1 pos33) (not (and (= ?s stone1) (= ?l_from pos33))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_from pos31)) (and (at_ player1 pos31) (not (and (= ?p player1) (= ?l_p pos31)))) (and (= ?s stone1) (= ?l_to pos33)) (and (at_ stone1 pos33) (not (and (= ?s stone1) (= ?l_from pos33))))) (hold_4)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))) (seen_psi_1)) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22)))) (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))) (not (seen_phi_2)) (not (clear pos24))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos42) (and (clear pos42) (not (= ?l_to pos42))))) (hold_0)) (when (or (and (= ?s stone1) (= ?l_to pos44)) (and (at_ stone1 pos44) (not (and (= ?s stone1) (= ?l_from pos44)))) (and (= ?p player1) (= ?l_from pos42)) (and (at_ player1 pos42) (not (and (= ?p player1) (= ?l_p pos42))))) (seen_psi_1)) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_phi_2)) (when (or (not (or (= ?l_p pos11) (and (clear pos11) (not (= ?l_to pos11))))) (and (= ?s stone1) (= ?l_to pos33)) (and (at_ stone1 pos33) (not (and (= ?s stone1) (= ?l_from pos33))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_from pos31)) (and (at_ player1 pos31) (not (and (= ?p player1) (= ?l_p pos31)))) (and (= ?s stone1) (= ?l_to pos33)) (and (at_ stone1 pos33) (not (and (= ?s stone1) (= ?l_from pos33))))) (hold_4)) (increase (total-cost) 1)))
)
