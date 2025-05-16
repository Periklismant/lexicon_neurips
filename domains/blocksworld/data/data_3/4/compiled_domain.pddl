(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   orange_block_1 orange_block_2 red_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear orange_block_2) (not (= ?obj orange_block_2)))) (hold_0)) (when (not (and (ontable orange_block_1) (not (= ?obj orange_block_1)))) (hold_1)) (when (and (or (= ?obj red_block_1) (holding red_block_1)) (not (and (clear orange_block_2) (not (= ?obj orange_block_2))))) (hold_2)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj orange_block_2) (clear orange_block_2))) (hold_0)) (when (not (or (= ?obj orange_block_1) (ontable orange_block_1))) (hold_1)) (when (and (holding red_block_1) (not (= ?obj red_block_1)) (not (or (= ?obj orange_block_2) (clear orange_block_2)))) (hold_2)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (= ?obj orange_block_2) (and (clear orange_block_2) (not (= ?underobj orange_block_2))))) (hold_0)) (when (and (holding red_block_1) (not (= ?obj red_block_1)) (not (or (= ?obj orange_block_2) (and (clear orange_block_2) (not (= ?underobj orange_block_2)))))) (hold_2)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (or (= ?underobj orange_block_2) (and (clear orange_block_2) (not (= ?obj orange_block_2))))) (hold_0)) (when (and (or (= ?obj red_block_1) (holding red_block_1)) (not (or (= ?underobj orange_block_2) (and (clear orange_block_2) (not (= ?obj orange_block_2)))))) (hold_2)) (increase (total-cost) 1)))
)
