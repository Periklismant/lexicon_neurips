(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   purple_block_1 green_block_1 yellow_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj green_block_1) (holding green_block_1)) (hold_0)) (when (and (or (= ?obj green_block_1) (holding green_block_1)) (not (on yellow_block_1 purple_block_1))) (not (hold_1))) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding green_block_1) (not (= ?obj green_block_1))) (hold_0)) (when (and (holding green_block_1) (not (= ?obj green_block_1)) (not (on yellow_block_1 purple_block_1))) (not (hold_1))) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding green_block_1) (not (= ?obj green_block_1))) (hold_0)) (when (and (holding green_block_1) (not (= ?obj green_block_1)) (not (or (and (= ?obj yellow_block_1) (= ?underobj purple_block_1)) (on yellow_block_1 purple_block_1)))) (not (hold_1))) (when (or (and (= ?obj yellow_block_1) (= ?underobj purple_block_1)) (on yellow_block_1 purple_block_1)) (hold_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj green_block_1) (holding green_block_1)) (hold_0)) (when (and (or (= ?obj green_block_1) (holding green_block_1)) (not (and (on yellow_block_1 purple_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj purple_block_1)))))) (not (hold_1))) (when (and (on yellow_block_1 purple_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj purple_block_1)))) (hold_1)) (increase (total-cost) 1)))
)
