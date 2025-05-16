(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   grey_block_2 grey_block_1 black_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (not (and (clear grey_block_1) (not (= ?obj grey_block_1)))) (hold_0)) (when (and (not (and (clear grey_block_1) (not (= ?obj grey_block_1)))) (not (on grey_block_2 black_block_1))) (not (hold_1))) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (or (= ?obj grey_block_1) (clear grey_block_1))) (hold_0)) (when (and (not (or (= ?obj grey_block_1) (clear grey_block_1))) (not (on grey_block_2 black_block_1))) (not (hold_1))) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (= ?obj grey_block_1) (and (clear grey_block_1) (not (= ?underobj grey_block_1))))) (hold_0)) (when (and (not (or (= ?obj grey_block_1) (and (clear grey_block_1) (not (= ?underobj grey_block_1))))) (not (or (and (= ?obj grey_block_2) (= ?underobj black_block_1)) (on grey_block_2 black_block_1)))) (not (hold_1))) (when (or (and (= ?obj grey_block_2) (= ?underobj black_block_1)) (on grey_block_2 black_block_1)) (hold_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (or (= ?underobj grey_block_1) (and (clear grey_block_1) (not (= ?obj grey_block_1))))) (hold_0)) (when (and (not (or (= ?underobj grey_block_1) (and (clear grey_block_1) (not (= ?obj grey_block_1))))) (not (and (on grey_block_2 black_block_1) (not (and (= ?obj grey_block_2) (= ?underobj black_block_1)))))) (not (hold_1))) (when (and (on grey_block_2 black_block_1) (not (and (= ?obj grey_block_2) (= ?underobj black_block_1)))) (hold_1)) (increase (total-cost) 1)))
)
