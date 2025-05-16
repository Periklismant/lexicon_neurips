(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   black_block_1 yellow_block_1 orange_block_1 white_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (ontable orange_block_1) (not (= ?obj orange_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (ontable orange_block_1) (not (= ?obj orange_block_1)))) (hold_0)) (when (or (on yellow_block_1 white_block_1) (not (and (ontable black_block_1) (not (= ?obj black_block_1))))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj orange_block_1) (ontable orange_block_1) (seen_psi_1)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj orange_block_1) (ontable orange_block_1))) (hold_0)) (when (or (on yellow_block_1 white_block_1) (not (or (= ?obj black_block_1) (ontable black_block_1)))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (or (and (= ?obj yellow_block_1) (= ?underobj white_block_1)) (on yellow_block_1 white_block_1) (not (ontable black_block_1))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (and (on yellow_block_1 white_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj white_block_1)))) (not (ontable black_block_1))) (seen_psi_1)) (increase (total-cost) 1)))
)
