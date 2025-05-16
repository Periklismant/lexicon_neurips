(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   white_block_1 grey_block_1 yellow_block_1 yellow_block_2 blue_block_1 black_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (seen_psi_5))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (ontable blue_block_1) (not (= ?obj blue_block_1))) (seen_psi_5)))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (or (= ?obj grey_block_1) (holding grey_block_1)) (on blue_block_1 black_block_1)) (hold_0)) (when (and (clear grey_block_1) (not (= ?obj grey_block_1))) (hold_1)) (when (or (on grey_block_1 white_block_1) (and (clear yellow_block_1) (not (= ?obj yellow_block_1)))) (hold_2)) (when (and (not (and (ontable yellow_block_1) (not (= ?obj yellow_block_1)))) (not (and (clear black_block_1) (not (= ?obj black_block_1))))) (hold_3)) (when (not (and (ontable blue_block_1) (not (= ?obj blue_block_1)))) (hold_4)) (when (not (and (clear yellow_block_2) (not (= ?obj yellow_block_2)))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj blue_block_1) (ontable blue_block_1) (seen_psi_5)))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding grey_block_1) (not (= ?obj grey_block_1)) (on blue_block_1 black_block_1)) (hold_0)) (when (or (= ?obj grey_block_1) (clear grey_block_1)) (hold_1)) (when (or (on grey_block_1 white_block_1) (= ?obj yellow_block_1) (clear yellow_block_1)) (hold_2)) (when (and (not (or (= ?obj yellow_block_1) (ontable yellow_block_1))) (not (or (= ?obj black_block_1) (clear black_block_1)))) (hold_3)) (when (not (or (= ?obj blue_block_1) (ontable blue_block_1))) (hold_4)) (when (not (or (= ?obj yellow_block_2) (clear yellow_block_2))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding grey_block_1) (not (= ?obj grey_block_1)) (or (and (= ?obj blue_block_1) (= ?underobj black_block_1)) (on blue_block_1 black_block_1))) (hold_0)) (when (or (= ?obj grey_block_1) (and (clear grey_block_1) (not (= ?underobj grey_block_1)))) (hold_1)) (when (or (and (= ?obj grey_block_1) (= ?underobj white_block_1)) (on grey_block_1 white_block_1) (= ?obj yellow_block_1) (and (clear yellow_block_1) (not (= ?underobj yellow_block_1)))) (hold_2)) (when (and (not (ontable yellow_block_1)) (not (or (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1)))))) (hold_3)) (when (not (or (= ?obj yellow_block_2) (and (clear yellow_block_2) (not (= ?underobj yellow_block_2))))) (seen_psi_5)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (or (= ?obj grey_block_1) (holding grey_block_1)) (on blue_block_1 black_block_1) (not (and (= ?obj blue_block_1) (= ?underobj black_block_1)))) (hold_0)) (when (or (= ?underobj grey_block_1) (and (clear grey_block_1) (not (= ?obj grey_block_1)))) (hold_1)) (when (or (and (on grey_block_1 white_block_1) (not (and (= ?obj grey_block_1) (= ?underobj white_block_1)))) (= ?underobj yellow_block_1) (and (clear yellow_block_1) (not (= ?obj yellow_block_1)))) (hold_2)) (when (and (not (ontable yellow_block_1)) (not (or (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1)))))) (hold_3)) (when (not (or (= ?underobj yellow_block_2) (and (clear yellow_block_2) (not (= ?obj yellow_block_2))))) (seen_psi_5)) (increase (total-cost) 1)))
)
