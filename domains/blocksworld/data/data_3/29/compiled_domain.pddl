(define (domain liftedtcore_blocksworld-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :action-costs)
 (:types block)
 (:constants
   red_block_1 orange_block_1 white_block_1 purple_block_1 white_block_2 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (when (and (not (on white_block_1 orange_block_1)) (not (or (= ?obj purple_block_1) (holding purple_block_1)))) (not (hold_1))) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_1)) (when (not (and (ontable purple_block_1) (not (= ?obj purple_block_1)))) (hold_2)) (when (and (not (and (ontable purple_block_1) (not (= ?obj purple_block_1)))) (not (on white_block_2 red_block_1))) (not (hold_3))) (when (or (on purple_block_1 orange_block_1) (= ?obj purple_block_1) (holding purple_block_1)) (hold_4)) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (clear ?obj) (handempty) (ontable ?obj) (not (holding ?obj)) (when (and (not (on white_block_1 orange_block_1)) (not (and (holding purple_block_1) (not (= ?obj purple_block_1))))) (not (hold_1))) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_1)) (when (not (or (= ?obj purple_block_1) (ontable purple_block_1))) (hold_2)) (when (and (not (or (= ?obj purple_block_1) (ontable purple_block_1))) (not (on white_block_2 red_block_1))) (not (hold_3))) (when (or (on purple_block_1 orange_block_1) (and (holding purple_block_1) (not (= ?obj purple_block_1)))) (hold_4)) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (clear ?obj) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (or (and (= ?obj white_block_1) (= ?underobj orange_block_1)) (on white_block_1 orange_block_1))) (hold_0)) (when (and (not (or (and (= ?obj white_block_1) (= ?underobj orange_block_1)) (on white_block_1 orange_block_1))) (not (and (holding purple_block_1) (not (= ?obj purple_block_1))))) (not (hold_1))) (when (and (holding purple_block_1) (not (= ?obj purple_block_1))) (hold_1)) (when (and (not (ontable purple_block_1)) (not (or (and (= ?obj white_block_2) (= ?underobj red_block_1)) (on white_block_2 red_block_1)))) (not (hold_3))) (when (or (and (= ?obj white_block_2) (= ?underobj red_block_1)) (on white_block_2 red_block_1)) (hold_3)) (when (or (and (= ?obj purple_block_1) (= ?underobj orange_block_1)) (on purple_block_1 orange_block_1) (and (holding purple_block_1) (not (= ?obj purple_block_1)))) (hold_4)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (not (and (on white_block_1 orange_block_1) (not (and (= ?obj white_block_1) (= ?underobj orange_block_1))))) (hold_0)) (when (and (not (and (on white_block_1 orange_block_1) (not (and (= ?obj white_block_1) (= ?underobj orange_block_1))))) (not (or (= ?obj purple_block_1) (holding purple_block_1)))) (not (hold_1))) (when (or (= ?obj purple_block_1) (holding purple_block_1)) (hold_1)) (when (and (not (ontable purple_block_1)) (not (and (on white_block_2 red_block_1) (not (and (= ?obj white_block_2) (= ?underobj red_block_1)))))) (not (hold_3))) (when (and (on white_block_2 red_block_1) (not (and (= ?obj white_block_2) (= ?underobj red_block_1)))) (hold_3)) (when (or (and (on purple_block_1 orange_block_1) (not (and (= ?obj purple_block_1) (= ?underobj orange_block_1)))) (= ?obj purple_block_1) (holding purple_block_1)) (hold_4)) (increase (total-cost) 1)))
)
