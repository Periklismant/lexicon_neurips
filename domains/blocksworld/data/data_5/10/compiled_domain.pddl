(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   red_block_3 brown_block_3 red_block_1 red_block_2 blue_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (not (or (= ?obj blue_block_1) (holding blue_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (or (= ?obj blue_block_1) (holding blue_block_1)) (hold_0)) (when (and (not (on red_block_2 red_block_3)) (not (and (clear red_block_2) (not (= ?obj red_block_2))))) (not (hold_3))) (when (and (clear red_block_2) (not (= ?obj red_block_2))) (hold_3)) (when (or (= ?obj red_block_2) (holding red_block_2) (not (and (ontable red_block_1) (not (= ?obj red_block_1))))) (hold_4)) (when (or (and (ontable blue_block_1) (not (= ?obj blue_block_1))) (= ?obj brown_block_3) (holding brown_block_3)) (hold_5)) (when (or (and (ontable red_block_3) (not (= ?obj red_block_3))) (= ?obj red_block_1) (holding red_block_1)) (hold_6)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (not (and (holding blue_block_1) (not (= ?obj blue_block_1)))) (seen_psi_1)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding blue_block_1) (not (= ?obj blue_block_1))) (hold_0)) (when (and (not (on red_block_2 red_block_3)) (not (or (= ?obj red_block_2) (clear red_block_2)))) (not (hold_3))) (when (or (= ?obj red_block_2) (clear red_block_2)) (hold_3)) (when (or (and (holding red_block_2) (not (= ?obj red_block_2))) (not (or (= ?obj red_block_1) (ontable red_block_1)))) (hold_4)) (when (or (= ?obj blue_block_1) (ontable blue_block_1) (and (holding brown_block_3) (not (= ?obj brown_block_3)))) (hold_5)) (when (or (= ?obj red_block_3) (ontable red_block_3) (and (holding red_block_1) (not (= ?obj red_block_1)))) (hold_6)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (not (and (holding blue_block_1) (not (= ?obj blue_block_1)))) (seen_psi_1)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding blue_block_1) (not (= ?obj blue_block_1))) (hold_0)) (when (or (and (= ?obj brown_block_3) (= ?underobj red_block_3)) (on brown_block_3 red_block_3)) (seen_psi_1)) (when (not (or (and (= ?obj red_block_2) (= ?underobj red_block_3)) (on red_block_2 red_block_3))) (hold_2)) (when (and (not (or (and (= ?obj red_block_2) (= ?underobj red_block_3)) (on red_block_2 red_block_3))) (not (or (= ?obj red_block_2) (and (clear red_block_2) (not (= ?underobj red_block_2)))))) (not (hold_3))) (when (or (= ?obj red_block_2) (and (clear red_block_2) (not (= ?underobj red_block_2)))) (hold_3)) (when (or (and (holding red_block_2) (not (= ?obj red_block_2))) (not (ontable red_block_1))) (hold_4)) (when (or (ontable blue_block_1) (and (holding brown_block_3) (not (= ?obj brown_block_3)))) (hold_5)) (when (or (ontable red_block_3) (and (holding red_block_1) (not (= ?obj red_block_1)))) (hold_6)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (not (or (= ?obj blue_block_1) (holding blue_block_1))) (seen_psi_1)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (or (= ?obj blue_block_1) (holding blue_block_1)) (hold_0)) (when (and (on brown_block_3 red_block_3) (not (and (= ?obj brown_block_3) (= ?underobj red_block_3)))) (seen_psi_1)) (when (not (and (on red_block_2 red_block_3) (not (and (= ?obj red_block_2) (= ?underobj red_block_3))))) (hold_2)) (when (and (not (and (on red_block_2 red_block_3) (not (and (= ?obj red_block_2) (= ?underobj red_block_3))))) (not (or (= ?underobj red_block_2) (and (clear red_block_2) (not (= ?obj red_block_2)))))) (not (hold_3))) (when (or (= ?underobj red_block_2) (and (clear red_block_2) (not (= ?obj red_block_2)))) (hold_3)) (when (or (= ?obj red_block_2) (holding red_block_2) (not (ontable red_block_1))) (hold_4)) (when (or (ontable blue_block_1) (= ?obj brown_block_3) (holding brown_block_3)) (hold_5)) (when (or (ontable red_block_3) (= ?obj red_block_1) (holding red_block_1)) (hold_6)) (increase (total-cost) 1)))
)
