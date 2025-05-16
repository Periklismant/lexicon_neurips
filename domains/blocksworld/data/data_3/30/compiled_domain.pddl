(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   brown_block_1 grey_block_1 black_block_1 purple_block_2 purple_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (and (clear purple_block_1) (not (= ?obj purple_block_1)))) (seen_psi_1)) (not (and (ontable purple_block_2) (not (= ?obj purple_block_2)))))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (clear purple_block_1) (not (= ?obj purple_block_1))) (hold_0)) (when (or (= ?obj brown_block_1) (holding brown_block_1) (and (clear black_block_1) (not (= ?obj black_block_1)))) (seen_psi_1)) (when (or (= ?obj grey_block_1) (holding grey_block_1)) (hold_2)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (or (= ?obj purple_block_1) (clear purple_block_1))) (seen_psi_1)) (not (or (= ?obj purple_block_2) (ontable purple_block_2))))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (or (= ?obj purple_block_1) (clear purple_block_1)) (hold_0)) (when (or (and (holding brown_block_1) (not (= ?obj brown_block_1))) (= ?obj black_block_1) (clear black_block_1)) (seen_psi_1)) (when (and (holding grey_block_1) (not (= ?obj grey_block_1))) (hold_2)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1))))) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1)))) (hold_0)) (when (or (and (holding brown_block_1) (not (= ?obj brown_block_1))) (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1)))) (seen_psi_1)) (when (and (holding grey_block_1) (not (= ?obj grey_block_1))) (hold_2)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1))))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1)))) (hold_0)) (when (or (= ?obj brown_block_1) (holding brown_block_1) (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1)))) (seen_psi_1)) (when (or (= ?obj grey_block_1) (holding grey_block_1)) (hold_2)) (increase (total-cost) 1)))
)
