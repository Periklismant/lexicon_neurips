(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   red_block_1 orange_block_1 white_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (and (ontable orange_block_1) (not (= ?obj orange_block_1)))) (seen_psi_1)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (ontable orange_block_1) (not (= ?obj orange_block_1))) (hold_0)) (when (or (and (clear red_block_1) (not (= ?obj red_block_1))) (= ?obj white_block_2) (holding white_block_2)) (seen_psi_1)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (or (= ?obj orange_block_1) (ontable orange_block_1))) (seen_psi_1)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (or (= ?obj orange_block_1) (ontable orange_block_1)) (hold_0)) (when (or (= ?obj red_block_1) (clear red_block_1) (and (holding white_block_2) (not (= ?obj white_block_2)))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (or (= ?obj red_block_1) (and (clear red_block_1) (not (= ?underobj red_block_1))) (and (holding white_block_2) (not (= ?obj white_block_2)))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?underobj red_block_1) (and (clear red_block_1) (not (= ?obj red_block_1))) (= ?obj white_block_2) (holding white_block_2)) (seen_psi_1)) (increase (total-cost) 1)))
)
