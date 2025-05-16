(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   grey_block_2 grey_block_1 orange_block_1 green_block_1 brown_block_1 black_block_1 black_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (seen_psi_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty) (or (and (clear black_block_1) (not (= ?obj black_block_1))) (seen_psi_2)) (not (and (ontable black_block_1) (not (= ?obj black_block_1)))) (not (and (ontable grey_block_2) (not (= ?obj grey_block_2)))))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (or (= ?obj orange_block_1) (holding orange_block_1)) (not (and (clear black_block_2) (not (= ?obj black_block_2))))) (hold_0)) (when (not (and (clear black_block_1) (not (= ?obj black_block_1)))) (hold_1)) (when (or (and (ontable brown_block_1) (not (= ?obj brown_block_1))) (not (and (ontable grey_block_1) (not (= ?obj grey_block_1))))) (seen_psi_2)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj) (or (= ?obj black_block_1) (clear black_block_1) (seen_psi_2)) (not (or (= ?obj black_block_1) (ontable black_block_1))) (not (or (= ?obj grey_block_2) (ontable grey_block_2))))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (holding orange_block_1) (not (= ?obj orange_block_1)) (not (or (= ?obj black_block_2) (clear black_block_2)))) (hold_0)) (when (not (or (= ?obj black_block_1) (clear black_block_1))) (hold_1)) (when (or (= ?obj brown_block_1) (ontable brown_block_1) (not (or (= ?obj grey_block_1) (ontable grey_block_1)))) (seen_psi_2)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj) (or (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1))) (seen_psi_2)))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (and (holding orange_block_1) (not (= ?obj orange_block_1)) (not (or (= ?obj black_block_2) (and (clear black_block_2) (not (= ?underobj black_block_2)))))) (hold_0)) (when (not (or (= ?obj black_block_1) (and (clear black_block_1) (not (= ?underobj black_block_1))))) (hold_1)) (when (or (and (= ?obj grey_block_2) (= ?underobj green_block_1)) (on grey_block_2 green_block_1)) (hold_3)) (when (and (or (and (= ?obj grey_block_2) (= ?underobj green_block_1)) (on grey_block_2 green_block_1)) (not (or (and (= ?obj grey_block_2) (= ?underobj black_block_2)) (on grey_block_2 black_block_2)))) (not (hold_4))) (when (or (and (= ?obj grey_block_2) (= ?underobj black_block_2)) (on grey_block_2 black_block_2)) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty) (or (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1))) (seen_psi_2)))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (and (or (= ?obj orange_block_1) (holding orange_block_1)) (not (or (= ?underobj black_block_2) (and (clear black_block_2) (not (= ?obj black_block_2)))))) (hold_0)) (when (not (or (= ?underobj black_block_1) (and (clear black_block_1) (not (= ?obj black_block_1))))) (hold_1)) (when (and (on grey_block_2 green_block_1) (not (and (= ?obj grey_block_2) (= ?underobj green_block_1)))) (hold_3)) (when (and (on grey_block_2 green_block_1) (not (and (= ?obj grey_block_2) (= ?underobj green_block_1))) (not (and (on grey_block_2 black_block_2) (not (and (= ?obj grey_block_2) (= ?underobj black_block_2)))))) (not (hold_4))) (when (and (on grey_block_2 black_block_2) (not (and (= ?obj grey_block_2) (= ?underobj black_block_2)))) (hold_4)) (increase (total-cost) 1)))
)
