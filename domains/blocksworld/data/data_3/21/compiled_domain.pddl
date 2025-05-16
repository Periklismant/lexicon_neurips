(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   green_block_1 black_block_1 white_block_2 purple_block_1 black_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2) (hold_3))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (and (ontable green_block_1) (not (= ?obj green_block_1)))) (seen_psi_1)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (ontable green_block_1) (not (= ?obj green_block_1))) (hold_0)) (when (or (= ?obj black_block_1) (holding black_block_1) (on black_block_2 white_block_2)) (hold_2)) (when (and (or (= ?obj black_block_1) (holding black_block_1)) (on purple_block_1 green_block_1)) (hold_3)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (or (= ?obj green_block_1) (ontable green_block_1))) (seen_psi_1)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (or (= ?obj green_block_1) (ontable green_block_1)) (hold_0)) (when (or (and (holding black_block_1) (not (= ?obj black_block_1))) (on black_block_2 white_block_2)) (hold_2)) (when (and (holding black_block_1) (not (= ?obj black_block_1)) (on purple_block_1 green_block_1)) (hold_3)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (or (and (= ?obj black_block_1) (= ?underobj green_block_1)) (on black_block_1 green_block_1)) (seen_psi_1)) (when (or (and (holding black_block_1) (not (= ?obj black_block_1))) (and (= ?obj black_block_2) (= ?underobj white_block_2)) (on black_block_2 white_block_2)) (hold_2)) (when (and (holding black_block_1) (not (= ?obj black_block_1)) (or (and (= ?obj purple_block_1) (= ?underobj green_block_1)) (on purple_block_1 green_block_1))) (hold_3)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (on black_block_1 green_block_1) (not (and (= ?obj black_block_1) (= ?underobj green_block_1)))) (seen_psi_1)) (when (or (= ?obj black_block_1) (holding black_block_1) (and (on black_block_2 white_block_2) (not (and (= ?obj black_block_2) (= ?underobj white_block_2))))) (hold_2)) (when (and (or (= ?obj black_block_1) (holding black_block_1)) (on purple_block_1 green_block_1) (not (and (= ?obj purple_block_1) (= ?underobj green_block_1)))) (hold_3)) (increase (total-cost) 1)))
)
