(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   yellow_block_1 grey_block_1 white_block_1 red_block_1 blue_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (hold_3) (seen_psi_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (clear red_block_1) (not (= ?obj red_block_1))) (seen_psi_4)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear grey_block_1) (not (= ?obj grey_block_1)))) (hold_2)) (when (not (and (clear red_block_1) (not (= ?obj red_block_1)))) (hold_3)) (when (or (on white_block_1 blue_block_1) (and (clear yellow_block_1) (not (= ?obj yellow_block_1)))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj red_block_1) (clear red_block_1) (seen_psi_4)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj grey_block_1) (clear grey_block_1))) (hold_2)) (when (not (or (= ?obj red_block_1) (clear red_block_1))) (hold_3)) (when (or (on white_block_1 blue_block_1) (= ?obj yellow_block_1) (clear yellow_block_1)) (seen_psi_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj red_block_1) (and (clear red_block_1) (not (= ?underobj red_block_1))) (seen_psi_4)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (and (= ?obj grey_block_1) (= ?underobj blue_block_1)) (on grey_block_1 blue_block_1))) (hold_0)) (when (and (not (or (and (= ?obj grey_block_1) (= ?underobj blue_block_1)) (on grey_block_1 blue_block_1))) (not (or (and (= ?obj yellow_block_1) (= ?underobj blue_block_1)) (on yellow_block_1 blue_block_1)))) (not (hold_1))) (when (or (and (= ?obj yellow_block_1) (= ?underobj blue_block_1)) (on yellow_block_1 blue_block_1)) (hold_1)) (when (not (or (= ?obj grey_block_1) (and (clear grey_block_1) (not (= ?underobj grey_block_1))))) (hold_2)) (when (not (or (= ?obj red_block_1) (and (clear red_block_1) (not (= ?underobj red_block_1))))) (hold_3)) (when (or (and (= ?obj white_block_1) (= ?underobj blue_block_1)) (on white_block_1 blue_block_1) (= ?obj yellow_block_1) (and (clear yellow_block_1) (not (= ?underobj yellow_block_1)))) (seen_psi_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj red_block_1) (and (clear red_block_1) (not (= ?obj red_block_1))) (seen_psi_4)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (and (on grey_block_1 blue_block_1) (not (and (= ?obj grey_block_1) (= ?underobj blue_block_1))))) (hold_0)) (when (and (not (and (on grey_block_1 blue_block_1) (not (and (= ?obj grey_block_1) (= ?underobj blue_block_1))))) (not (and (on yellow_block_1 blue_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj blue_block_1)))))) (not (hold_1))) (when (and (on yellow_block_1 blue_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj blue_block_1)))) (hold_1)) (when (not (or (= ?underobj grey_block_1) (and (clear grey_block_1) (not (= ?obj grey_block_1))))) (hold_2)) (when (not (or (= ?underobj red_block_1) (and (clear red_block_1) (not (= ?obj red_block_1))))) (hold_3)) (when (or (and (on white_block_1 blue_block_1) (not (and (= ?obj white_block_1) (= ?underobj blue_block_1)))) (= ?underobj yellow_block_1) (and (clear yellow_block_1) (not (= ?obj yellow_block_1)))) (seen_psi_4)) (increase (total-cost) 1)))
)
