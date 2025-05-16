(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   black_block_1 orange_block_1 white_block_1 red_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (and (clear white_block_1) (not (= ?obj white_block_1)))) (seen_psi_3)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (ontable black_block_1) (not (= ?obj black_block_1)))) (hold_0)) (when (and (not (and (ontable black_block_1) (not (= ?obj black_block_1)))) (not (and (clear red_block_1) (not (= ?obj red_block_1))))) (not (hold_1))) (when (and (clear red_block_1) (not (= ?obj red_block_1))) (hold_1)) (when (and (clear white_block_1) (not (= ?obj white_block_1))) (hold_2)) (when (and (clear orange_block_1) (not (= ?obj orange_block_1))) (seen_psi_3)) (when (or (= ?obj orange_block_1) (holding orange_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (or (= ?obj white_block_1) (clear white_block_1))) (seen_psi_3)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj black_block_1) (ontable black_block_1))) (hold_0)) (when (and (not (or (= ?obj black_block_1) (ontable black_block_1))) (not (or (= ?obj red_block_1) (clear red_block_1)))) (not (hold_1))) (when (or (= ?obj red_block_1) (clear red_block_1)) (hold_1)) (when (or (= ?obj white_block_1) (clear white_block_1)) (hold_2)) (when (or (= ?obj orange_block_1) (clear orange_block_1)) (seen_psi_3)) (when (and (holding orange_block_1) (not (= ?obj orange_block_1))) (hold_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (or (= ?obj white_block_1) (and (clear white_block_1) (not (= ?underobj white_block_1))))) (seen_psi_3)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (not (ontable black_block_1)) (not (or (= ?obj red_block_1) (and (clear red_block_1) (not (= ?underobj red_block_1)))))) (not (hold_1))) (when (or (= ?obj red_block_1) (and (clear red_block_1) (not (= ?underobj red_block_1)))) (hold_1)) (when (or (= ?obj white_block_1) (and (clear white_block_1) (not (= ?underobj white_block_1)))) (hold_2)) (when (or (= ?obj orange_block_1) (and (clear orange_block_1) (not (= ?underobj orange_block_1)))) (seen_psi_3)) (when (and (holding orange_block_1) (not (= ?obj orange_block_1))) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?underobj white_block_1) (and (clear white_block_1) (not (= ?obj white_block_1))))) (seen_psi_3)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (not (ontable black_block_1)) (not (or (= ?underobj red_block_1) (and (clear red_block_1) (not (= ?obj red_block_1)))))) (not (hold_1))) (when (or (= ?underobj red_block_1) (and (clear red_block_1) (not (= ?obj red_block_1)))) (hold_1)) (when (or (= ?underobj white_block_1) (and (clear white_block_1) (not (= ?obj white_block_1)))) (hold_2)) (when (or (= ?underobj orange_block_1) (and (clear orange_block_1) (not (= ?obj orange_block_1)))) (seen_psi_3)) (when (or (= ?obj orange_block_1) (holding orange_block_1)) (hold_4)) (increase (total-cost) 1)))
)
