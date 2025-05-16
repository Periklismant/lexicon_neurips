(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   green_block_2 brown_block_1 purple_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (clear purple_block_1) (not (= ?obj purple_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear purple_block_1) (not (= ?obj purple_block_1)))) (hold_0)) (when (or (and (clear brown_block_1) (not (= ?obj brown_block_1))) (on green_block_2 purple_block_1)) (seen_psi_1)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj purple_block_1) (clear purple_block_1) (seen_psi_1)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj purple_block_1) (clear purple_block_1))) (hold_0)) (when (or (= ?obj brown_block_1) (clear brown_block_1) (on green_block_2 purple_block_1)) (seen_psi_1)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1))) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1))))) (hold_0)) (when (or (= ?obj brown_block_1) (and (clear brown_block_1) (not (= ?underobj brown_block_1))) (and (= ?obj green_block_2) (= ?underobj purple_block_1)) (on green_block_2 purple_block_1)) (seen_psi_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1))))) (hold_0)) (when (or (= ?underobj brown_block_1) (and (clear brown_block_1) (not (= ?obj brown_block_1))) (and (on green_block_2 purple_block_1) (not (and (= ?obj green_block_2) (= ?underobj purple_block_1))))) (seen_psi_1)) (increase (total-cost) 1)))
)
