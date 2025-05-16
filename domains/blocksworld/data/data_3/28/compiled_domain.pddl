(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   blue_block_3 white_block_1 white_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (clear white_block_1) (not (= ?obj white_block_1))) (seen_psi_3)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (ontable white_block_1) (not (= ?obj white_block_1)))) (hold_0)) (when (and (not (and (ontable white_block_1) (not (= ?obj white_block_1)))) (not (or (on blue_block_3 white_block_2) (and (ontable blue_block_3) (not (= ?obj blue_block_3)))))) (not (hold_1))) (when (or (on blue_block_3 white_block_2) (and (ontable blue_block_3) (not (= ?obj blue_block_3)))) (hold_1)) (when (not (and (clear white_block_1) (not (= ?obj white_block_1)))) (hold_2)) (when (or (= ?obj white_block_2) (holding white_block_2)) (seen_psi_3)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj white_block_1) (clear white_block_1) (seen_psi_3)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj white_block_1) (ontable white_block_1))) (hold_0)) (when (and (not (or (= ?obj white_block_1) (ontable white_block_1))) (not (or (on blue_block_3 white_block_2) (= ?obj blue_block_3) (ontable blue_block_3)))) (not (hold_1))) (when (or (on blue_block_3 white_block_2) (= ?obj blue_block_3) (ontable blue_block_3)) (hold_1)) (when (not (or (= ?obj white_block_1) (clear white_block_1))) (hold_2)) (when (and (holding white_block_2) (not (= ?obj white_block_2))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj white_block_1) (and (clear white_block_1) (not (= ?underobj white_block_1))) (seen_psi_3)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (not (ontable white_block_1)) (not (or (and (= ?obj blue_block_3) (= ?underobj white_block_2)) (on blue_block_3 white_block_2) (ontable blue_block_3)))) (not (hold_1))) (when (or (and (= ?obj blue_block_3) (= ?underobj white_block_2)) (on blue_block_3 white_block_2) (ontable blue_block_3)) (hold_1)) (when (not (or (= ?obj white_block_1) (and (clear white_block_1) (not (= ?underobj white_block_1))))) (hold_2)) (when (and (holding white_block_2) (not (= ?obj white_block_2))) (seen_psi_3)) (when (or (and (= ?obj blue_block_3) (= ?underobj white_block_2)) (on blue_block_3 white_block_2)) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj white_block_1) (and (clear white_block_1) (not (= ?obj white_block_1))) (seen_psi_3)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (not (ontable white_block_1)) (not (or (and (on blue_block_3 white_block_2) (not (and (= ?obj blue_block_3) (= ?underobj white_block_2)))) (ontable blue_block_3)))) (not (hold_1))) (when (or (and (on blue_block_3 white_block_2) (not (and (= ?obj blue_block_3) (= ?underobj white_block_2)))) (ontable blue_block_3)) (hold_1)) (when (not (or (= ?underobj white_block_1) (and (clear white_block_1) (not (= ?obj white_block_1))))) (hold_2)) (when (or (= ?obj white_block_2) (holding white_block_2)) (seen_psi_3)) (when (and (on blue_block_3 white_block_2) (not (and (= ?obj blue_block_3) (= ?underobj white_block_2)))) (hold_4)) (increase (total-cost) 1)))
)
