(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   yellow_block_1 white_block_1 purple_block_2 purple_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (or (= ?obj white_block_1) (holding white_block_1))) (seen_psi_1)) (not (and (ontable yellow_block_1) (not (= ?obj yellow_block_1)))))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj white_block_1) (holding white_block_1)) (hold_0)) (when (or (= ?obj purple_block_2) (holding purple_block_2)) (seen_psi_1)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_2)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (and (holding white_block_1) (not (= ?obj white_block_1)))) (seen_psi_1)) (not (or (= ?obj yellow_block_1) (ontable yellow_block_1))))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding white_block_1) (not (= ?obj white_block_1))) (hold_0)) (when (and (holding purple_block_2) (not (= ?obj purple_block_2))) (seen_psi_1)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_2)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (and (holding white_block_1) (not (= ?obj white_block_1)))) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding white_block_1) (not (= ?obj white_block_1))) (hold_0)) (when (and (holding purple_block_2) (not (= ?obj purple_block_2))) (seen_psi_1)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_2)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?obj white_block_1) (holding white_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj white_block_1) (holding white_block_1)) (hold_0)) (when (or (= ?obj purple_block_2) (holding purple_block_2)) (seen_psi_1)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_2)) (increase (total-cost) 1)))
)
