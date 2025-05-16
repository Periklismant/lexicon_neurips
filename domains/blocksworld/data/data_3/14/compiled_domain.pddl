(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   purple_block_2 brown_block_1 yellow_block_1 grey_block_2 grey_block_1 purple_block_1 yellow_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (seen_psi_2))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (not (and (ontable yellow_block_2) (not (= ?obj yellow_block_2)))) (or (not (or (= ?obj yellow_block_1) (holding yellow_block_1))) (seen_psi_2)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1)) (hold_1)) (when (or (not (and (ontable purple_block_2) (not (= ?obj purple_block_2)))) (= ?obj purple_block_2) (holding purple_block_2)) (seen_psi_2)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (not (or (= ?obj yellow_block_2) (ontable yellow_block_2))) (or (not (and (holding yellow_block_1) (not (= ?obj yellow_block_1)))) (seen_psi_2)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (hold_1)) (when (or (not (or (= ?obj purple_block_2) (ontable purple_block_2))) (and (holding purple_block_2) (not (= ?obj purple_block_2)))) (seen_psi_2)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (and (holding yellow_block_1) (not (= ?obj yellow_block_1)))) (seen_psi_2)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (or (and (= ?obj purple_block_1) (= ?underobj brown_block_1)) (on purple_block_1 brown_block_1)) (or (and (= ?obj grey_block_2) (= ?underobj grey_block_1)) (on grey_block_2 grey_block_1))) (hold_0)) (when (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (hold_1)) (when (or (not (ontable purple_block_2)) (and (holding purple_block_2) (not (= ?obj purple_block_2)))) (seen_psi_2)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?obj yellow_block_1) (holding yellow_block_1))) (seen_psi_2)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (on purple_block_1 brown_block_1) (not (and (= ?obj purple_block_1) (= ?underobj brown_block_1))) (on grey_block_2 grey_block_1) (not (and (= ?obj grey_block_2) (= ?underobj grey_block_1)))) (hold_0)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1)) (hold_1)) (when (or (not (ontable purple_block_2)) (= ?obj purple_block_2) (holding purple_block_2)) (seen_psi_2)) (increase (total-cost) 1)))
)
