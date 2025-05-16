(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   brown_block_1 blue_block_1 black_block_1 red_block_1 black_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (hold_3))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear black_block_2) (not (= ?obj black_block_2)))) (hold_0)) (when (and (not (on black_block_1 brown_block_1)) (not (or (not (and (ontable red_block_1) (not (= ?obj red_block_1)))) (not (and (clear brown_block_1) (not (= ?obj brown_block_1))))))) (not (hold_2))) (when (or (not (and (ontable red_block_1) (not (= ?obj red_block_1)))) (not (and (clear brown_block_1) (not (= ?obj brown_block_1))))) (hold_2)) (when (or (= ?obj blue_block_1) (holding blue_block_1)) (hold_3)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj black_block_2) (clear black_block_2))) (hold_0)) (when (and (not (on black_block_1 brown_block_1)) (not (or (not (or (= ?obj red_block_1) (ontable red_block_1))) (not (or (= ?obj brown_block_1) (clear brown_block_1)))))) (not (hold_2))) (when (or (not (or (= ?obj red_block_1) (ontable red_block_1))) (not (or (= ?obj brown_block_1) (clear brown_block_1)))) (hold_2)) (when (and (holding blue_block_1) (not (= ?obj blue_block_1))) (hold_3)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (= ?obj black_block_2) (and (clear black_block_2) (not (= ?underobj black_block_2))))) (hold_0)) (when (not (or (and (= ?obj black_block_1) (= ?underobj brown_block_1)) (on black_block_1 brown_block_1))) (hold_1)) (when (and (not (or (and (= ?obj black_block_1) (= ?underobj brown_block_1)) (on black_block_1 brown_block_1))) (not (or (not (ontable red_block_1)) (not (or (= ?obj brown_block_1) (and (clear brown_block_1) (not (= ?underobj brown_block_1)))))))) (not (hold_2))) (when (or (not (ontable red_block_1)) (not (or (= ?obj brown_block_1) (and (clear brown_block_1) (not (= ?underobj brown_block_1)))))) (hold_2)) (when (and (holding blue_block_1) (not (= ?obj blue_block_1))) (hold_3)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (or (= ?underobj black_block_2) (and (clear black_block_2) (not (= ?obj black_block_2))))) (hold_0)) (when (not (and (on black_block_1 brown_block_1) (not (and (= ?obj black_block_1) (= ?underobj brown_block_1))))) (hold_1)) (when (and (not (and (on black_block_1 brown_block_1) (not (and (= ?obj black_block_1) (= ?underobj brown_block_1))))) (not (or (not (ontable red_block_1)) (not (or (= ?underobj brown_block_1) (and (clear brown_block_1) (not (= ?obj brown_block_1)))))))) (not (hold_2))) (when (or (not (ontable red_block_1)) (not (or (= ?underobj brown_block_1) (and (clear brown_block_1) (not (= ?obj brown_block_1)))))) (hold_2)) (when (or (= ?obj blue_block_1) (holding blue_block_1)) (hold_3)) (increase (total-cost) 1)))
)
