(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   orange_block_1 green_block_2 green_block_1 red_block_1 black_block_1 black_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (or (= ?obj black_block_2) (holding black_block_2))) (seen_psi_1)) (not (and (ontable green_block_1) (not (= ?obj green_block_1)))))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj black_block_2) (holding black_block_2)) (hold_0)) (when (or (not (and (clear green_block_2) (not (= ?obj green_block_2)))) (= ?obj orange_block_1) (holding orange_block_1)) (seen_psi_1)) (when (or (on black_block_2 green_block_2) (not (and (ontable red_block_1) (not (= ?obj red_block_1))))) (hold_2)) (when (or (not (and (ontable orange_block_1) (not (= ?obj orange_block_1)))) (on green_block_1 red_block_1)) (hold_3)) (when (and (on black_block_2 black_block_1) (ontable green_block_2) (not (= ?obj green_block_2))) (hold_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (and (holding black_block_2) (not (= ?obj black_block_2)))) (seen_psi_1)) (not (or (= ?obj green_block_1) (ontable green_block_1))))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding black_block_2) (not (= ?obj black_block_2))) (hold_0)) (when (or (not (or (= ?obj green_block_2) (clear green_block_2))) (and (holding orange_block_1) (not (= ?obj orange_block_1)))) (seen_psi_1)) (when (or (on black_block_2 green_block_2) (not (or (= ?obj red_block_1) (ontable red_block_1)))) (hold_2)) (when (or (not (or (= ?obj orange_block_1) (ontable orange_block_1))) (on green_block_1 red_block_1)) (hold_3)) (when (and (on black_block_2 black_block_1) (or (= ?obj green_block_2) (ontable green_block_2))) (hold_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (and (holding black_block_2) (not (= ?obj black_block_2)))) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding black_block_2) (not (= ?obj black_block_2))) (hold_0)) (when (or (not (or (= ?obj green_block_2) (and (clear green_block_2) (not (= ?underobj green_block_2))))) (and (holding orange_block_1) (not (= ?obj orange_block_1)))) (seen_psi_1)) (when (or (and (= ?obj black_block_2) (= ?underobj green_block_2)) (on black_block_2 green_block_2) (not (ontable red_block_1))) (hold_2)) (when (or (not (ontable orange_block_1)) (and (= ?obj green_block_1) (= ?underobj red_block_1)) (on green_block_1 red_block_1)) (hold_3)) (when (and (or (and (= ?obj black_block_2) (= ?underobj black_block_1)) (on black_block_2 black_block_1)) (ontable green_block_2)) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?obj black_block_2) (holding black_block_2))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj black_block_2) (holding black_block_2)) (hold_0)) (when (or (not (or (= ?underobj green_block_2) (and (clear green_block_2) (not (= ?obj green_block_2))))) (= ?obj orange_block_1) (holding orange_block_1)) (seen_psi_1)) (when (or (and (on black_block_2 green_block_2) (not (and (= ?obj black_block_2) (= ?underobj green_block_2)))) (not (ontable red_block_1))) (hold_2)) (when (or (not (ontable orange_block_1)) (and (on green_block_1 red_block_1) (not (and (= ?obj green_block_1) (= ?underobj red_block_1))))) (hold_3)) (when (and (on black_block_2 black_block_1) (not (and (= ?obj black_block_2) (= ?underobj black_block_1))) (ontable green_block_2)) (hold_4)) (increase (total-cost) 1)))
)
