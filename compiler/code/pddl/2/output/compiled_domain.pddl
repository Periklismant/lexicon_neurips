(define (domain trajectoryconstraintsremover_blocksworld_problem-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :conditional-effects :existential-preconditions :action-costs)
 (:types block)
 (:constants
   green_block_1 blue_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block))
 (:functions (total-cost))
 (:action pickup_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (ontable green_block_1) (handempty) (clear blue_block_1))
  :effect (and (holding green_block_1) (not (clear green_block_1)) (not (ontable green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (ontable blue_block_1) (handempty) (clear green_block_1))
  :effect (and (holding blue_block_1) (not (clear blue_block_1)) (not (ontable blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_double_green_block_1
  :parameters ()
  :precondition (and (ontable green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (not (ontable green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_blue_block_1
  :parameters ()
  :precondition (and (ontable blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (not (ontable blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action putdown_green_block_1
  :parameters ()
  :precondition (and (holding green_block_1) (or (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1) (clear blue_block_1)))
  :effect (and (handempty) (ontable green_block_1) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_blue_block_1
  :parameters ()
  :precondition (and (holding blue_block_1) (or (clear green_block_1) (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1)))
  :effect (and (handempty) (ontable blue_block_1) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding green_block_1) (or (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear blue_block_1)))
  :effect (and (handempty) (on green_block_1 green_block_1) (not (clear green_block_1)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding green_block_1) (or (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1)))
  :effect (and (handempty) (on green_block_1 blue_block_1) (not (clear blue_block_1)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding blue_block_1) (or (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1)))
  :effect (and (handempty) (on blue_block_1 green_block_1) (not (clear green_block_1)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding blue_block_1) (or (clear green_block_1) (not (exists (?topobj - block)
 (on ?topobj blue_block_1)))))
  :effect (and (handempty) (on blue_block_1 blue_block_1) (not (clear blue_block_1)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action unstack_green_block_1_green_block_1
  :parameters ()
  :precondition (and (on green_block_1 green_block_1) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear green_block_1) (not (on green_block_1 green_block_1)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_blue_block_1
  :parameters ()
  :precondition (and (on green_block_1 blue_block_1) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear blue_block_1) (not (on green_block_1 blue_block_1)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_green_block_1
  :parameters ()
  :precondition (and (on blue_block_1 green_block_1) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear green_block_1) (not (on blue_block_1 green_block_1)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_blue_block_1
  :parameters ()
  :precondition (and (on blue_block_1 blue_block_1) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear blue_block_1) (not (on blue_block_1 blue_block_1)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_green_block_1
  :parameters ()
  :precondition (and (on green_block_1 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear green_block_1) (not (on green_block_1 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_blue_block_1
  :parameters ()
  :precondition (and (on green_block_1 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear blue_block_1) (not (on green_block_1 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_green_block_1
  :parameters ()
  :precondition (and (on blue_block_1 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear green_block_1) (not (on blue_block_1 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_blue_block_1
  :parameters ()
  :precondition (and (on blue_block_1 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear blue_block_1) (not (on blue_block_1 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
)
