(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   brown_block_1 green_block_1 black_block_1 brown_block_2 black_block_3 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj brown_block_2) (holding brown_block_2)) (seen_psi_1)) (when (and (not (on green_block_1 green_block_1)) (not (or (= ?obj black_block_1) (holding black_block_1) (on green_block_1 black_block_1)))) (not (hold_3))) (when (or (= ?obj black_block_1) (holding black_block_1) (on green_block_1 black_block_1)) (hold_3)) (when (or (and (clear green_block_1) (not (= ?obj green_block_1))) (on brown_block_1 black_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding brown_block_2) (not (= ?obj brown_block_2))) (seen_psi_1)) (when (and (not (on green_block_1 green_block_1)) (not (or (and (holding black_block_1) (not (= ?obj black_block_1))) (on green_block_1 black_block_1)))) (not (hold_3))) (when (or (and (holding black_block_1) (not (= ?obj black_block_1))) (on green_block_1 black_block_1)) (hold_3)) (when (or (= ?obj green_block_1) (clear green_block_1) (on brown_block_1 black_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (and (= ?obj black_block_3) (= ?underobj brown_block_1)) (on black_block_3 brown_block_1) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (and (= ?obj black_block_3) (= ?underobj brown_block_1)) (on black_block_3 brown_block_1))) (hold_0)) (when (and (holding brown_block_2) (not (= ?obj brown_block_2))) (seen_psi_1)) (when (not (or (and (= ?obj green_block_1) (= ?underobj green_block_1)) (on green_block_1 green_block_1))) (hold_2)) (when (and (not (or (and (= ?obj green_block_1) (= ?underobj green_block_1)) (on green_block_1 green_block_1))) (not (or (and (holding black_block_1) (not (= ?obj black_block_1))) (and (= ?obj green_block_1) (= ?underobj black_block_1)) (on green_block_1 black_block_1)))) (not (hold_3))) (when (or (and (holding black_block_1) (not (= ?obj black_block_1))) (and (= ?obj green_block_1) (= ?underobj black_block_1)) (on green_block_1 black_block_1)) (hold_3)) (when (or (= ?obj green_block_1) (and (clear green_block_1) (not (= ?underobj green_block_1))) (and (= ?obj brown_block_1) (= ?underobj black_block_1)) (on brown_block_1 black_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (and (on black_block_3 brown_block_1) (not (and (= ?obj black_block_3) (= ?underobj brown_block_1)))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (and (on black_block_3 brown_block_1) (not (and (= ?obj black_block_3) (= ?underobj brown_block_1))))) (hold_0)) (when (or (= ?obj brown_block_2) (holding brown_block_2)) (seen_psi_1)) (when (not (and (on green_block_1 green_block_1) (not (and (= ?obj green_block_1) (= ?underobj green_block_1))))) (hold_2)) (when (and (not (and (on green_block_1 green_block_1) (not (and (= ?obj green_block_1) (= ?underobj green_block_1))))) (not (or (= ?obj black_block_1) (holding black_block_1) (and (on green_block_1 black_block_1) (not (and (= ?obj green_block_1) (= ?underobj black_block_1))))))) (not (hold_3))) (when (or (= ?obj black_block_1) (holding black_block_1) (and (on green_block_1 black_block_1) (not (and (= ?obj green_block_1) (= ?underobj black_block_1))))) (hold_3)) (when (or (= ?underobj green_block_1) (and (clear green_block_1) (not (= ?obj green_block_1))) (and (on brown_block_1 black_block_1) (not (and (= ?obj brown_block_1) (= ?underobj black_block_1))))) (hold_4)) (increase (total-cost) 1)))
)
