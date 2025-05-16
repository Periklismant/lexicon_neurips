(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   purple_block_1 brown_block_1 brown_block_3 red_block_1 red_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (clear purple_block_1) (not (= ?obj purple_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear purple_block_1) (not (= ?obj purple_block_1)))) (hold_0)) (when (not (and (ontable red_block_2) (not (= ?obj red_block_2)))) (seen_psi_1)) (when (and (not (on brown_block_3 red_block_2)) (not (or (= ?obj brown_block_1) (holding brown_block_1)))) (not (hold_4))) (when (or (= ?obj brown_block_1) (holding brown_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj purple_block_1) (clear purple_block_1) (seen_psi_1)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj purple_block_1) (clear purple_block_1))) (hold_0)) (when (not (or (= ?obj red_block_2) (ontable red_block_2))) (seen_psi_1)) (when (and (not (on brown_block_3 red_block_2)) (not (and (holding brown_block_1) (not (= ?obj brown_block_1))))) (not (hold_4))) (when (and (holding brown_block_1) (not (= ?obj brown_block_1))) (hold_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1))) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (= ?obj purple_block_1) (and (clear purple_block_1) (not (= ?underobj purple_block_1))))) (hold_0)) (when (or (and (= ?obj purple_block_1) (= ?underobj red_block_1)) (on purple_block_1 red_block_1) (and (= ?obj brown_block_3) (= ?underobj brown_block_1)) (on brown_block_3 brown_block_1)) (hold_2)) (when (not (or (and (= ?obj brown_block_3) (= ?underobj red_block_2)) (on brown_block_3 red_block_2))) (hold_3)) (when (and (not (or (and (= ?obj brown_block_3) (= ?underobj red_block_2)) (on brown_block_3 red_block_2))) (not (and (holding brown_block_1) (not (= ?obj brown_block_1))))) (not (hold_4))) (when (and (holding brown_block_1) (not (= ?obj brown_block_1))) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (or (= ?underobj purple_block_1) (and (clear purple_block_1) (not (= ?obj purple_block_1))))) (hold_0)) (when (or (and (on purple_block_1 red_block_1) (not (and (= ?obj purple_block_1) (= ?underobj red_block_1)))) (and (on brown_block_3 brown_block_1) (not (and (= ?obj brown_block_3) (= ?underobj brown_block_1))))) (hold_2)) (when (not (and (on brown_block_3 red_block_2) (not (and (= ?obj brown_block_3) (= ?underobj red_block_2))))) (hold_3)) (when (and (not (and (on brown_block_3 red_block_2) (not (and (= ?obj brown_block_3) (= ?underobj red_block_2))))) (not (or (= ?obj brown_block_1) (holding brown_block_1)))) (not (hold_4))) (when (or (= ?obj brown_block_1) (holding brown_block_1)) (hold_4)) (increase (total-cost) 1)))
)
