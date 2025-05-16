(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   black_block_2 green_block_1 purple_block_1 black_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (not (and (ontable purple_block_1) (not (= ?obj purple_block_1)))) (or (= ?obj green_block_1) (holding green_block_1))) (hold_0)) (when (and (not (on purple_block_1 black_block_2)) (not (or (= ?obj black_block_1) (holding black_block_1)))) (not (hold_2))) (when (or (= ?obj black_block_1) (holding black_block_1)) (hold_2)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (not (or (= ?obj purple_block_1) (ontable purple_block_1))) (holding green_block_1) (not (= ?obj green_block_1))) (hold_0)) (when (and (not (on purple_block_1 black_block_2)) (not (and (holding black_block_1) (not (= ?obj black_block_1))))) (not (hold_2))) (when (and (holding black_block_1) (not (= ?obj black_block_1))) (hold_2)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (not (ontable purple_block_1)) (holding green_block_1) (not (= ?obj green_block_1))) (hold_0)) (when (not (or (and (= ?obj purple_block_1) (= ?underobj black_block_2)) (on purple_block_1 black_block_2))) (hold_1)) (when (and (not (or (and (= ?obj purple_block_1) (= ?underobj black_block_2)) (on purple_block_1 black_block_2))) (not (and (holding black_block_1) (not (= ?obj black_block_1))))) (not (hold_2))) (when (and (holding black_block_1) (not (= ?obj black_block_1))) (hold_2)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (not (ontable purple_block_1)) (or (= ?obj green_block_1) (holding green_block_1))) (hold_0)) (when (not (and (on purple_block_1 black_block_2) (not (and (= ?obj purple_block_1) (= ?underobj black_block_2))))) (hold_1)) (when (and (not (and (on purple_block_1 black_block_2) (not (and (= ?obj purple_block_1) (= ?underobj black_block_2))))) (not (or (= ?obj black_block_1) (holding black_block_1)))) (not (hold_2))) (when (or (= ?obj black_block_1) (holding black_block_1)) (hold_2)) (increase (total-cost) 1)))
)
