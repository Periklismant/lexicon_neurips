(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   brown_block_2 brown_block_1 black_block_3 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj brown_block_2) (holding brown_block_2)) (seen_psi_1)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding brown_block_2) (not (= ?obj brown_block_2))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (and (= ?obj black_block_3) (= ?underobj brown_block_1)) (on black_block_3 brown_block_1) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (and (= ?obj black_block_3) (= ?underobj brown_block_1)) (on black_block_3 brown_block_1))) (hold_0)) (when (and (holding brown_block_2) (not (= ?obj brown_block_2))) (seen_psi_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (and (on black_block_3 brown_block_1) (not (and (= ?obj black_block_3) (= ?underobj brown_block_1)))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (and (on black_block_3 brown_block_1) (not (and (= ?obj black_block_3) (= ?underobj brown_block_1))))) (hold_0)) (when (or (= ?obj brown_block_2) (holding brown_block_2)) (seen_psi_1)) (increase (total-cost) 1)))
)
