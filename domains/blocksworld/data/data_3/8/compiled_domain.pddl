(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   purple_block_2 blue_block_1 red_block_1 green_block_1 white_block_1 purple_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (hold_3))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj blue_block_1) (holding blue_block_1)) (hold_0)) (when (or (on green_block_1 purple_block_2) (= ?obj white_block_1) (holding white_block_1)) (hold_1)) (when (and (ontable red_block_1) (not (= ?obj red_block_1))) (hold_2)) (when (and (ontable red_block_1) (not (= ?obj red_block_1)) (not (or (and (ontable purple_block_1) (not (= ?obj purple_block_1))) (and (ontable purple_block_2) (not (= ?obj purple_block_2)))))) (not (hold_3))) (when (or (and (ontable purple_block_1) (not (= ?obj purple_block_1))) (and (ontable purple_block_2) (not (= ?obj purple_block_2)))) (hold_3)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding blue_block_1) (not (= ?obj blue_block_1))) (hold_0)) (when (or (on green_block_1 purple_block_2) (and (holding white_block_1) (not (= ?obj white_block_1)))) (hold_1)) (when (or (= ?obj red_block_1) (ontable red_block_1)) (hold_2)) (when (and (or (= ?obj red_block_1) (ontable red_block_1)) (not (or (= ?obj purple_block_1) (ontable purple_block_1) (= ?obj purple_block_2) (ontable purple_block_2)))) (not (hold_3))) (when (or (= ?obj purple_block_1) (ontable purple_block_1) (= ?obj purple_block_2) (ontable purple_block_2)) (hold_3)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding blue_block_1) (not (= ?obj blue_block_1))) (hold_0)) (when (or (and (= ?obj green_block_1) (= ?underobj purple_block_2)) (on green_block_1 purple_block_2) (and (holding white_block_1) (not (= ?obj white_block_1)))) (hold_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj blue_block_1) (holding blue_block_1)) (hold_0)) (when (or (and (on green_block_1 purple_block_2) (not (and (= ?obj green_block_1) (= ?underobj purple_block_2)))) (= ?obj white_block_1) (holding white_block_1)) (hold_1)) (increase (total-cost) 1)))
)
