(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   black_block_1 grey_block_1 yellow_block_3 green_block_2 yellow_block_1 yellow_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (seen_psi_5))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (not (and (ontable yellow_block_3) (not (= ?obj yellow_block_3)))) (or (not (and (clear green_block_2) (not (= ?obj green_block_2)))) (seen_psi_5)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj grey_block_1) (holding grey_block_1) (on grey_block_1 yellow_block_3)) (hold_0)) (when (and (not (on black_block_1 grey_block_1)) (ontable black_block_1) (not (= ?obj black_block_1))) (not (hold_2))) (when (not (and (ontable black_block_1) (not (= ?obj black_block_1)))) (hold_2)) (when (and (clear green_block_2) (not (= ?obj green_block_2))) (hold_4)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1) (not (on yellow_block_2 yellow_block_1))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (not (or (= ?obj yellow_block_3) (ontable yellow_block_3))) (or (not (or (= ?obj green_block_2) (clear green_block_2))) (seen_psi_5)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (or (and (holding grey_block_1) (not (= ?obj grey_block_1))) (on grey_block_1 yellow_block_3)) (hold_0)) (when (and (not (on black_block_1 grey_block_1)) (or (= ?obj black_block_1) (ontable black_block_1))) (not (hold_2))) (when (not (or (= ?obj black_block_1) (ontable black_block_1))) (hold_2)) (when (or (= ?obj green_block_2) (clear green_block_2)) (hold_4)) (when (or (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (not (on yellow_block_2 yellow_block_1))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (or (= ?obj green_block_2) (and (clear green_block_2) (not (= ?underobj green_block_2))))) (seen_psi_5)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (or (and (holding grey_block_1) (not (= ?obj grey_block_1))) (and (= ?obj grey_block_1) (= ?underobj yellow_block_3)) (on grey_block_1 yellow_block_3)) (hold_0)) (when (not (or (and (= ?obj black_block_1) (= ?underobj grey_block_1)) (on black_block_1 grey_block_1))) (hold_1)) (when (and (not (or (and (= ?obj black_block_1) (= ?underobj grey_block_1)) (on black_block_1 grey_block_1))) (ontable black_block_1)) (not (hold_2))) (when (or (and (= ?obj yellow_block_1) (= ?underobj grey_block_1)) (on yellow_block_1 grey_block_1)) (hold_3)) (when (or (= ?obj green_block_2) (and (clear green_block_2) (not (= ?underobj green_block_2)))) (hold_4)) (when (or (and (holding yellow_block_1) (not (= ?obj yellow_block_1))) (not (or (and (= ?obj yellow_block_2) (= ?underobj yellow_block_1)) (on yellow_block_2 yellow_block_1)))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?underobj green_block_2) (and (clear green_block_2) (not (= ?obj green_block_2))))) (seen_psi_5)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj grey_block_1) (holding grey_block_1) (and (on grey_block_1 yellow_block_3) (not (and (= ?obj grey_block_1) (= ?underobj yellow_block_3))))) (hold_0)) (when (not (and (on black_block_1 grey_block_1) (not (and (= ?obj black_block_1) (= ?underobj grey_block_1))))) (hold_1)) (when (and (not (and (on black_block_1 grey_block_1) (not (and (= ?obj black_block_1) (= ?underobj grey_block_1))))) (ontable black_block_1)) (not (hold_2))) (when (and (on yellow_block_1 grey_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj grey_block_1)))) (hold_3)) (when (or (= ?underobj green_block_2) (and (clear green_block_2) (not (= ?obj green_block_2)))) (hold_4)) (when (or (= ?obj yellow_block_1) (holding yellow_block_1) (not (and (on yellow_block_2 yellow_block_1) (not (and (= ?obj yellow_block_2) (= ?underobj yellow_block_1)))))) (seen_psi_5)) (increase (total-cost) 1)))
)
