(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   grey_block_1 white_block_1 black_block_1 yellow_block_1 orange_block_1 red_block_1 red_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (seen_psi_2) (hold_3) (hold_4) (hold_5))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (clear red_block_2) (not (= ?obj red_block_2))) (seen_psi_2)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj black_block_1) (holding black_block_1)) (hold_0)) (when (not (and (clear red_block_2) (not (= ?obj red_block_2)))) (hold_1)) (when (and (or (= ?obj white_block_1) (holding white_block_1)) (ontable black_block_1) (not (= ?obj black_block_1))) (seen_psi_2)) (when (and (on yellow_block_1 red_block_1) (clear orange_block_1) (not (= ?obj orange_block_1))) (hold_3)) (when (and (clear grey_block_1) (not (= ?obj grey_block_1))) (hold_4)) (when (and (not (and (ontable orange_block_1) (not (= ?obj orange_block_1)))) (clear orange_block_1) (not (= ?obj orange_block_1))) (hold_5)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj red_block_2) (clear red_block_2) (seen_psi_2)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding black_block_1) (not (= ?obj black_block_1))) (hold_0)) (when (not (or (= ?obj red_block_2) (clear red_block_2))) (hold_1)) (when (and (holding white_block_1) (not (= ?obj white_block_1)) (or (= ?obj black_block_1) (ontable black_block_1))) (seen_psi_2)) (when (and (on yellow_block_1 red_block_1) (or (= ?obj orange_block_1) (clear orange_block_1))) (hold_3)) (when (or (= ?obj grey_block_1) (clear grey_block_1)) (hold_4)) (when (and (not (or (= ?obj orange_block_1) (ontable orange_block_1))) (or (= ?obj orange_block_1) (clear orange_block_1))) (hold_5)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj red_block_2) (and (clear red_block_2) (not (= ?underobj red_block_2))) (seen_psi_2)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding black_block_1) (not (= ?obj black_block_1))) (hold_0)) (when (not (or (= ?obj red_block_2) (and (clear red_block_2) (not (= ?underobj red_block_2))))) (hold_1)) (when (and (holding white_block_1) (not (= ?obj white_block_1)) (ontable black_block_1)) (seen_psi_2)) (when (and (or (and (= ?obj yellow_block_1) (= ?underobj red_block_1)) (on yellow_block_1 red_block_1)) (or (= ?obj orange_block_1) (and (clear orange_block_1) (not (= ?underobj orange_block_1))))) (hold_3)) (when (or (= ?obj grey_block_1) (and (clear grey_block_1) (not (= ?underobj grey_block_1)))) (hold_4)) (when (and (not (ontable orange_block_1)) (or (= ?obj orange_block_1) (and (clear orange_block_1) (not (= ?underobj orange_block_1))))) (hold_5)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj red_block_2) (and (clear red_block_2) (not (= ?obj red_block_2))) (seen_psi_2)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj black_block_1) (holding black_block_1)) (hold_0)) (when (not (or (= ?underobj red_block_2) (and (clear red_block_2) (not (= ?obj red_block_2))))) (hold_1)) (when (and (or (= ?obj white_block_1) (holding white_block_1)) (ontable black_block_1)) (seen_psi_2)) (when (and (on yellow_block_1 red_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj red_block_1))) (or (= ?underobj orange_block_1) (and (clear orange_block_1) (not (= ?obj orange_block_1))))) (hold_3)) (when (or (= ?underobj grey_block_1) (and (clear grey_block_1) (not (= ?obj grey_block_1)))) (hold_4)) (when (and (not (ontable orange_block_1)) (or (= ?underobj orange_block_1) (and (clear orange_block_1) (not (= ?obj orange_block_1))))) (hold_5)) (increase (total-cost) 1)))
)
