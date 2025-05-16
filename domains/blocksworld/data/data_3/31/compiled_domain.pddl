(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   black_block_2 brown_block_1 yellow_block_1 black_block_1 orange_block_1 red_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (seen_psi_3))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (not (and (ontable black_block_2) (not (= ?obj black_block_2)))) (or (not (and (clear orange_block_1) (not (= ?obj orange_block_1)))) (seen_psi_3)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear black_block_1) (not (= ?obj black_block_1)))) (hold_0)) (when (and (not (and (clear black_block_1) (not (= ?obj black_block_1)))) (not (or (not (and (clear brown_block_1) (not (= ?obj brown_block_1)))) (= ?obj red_block_1) (holding red_block_1)))) (not (hold_1))) (when (or (not (and (clear brown_block_1) (not (= ?obj brown_block_1)))) (= ?obj red_block_1) (holding red_block_1)) (hold_1)) (when (and (clear orange_block_1) (not (= ?obj orange_block_1))) (hold_2)) (when (or (not (and (clear yellow_block_1) (not (= ?obj yellow_block_1)))) (and (ontable orange_block_1) (not (= ?obj orange_block_1)))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (not (or (= ?obj black_block_2) (ontable black_block_2))) (or (not (or (= ?obj orange_block_1) (clear orange_block_1))) (seen_psi_3)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj black_block_1) (clear black_block_1))) (hold_0)) (when (and (not (or (= ?obj black_block_1) (clear black_block_1))) (not (or (not (or (= ?obj brown_block_1) (clear brown_block_1))) (and (holding red_block_1) (not (= ?obj red_block_1)))))) (not (hold_1))) (when (or (not (or (= ?obj brown_block_1) (clear brown_block_1))) (and (holding red_block_1) (not (= ?obj red_block_1)))) (hold_1)) (when (or (= ?obj orange_block_1) (clear orange_block_1)) (hold_2)) (when (or (not (or (= ?obj yellow_block_1) (clear yellow_block_1))) (= ?obj orange_block_1) (ontable orange_block_1)) (seen_psi_3)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (or (= ?obj orange_block_1) (and (clear orange_block_1) (not (= ?underobj orange_block_1))))) (seen_psi_3)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1))))) (hold_0)) (when (and (not (or (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1))))) (not (or (not (or (= ?obj brown_block_1) (and (clear brown_block_1) (not (= ?underobj brown_block_1))))) (and (holding red_block_1) (not (= ?obj red_block_1)))))) (not (hold_1))) (when (or (not (or (= ?obj brown_block_1) (and (clear brown_block_1) (not (= ?underobj brown_block_1))))) (and (holding red_block_1) (not (= ?obj red_block_1)))) (hold_1)) (when (or (= ?obj orange_block_1) (and (clear orange_block_1) (not (= ?underobj orange_block_1)))) (hold_2)) (when (or (not (or (= ?obj yellow_block_1) (and (clear yellow_block_1) (not (= ?underobj yellow_block_1))))) (ontable orange_block_1)) (seen_psi_3)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?underobj orange_block_1) (and (clear orange_block_1) (not (= ?obj orange_block_1))))) (seen_psi_3)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (or (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1))))) (hold_0)) (when (and (not (or (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1))))) (not (or (not (or (= ?underobj brown_block_1) (and (clear brown_block_1) (not (= ?obj brown_block_1))))) (= ?obj red_block_1) (holding red_block_1)))) (not (hold_1))) (when (or (not (or (= ?underobj brown_block_1) (and (clear brown_block_1) (not (= ?obj brown_block_1))))) (= ?obj red_block_1) (holding red_block_1)) (hold_1)) (when (or (= ?underobj orange_block_1) (and (clear orange_block_1) (not (= ?obj orange_block_1)))) (hold_2)) (when (or (not (or (= ?underobj yellow_block_1) (and (clear yellow_block_1) (not (= ?obj yellow_block_1))))) (ontable orange_block_1)) (seen_psi_3)) (increase (total-cost) 1)))
)
