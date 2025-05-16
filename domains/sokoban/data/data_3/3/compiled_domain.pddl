(define (domain liftedtcore_sokoban-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types
    location direction thing - object
    person stone - thing
 )
 (:constants
   pos25 pos12 pos22 pos41 pos34 - location
   player1 - person
 )
 (:predicates (movedir ?l_from - location ?l_to - location ?d - direction) (isnongoal ?l - location) (isgoal ?l - location) (clear ?l - location) (at_ ?t - thing ?l - location) (atgoal ?t - thing) (hold_0) (hold_1) (seen_phi_2) (hold_3) (seen_psi_4))
 (:functions (total-cost))
 (:action move
  :parameters ( ?p - person ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_from) (clear ?l_to) (movedir ?l_from ?l_to ?d) (or (= ?l_from pos34) (and (clear pos34) (not (= ?l_to pos34))) (not (seen_phi_2)) (not (clear pos34))) (or (= ?l_from pos12) (and (clear pos12) (not (= ?l_to pos12))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_to) (clear ?l_from) (when (or (and (= ?p player1) (= ?l_to pos25)) (and (at_ player1 pos25) (not (and (= ?p player1) (= ?l_from pos25))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_to pos25)) (and (at_ player1 pos25) (not (and (= ?p player1) (= ?l_from pos25))))) (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22))))) (not (hold_1))) (when (not (or (= ?l_from pos22) (and (clear pos22) (not (= ?l_to pos22))))) (hold_1)) (when (not (or (= ?l_from pos34) (and (clear pos34) (not (= ?l_to pos34))))) (seen_phi_2)) (when (not (or (= ?l_from pos12) (and (clear pos12) (not (= ?l_to pos12))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_to pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_from pos41))))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action pushtogoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isgoal ?l_to) (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))) (not (seen_phi_2)) (not (clear pos34))) (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (atgoal ?s) (when (or (and (= ?p player1) (= ?l_from pos25)) (and (at_ player1 pos25) (not (and (= ?p player1) (= ?l_p pos25))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_from pos25)) (and (at_ player1 pos25) (not (and (= ?p player1) (= ?l_p pos25))))) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (not (hold_1))) (when (not (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (hold_1)) (when (not (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (seen_phi_2)) (when (not (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action pushtonongoal
  :parameters ( ?p - person ?s - stone ?l_p - location ?l_from - location ?l_to - location ?d - direction)
  :precondition (and (at_ ?p ?l_p) (at_ ?s ?l_from) (clear ?l_to) (movedir ?l_p ?l_from ?d) (movedir ?l_from ?l_to ?d) (isnongoal ?l_to) (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))) (not (seen_phi_2)) (not (clear pos34))) (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))) (seen_psi_4)))
  :effect (and (not (at_ ?p ?l_p)) (not (at_ ?s ?l_from)) (not (clear ?l_to)) (at_ ?p ?l_from) (at_ ?s ?l_to) (clear ?l_p) (not (atgoal ?s)) (when (or (and (= ?p player1) (= ?l_from pos25)) (and (at_ player1 pos25) (not (and (= ?p player1) (= ?l_p pos25))))) (hold_0)) (when (and (or (and (= ?p player1) (= ?l_from pos25)) (and (at_ player1 pos25) (not (and (= ?p player1) (= ?l_p pos25))))) (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (not (hold_1))) (when (not (or (= ?l_p pos22) (and (clear pos22) (not (= ?l_to pos22))))) (hold_1)) (when (not (or (= ?l_p pos34) (and (clear pos34) (not (= ?l_to pos34))))) (seen_phi_2)) (when (not (or (= ?l_p pos12) (and (clear pos12) (not (= ?l_to pos12))))) (hold_3)) (when (or (and (= ?p player1) (= ?l_from pos41)) (and (at_ player1 pos41) (not (and (= ?p player1) (= ?l_p pos41))))) (seen_psi_4)) (increase (total-cost) 1)))
)
