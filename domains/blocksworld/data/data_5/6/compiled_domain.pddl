(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   white_block_1 black_block_1 yellow_block_1 purple_block_1 orange_block_1 purple_block_2 brown_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2) (hold_3) (seen_psi_4) (hold_5) (hold_6))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (ontable orange_block_1) (not (= ?obj orange_block_1))) (seen_psi_1)) (or (and (clear orange_block_1) (not (= ?obj orange_block_1))) (seen_psi_4)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (ontable orange_block_1) (not (= ?obj orange_block_1)))) (hold_0)) (when (or (on yellow_block_1 white_block_1) (not (and (ontable black_block_1) (not (= ?obj black_block_1))))) (seen_psi_1)) (when (not (and (clear orange_block_1) (not (= ?obj orange_block_1)))) (hold_3)) (when (and (on purple_block_2 black_block_1) (ontable brown_block_1) (not (= ?obj brown_block_1))) (seen_psi_4)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_5)) (when (not (and (clear purple_block_2) (not (= ?obj purple_block_2)))) (hold_6)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj orange_block_1) (ontable orange_block_1) (seen_psi_1)) (or (= ?obj orange_block_1) (clear orange_block_1) (seen_psi_4)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj orange_block_1) (ontable orange_block_1))) (hold_0)) (when (or (on yellow_block_1 white_block_1) (not (or (= ?obj black_block_1) (ontable black_block_1)))) (seen_psi_1)) (when (not (or (= ?obj orange_block_1) (clear orange_block_1))) (hold_3)) (when (and (on purple_block_2 black_block_1) (or (= ?obj brown_block_1) (ontable brown_block_1))) (seen_psi_4)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_5)) (when (not (or (= ?obj purple_block_2) (clear purple_block_2))) (hold_6)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj orange_block_1) (and (clear orange_block_1) (not (= ?underobj orange_block_1))) (seen_psi_4)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (or (and (= ?obj yellow_block_1) (= ?underobj white_block_1)) (on yellow_block_1 white_block_1) (not (ontable black_block_1))) (seen_psi_1)) (when (or (and (= ?obj purple_block_1) (= ?underobj black_block_1)) (on purple_block_1 black_block_1) (and (= ?obj yellow_block_1) (= ?underobj purple_block_2)) (on yellow_block_1 purple_block_2)) (hold_2)) (when (not (or (= ?obj orange_block_1) (and (clear orange_block_1) (not (= ?underobj orange_block_1))))) (hold_3)) (when (and (or (and (= ?obj purple_block_2) (= ?underobj black_block_1)) (on purple_block_2 black_block_1)) (ontable brown_block_1)) (seen_psi_4)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_5)) (when (not (or (= ?obj purple_block_2) (and (clear purple_block_2) (not (= ?underobj purple_block_2))))) (hold_6)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj orange_block_1) (and (clear orange_block_1) (not (= ?obj orange_block_1))) (seen_psi_4)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (and (on yellow_block_1 white_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj white_block_1)))) (not (ontable black_block_1))) (seen_psi_1)) (when (or (and (on purple_block_1 black_block_1) (not (and (= ?obj purple_block_1) (= ?underobj black_block_1)))) (and (on yellow_block_1 purple_block_2) (not (and (= ?obj yellow_block_1) (= ?underobj purple_block_2))))) (hold_2)) (when (not (or (= ?underobj orange_block_1) (and (clear orange_block_1) (not (= ?obj orange_block_1))))) (hold_3)) (when (and (on purple_block_2 black_block_1) (not (and (= ?obj purple_block_2) (= ?underobj black_block_1))) (ontable brown_block_1)) (seen_psi_4)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_5)) (when (not (or (= ?underobj purple_block_2) (and (clear purple_block_2) (not (= ?obj purple_block_2))))) (hold_6)) (increase (total-cost) 1)))
)
