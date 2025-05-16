(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   yellow_block_1 blue_block_1 purple_block_1 black_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2) (seen_psi_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (or (= ?obj purple_block_1) (holding purple_block_1))) (seen_psi_1)) (or (and (clear purple_block_1) (not (= ?obj purple_block_1))) (seen_psi_3)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_0)) (when (and (ontable black_block_2) (not (= ?obj black_block_2))) (seen_psi_1)) (when (not (and (clear purple_block_1) (not (= ?obj purple_block_1)))) (hold_2)) (when (or (= ?obj purple_block_1) (holding purple_block_1) (not (and (clear black_block_2) (not (= ?obj black_block_2))))) (seen_psi_3)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1) (and (ontable blue_block_1) (not (= ?obj blue_block_1)))) (hold_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (and (holding purple_block_1) (not (= ?obj purple_block_1)))) (seen_psi_1)) (or (= ?obj purple_block_1) (clear purple_block_1) (seen_psi_3)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_0)) (when (or (= ?obj black_block_2) (ontable black_block_2)) (seen_psi_1)) (when (not (or (= ?obj purple_block_1) (clear purple_block_1))) (hold_2)) (when (or (and (holding purple_block_1) (not (= ?obj purple_block_1))) (not (or (= ?obj black_block_2) (clear black_block_2)))) (seen_psi_3)) (when (or (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (= ?obj blue_block_1) (ontable blue_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (and (holding purple_block_1) (not (= ?obj purple_block_1)))) (seen_psi_1)) (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1))) (seen_psi_3)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_0)) (when (not (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1))))) (hold_2)) (when (or (and (holding purple_block_1) (not (= ?obj purple_block_1))) (not (or (= ?obj black_block_2) (and (clear black_block_2) (not (= ?underobj black_block_2)))))) (seen_psi_3)) (when (or (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (ontable blue_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?obj purple_block_1) (holding purple_block_1))) (seen_psi_1)) (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1))) (seen_psi_3)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_0)) (when (not (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1))))) (hold_2)) (when (or (= ?obj purple_block_1) (holding purple_block_1) (not (or (= ?underobj black_block_2) (and (clear black_block_2) (not (= ?obj black_block_2)))))) (seen_psi_3)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1) (ontable blue_block_1)) (hold_4)) (increase (total-cost) 1)))
)
