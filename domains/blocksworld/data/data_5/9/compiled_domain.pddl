(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   grey_block_1 blue_block_1 orange_block_1 green_block_1 red_block_1 orange_block_3 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (seen_psi_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (not (and (ontable red_block_1) (not (= ?obj red_block_1)))) (or (not (or (= ?obj red_block_1) (holding red_block_1))) (seen_psi_2)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (ontable orange_block_3) (not (= ?obj orange_block_3))) (hold_0)) (when (or (= ?obj red_block_1) (holding red_block_1)) (hold_1)) (when (or (= ?obj orange_block_3) (holding orange_block_3)) (seen_psi_2)) (when (or (not (and (ontable green_block_1) (not (= ?obj green_block_1)))) (and (clear grey_block_1) (not (= ?obj grey_block_1)))) (hold_3)) (when (or (and (ontable blue_block_1) (not (= ?obj blue_block_1))) (on grey_block_1 orange_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (not (or (= ?obj red_block_1) (ontable red_block_1))) (or (not (and (holding red_block_1) (not (= ?obj red_block_1)))) (seen_psi_2)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (or (= ?obj orange_block_3) (ontable orange_block_3)) (hold_0)) (when (and (holding red_block_1) (not (= ?obj red_block_1))) (hold_1)) (when (and (holding orange_block_3) (not (= ?obj orange_block_3))) (seen_psi_2)) (when (or (not (or (= ?obj green_block_1) (ontable green_block_1))) (= ?obj grey_block_1) (clear grey_block_1)) (hold_3)) (when (or (= ?obj blue_block_1) (ontable blue_block_1) (on grey_block_1 orange_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (and (holding red_block_1) (not (= ?obj red_block_1)))) (seen_psi_2)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding red_block_1) (not (= ?obj red_block_1))) (hold_1)) (when (and (holding orange_block_3) (not (= ?obj orange_block_3))) (seen_psi_2)) (when (or (not (ontable green_block_1)) (= ?obj grey_block_1) (and (clear grey_block_1) (not (= ?underobj grey_block_1)))) (hold_3)) (when (or (ontable blue_block_1) (and (= ?obj grey_block_1) (= ?underobj orange_block_1)) (on grey_block_1 orange_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?obj red_block_1) (holding red_block_1))) (seen_psi_2)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj red_block_1) (holding red_block_1)) (hold_1)) (when (or (= ?obj orange_block_3) (holding orange_block_3)) (seen_psi_2)) (when (or (not (ontable green_block_1)) (= ?underobj grey_block_1) (and (clear grey_block_1) (not (= ?obj grey_block_1)))) (hold_3)) (when (or (ontable blue_block_1) (and (on grey_block_1 orange_block_1) (not (and (= ?obj grey_block_1) (= ?underobj orange_block_1))))) (hold_4)) (increase (total-cost) 1)))
)
