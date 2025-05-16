(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   green_block_1 brown_block_1 white_block_1 orange_block_1 yellow_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (seen_psi_5))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (clear brown_block_1) (not (= ?obj brown_block_1))) (seen_psi_3)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (ontable green_block_1) (not (= ?obj green_block_1)))) (hold_0)) (when (and (not (and (ontable green_block_1) (not (= ?obj green_block_1)))) (not (and (clear white_block_1) (not (= ?obj white_block_1))))) (not (hold_1))) (when (and (clear white_block_1) (not (= ?obj white_block_1))) (hold_1)) (when (not (and (clear brown_block_1) (not (= ?obj brown_block_1)))) (hold_2)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1) (= ?obj white_block_1) (holding white_block_1)) (seen_psi_5)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj brown_block_1) (clear brown_block_1) (seen_psi_3)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj green_block_1) (ontable green_block_1))) (hold_0)) (when (and (not (or (= ?obj green_block_1) (ontable green_block_1))) (not (or (= ?obj white_block_1) (clear white_block_1)))) (not (hold_1))) (when (or (= ?obj white_block_1) (clear white_block_1)) (hold_1)) (when (not (or (= ?obj brown_block_1) (clear brown_block_1))) (hold_2)) (when (or (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (and (holding white_block_1) (not (= ?obj white_block_1)))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj brown_block_1) (and (clear brown_block_1) (not (= ?underobj brown_block_1))) (seen_psi_3)) (or (and (= ?obj brown_block_1) (= ?underobj green_block_1)) (on brown_block_1 green_block_1) (seen_psi_5)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (not (ontable green_block_1)) (not (or (= ?obj white_block_1) (and (clear white_block_1) (not (= ?underobj white_block_1)))))) (not (hold_1))) (when (or (= ?obj white_block_1) (and (clear white_block_1) (not (= ?underobj white_block_1)))) (hold_1)) (when (not (or (= ?obj brown_block_1) (and (clear brown_block_1) (not (= ?underobj brown_block_1))))) (hold_2)) (when (or (and (= ?obj yellow_block_1) (= ?underobj orange_block_1)) (on yellow_block_1 orange_block_1)) (seen_psi_3)) (when (not (or (and (= ?obj brown_block_1) (= ?underobj green_block_1)) (on brown_block_1 green_block_1))) (hold_4)) (when (or (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (and (holding white_block_1) (not (= ?obj white_block_1)))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj brown_block_1) (and (clear brown_block_1) (not (= ?obj brown_block_1))) (seen_psi_3)) (or (and (on brown_block_1 green_block_1) (not (and (= ?obj brown_block_1) (= ?underobj green_block_1)))) (seen_psi_5)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (not (ontable green_block_1)) (not (or (= ?underobj white_block_1) (and (clear white_block_1) (not (= ?obj white_block_1)))))) (not (hold_1))) (when (or (= ?underobj white_block_1) (and (clear white_block_1) (not (= ?obj white_block_1)))) (hold_1)) (when (not (or (= ?underobj brown_block_1) (and (clear brown_block_1) (not (= ?obj brown_block_1))))) (hold_2)) (when (and (on yellow_block_1 orange_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj orange_block_1)))) (seen_psi_3)) (when (not (and (on brown_block_1 green_block_1) (not (and (= ?obj brown_block_1) (= ?underobj green_block_1))))) (hold_4)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1) (= ?obj white_block_1) (holding white_block_1)) (seen_psi_5)) (increase (total-cost) 1)))
)
