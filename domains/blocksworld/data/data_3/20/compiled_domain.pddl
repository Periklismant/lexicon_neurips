(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   green_block_1 black_block_1 purple_block_1 blue_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (not (and (ontable purple_block_1) (not (= ?obj purple_block_1)))))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_0)) (when (and (or (= ?obj purple_block_1) (holding purple_block_1)) (ontable black_block_1) (not (= ?obj black_block_1))) (not (hold_1))) (when (not (and (ontable black_block_1) (not (= ?obj black_block_1)))) (hold_1)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (not (or (= ?obj purple_block_1) (ontable purple_block_1))))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_0)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1)) (or (= ?obj black_block_1) (ontable black_block_1))) (not (hold_1))) (when (not (or (= ?obj black_block_1) (ontable black_block_1))) (hold_1)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_0)) (when (and (holding purple_block_1) (not (= ?obj purple_block_1)) (ontable black_block_1)) (not (hold_1))) (when (or (and (= ?obj blue_block_1) (= ?underobj green_block_1)) (on blue_block_1 green_block_1)) (hold_2)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_0)) (when (and (or (= ?obj purple_block_1) (holding purple_block_1)) (ontable black_block_1)) (not (hold_1))) (when (and (on blue_block_1 green_block_1) (not (and (= ?obj blue_block_1) (= ?underobj green_block_1)))) (hold_2)) (increase (total-cost) 1)))
)
