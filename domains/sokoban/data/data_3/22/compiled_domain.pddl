(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos25 pos41 pos32 pos24 pos31 - location
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (seen_phi_0) (seen_phi_1) (hold_2) (hold_3))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24))) (not (seen_phi_0)) (not (clear pos24))) (or (= ?l_from pos25) (and (clear pos25) (not (= ?l_to pos25))) (not (seen_phi_1)) (not (clear pos25))))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (not (or (= ?l_from pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_phi_0)) (when (not (or (= ?l_from pos25) (and (clear pos25) (not (= ?l_to pos25))))) (seen_phi_1)) (when (not (or (= ?l_from pos32) (and (clear pos32) (not (= ?l_to pos32))))) (hold_2)) (when (and (not (or (= ?l_from pos32) (and (clear pos32) (not (= ?l_to pos32))))) (not (or (not (or (= ?l_from pos31) (and (clear pos31) (not (= ?l_to pos31))))) (and (= ?p player1) (= ?l_to pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_from pos41))))))) (not (hold_3))) (when (or (not (or (= ?l_from pos31) (and (clear pos31) (not (= ?l_to pos31))))) (and (= ?p player1) (= ?l_to pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_from pos41))))) (hold_3)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))) (not (seen_phi_0)) (not (clear pos24))) (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))) (not (seen_phi_1)) (not (clear pos25))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_phi_0)) (when (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))))) (seen_phi_1)) (when (not (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))))) (hold_2)) (when (and (not (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))))) (not (or (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))))) (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))))) (not (hold_3))) (when (or (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))))) (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))) (hold_3)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))) (not (seen_phi_0)) (not (clear pos24))) (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))) (not (seen_phi_1)) (not (clear pos25))))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (not (or (= ?l_p pos24) (and (clear pos24) (not (= ?l_to pos24))))) (seen_phi_0)) (when (not (or (= ?l_p pos25) (and (clear pos25) (not (= ?l_to pos25))))) (seen_phi_1)) (when (not (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))))) (hold_2)) (when (and (not (or (= ?l_p pos32) (and (clear pos32) (not (= ?l_to pos32))))) (not (or (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))))) (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))))) (not (hold_3))) (when (or (not (or (= ?l_p pos31) (and (clear pos31) (not (= ?l_to pos31))))) (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))) (hold_3)) (increase (total-cost) 1)))
)
