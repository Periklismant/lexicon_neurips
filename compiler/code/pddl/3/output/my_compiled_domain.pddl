(define (domain mytrajectoryconstraintsremover_blocksworld_problem-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :action-costs)
 (:types block)
 (:constants
   brown_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0))
 (:functions (total-cost))
 (:action pickup
  :parameters ( ?obj - block)
  :precondition (and (clear ?obj) (ontable ?obj) (handempty))
  :effect (and (holding ?obj) (not (clear ?obj)) (not (ontable ?obj)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_double
  :parameters ( ?obj - block)
  :precondition (and (ontable ?obj) (handempty) (exists (?topobj - block)
 (and (on ?topobj ?obj) (clear ?topobj))))
  :effect (and (holding ?obj) (not (ontable ?obj)) (not (handempty))(forall (?topobj - block) (when (on ?topobj ?obj) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action putdown
  :parameters ( ?obj - block)
  :precondition (and (holding ?obj))
  :effect (and (handempty) (ontable ?obj) (not (holding ?obj)) (when (not (exists (?topobj - block)
 (on ?topobj ?obj))) (clear ?obj))(forall (?topobj - block) (when (on ?topobj ?obj) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (clear ?underobj) (holding ?obj))
  :effect (and (handempty) (on ?obj ?underobj) (not (clear ?underobj)) (not (holding ?obj)) (when (not (exists (?topobj - block)
 (on ?topobj ?obj))) (clear ?obj))(forall (?topobj - block) (when (on ?topobj ?obj) (clear ?topobj))) (when (exists (?y - block)
 (or (and (= ?obj brown_block_1) (= ?underobj ?y)) (on brown_block_1 ?y))) (hold_0)) (increase (total-cost) 1)))
 (:action unstack
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (clear ?obj) (handempty))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (clear ?obj)) (not (handempty)) (when (exists (?y - block)
 (and (on brown_block_1 ?y) (not (and (= ?obj brown_block_1) (= ?underobj ?y))))) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double
  :parameters ( ?obj - block ?underobj - block)
  :precondition (and (on ?obj ?underobj) (handempty) (exists (?topobj - block)
 (and (on ?topobj ?obj) (clear ?topobj))))
  :effect (and (holding ?obj) (clear ?underobj) (not (on ?obj ?underobj)) (not (handempty))(forall (?topobj - block) (when (on ?topobj ?obj) (not (clear ?topobj)))) (when (exists (?y - block)
 (and (on brown_block_1 ?y) (not (and (= ?obj brown_block_1) (= ?underobj ?y))))) (hold_0)) (increase (total-cost) 1)))
)
