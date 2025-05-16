(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   brown_block_1 yellow_block_1 grey_block_2 black_block_1 blue_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (seen_psi_3))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (not (and (ontable grey_block_2) (not (= ?obj grey_block_2)))) (or (not (and (clear black_block_1) (not (= ?obj black_block_1)))) (seen_psi_3)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear yellow_block_1) (not (= ?obj yellow_block_1)))) (hold_0)) (when (and (not (and (clear yellow_block_1) (not (= ?obj yellow_block_1)))) (not (or (on black_block_1 brown_block_1) (= ?obj black_block_1) (holding black_block_1)))) (not (hold_1))) (when (or (on black_block_1 brown_block_1) (= ?obj black_block_1) (holding black_block_1)) (hold_1)) (when (and (clear black_block_1) (not (= ?obj black_block_1))) (hold_2)) (when (or (not (and (ontable yellow_block_1) (not (= ?obj yellow_block_1)))) (and (clear blue_block_1) (not (= ?obj blue_block_1)))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (not (or (= ?obj grey_block_2) (ontable grey_block_2))) (or (not (or (= ?obj black_block_1) (clear black_block_1))) (seen_psi_3)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj yellow_block_1) (clear yellow_block_1))) (hold_0)) (when (and (not (or (= ?obj yellow_block_1) (clear yellow_block_1))) (not (or (on black_block_1 brown_block_1) (and (holding black_block_1) (not (= ?obj black_block_1)))))) (not (hold_1))) (when (or (on black_block_1 brown_block_1) (and (holding black_block_1) (not (= ?obj black_block_1)))) (hold_1)) (when (or (= ?obj black_block_1) (clear black_block_1)) (hold_2)) (when (or (not (or (= ?obj yellow_block_1) (ontable yellow_block_1))) (= ?obj blue_block_1) (clear blue_block_1)) (seen_psi_3)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (or (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1))))) (seen_psi_3)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (= ?obj yellow_block_1) (and (clear yellow_block_1) (not (= ?underobj yellow_block_1))))) (hold_0)) (when (and (not (or (= ?obj yellow_block_1) (and (clear yellow_block_1) (not (= ?underobj yellow_block_1))))) (not (or (and (= ?obj black_block_1) (= ?underobj brown_block_1)) (on black_block_1 brown_block_1) (and (holding black_block_1) (not (= ?obj black_block_1)))))) (not (hold_1))) (when (or (and (= ?obj black_block_1) (= ?underobj brown_block_1)) (on black_block_1 brown_block_1) (and (holding black_block_1) (not (= ?obj black_block_1)))) (hold_1)) (when (or (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1)))) (hold_2)) (when (or (not (ontable yellow_block_1)) (= ?obj blue_block_1) (and (clear blue_block_1) (not (= ?underobj blue_block_1)))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1))))) (seen_psi_3)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (or (= ?underobj yellow_block_1) (and (clear yellow_block_1) (not (= ?obj yellow_block_1))))) (hold_0)) (when (and (not (or (= ?underobj yellow_block_1) (and (clear yellow_block_1) (not (= ?obj yellow_block_1))))) (not (or (and (on black_block_1 brown_block_1) (not (and (= ?obj black_block_1) (= ?underobj brown_block_1)))) (= ?obj black_block_1) (holding black_block_1)))) (not (hold_1))) (when (or (and (on black_block_1 brown_block_1) (not (and (= ?obj black_block_1) (= ?underobj brown_block_1)))) (= ?obj black_block_1) (holding black_block_1)) (hold_1)) (when (or (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1)))) (hold_2)) (when (or (not (ontable yellow_block_1)) (= ?underobj blue_block_1) (and (clear blue_block_1) (not (= ?obj blue_block_1)))) (seen_psi_3)) (increase (total-cost) 1)))
)
