(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   white_block_2 yellow_block_1 white_block_1 green_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (not (on yellow_block_1 white_block_1)) (not (or (and (clear white_block_2) (not (= ?obj white_block_2))) (on white_block_2 green_block_1)))) (not (hold_1))) (when (or (and (clear white_block_2) (not (= ?obj white_block_2))) (on white_block_2 green_block_1)) (hold_1)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (not (on yellow_block_1 white_block_1)) (not (or (= ?obj white_block_2) (clear white_block_2) (on white_block_2 green_block_1)))) (not (hold_1))) (when (or (= ?obj white_block_2) (clear white_block_2) (on white_block_2 green_block_1)) (hold_1)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (and (= ?obj yellow_block_1) (= ?underobj white_block_1)) (on yellow_block_1 white_block_1))) (hold_0)) (when (and (not (or (and (= ?obj yellow_block_1) (= ?underobj white_block_1)) (on yellow_block_1 white_block_1))) (not (or (= ?obj white_block_2) (and (clear white_block_2) (not (= ?underobj white_block_2))) (and (= ?obj white_block_2) (= ?underobj green_block_1)) (on white_block_2 green_block_1)))) (not (hold_1))) (when (or (= ?obj white_block_2) (and (clear white_block_2) (not (= ?underobj white_block_2))) (and (= ?obj white_block_2) (= ?underobj green_block_1)) (on white_block_2 green_block_1)) (hold_1)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (and (on yellow_block_1 white_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj white_block_1))))) (hold_0)) (when (and (not (and (on yellow_block_1 white_block_1) (not (and (= ?obj yellow_block_1) (= ?underobj white_block_1))))) (not (or (= ?underobj white_block_2) (and (clear white_block_2) (not (= ?obj white_block_2))) (and (on white_block_2 green_block_1) (not (and (= ?obj white_block_2) (= ?underobj green_block_1))))))) (not (hold_1))) (when (or (= ?underobj white_block_2) (and (clear white_block_2) (not (= ?obj white_block_2))) (and (on white_block_2 green_block_1) (not (and (= ?obj white_block_2) (= ?underobj green_block_1))))) (hold_1)) (increase (total-cost) 1)))
)
