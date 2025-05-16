(define (domain trajectoryconstraintsremover_blocksworld_problem-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :conditional-effects :existential-preconditions :action-costs)
 (:types block)
 (:constants
   blue_block_1 black_block_2 blue_block_2 orange_block_1 green_block_1 black_block_1 black_block_3 brown_block_1 - block
 )
 (:predicates (clear ?obj - block) (ontable ?obj - block) (handempty) (holding ?obj - block) (on ?obj1 - block ?obj2 - block) (hold_0))
 (:functions (total-cost))
 (:action pickup_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (ontable green_block_1) (handempty))
  :effect (and (holding green_block_1) (not (clear green_block_1)) (not (ontable green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (ontable brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (not (clear brown_block_1)) (not (ontable brown_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (ontable blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (not (clear blue_block_1)) (not (ontable blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (ontable orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (not (clear orange_block_1)) (not (ontable orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (ontable blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (not (clear blue_block_2)) (not (ontable blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (ontable black_block_1) (handempty))
  :effect (and (holding black_block_1) (not (clear black_block_1)) (not (ontable black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (ontable black_block_2) (handempty))
  :effect (and (holding black_block_2) (not (clear black_block_2)) (not (ontable black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (ontable black_block_3) (handempty))
  :effect (and (holding black_block_3) (not (clear black_block_3)) (not (ontable black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action pickup_double_green_block_1
  :parameters ()
  :precondition (and (ontable green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (not (ontable green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_brown_block_1
  :parameters ()
  :precondition (and (ontable brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (not (ontable brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_blue_block_1
  :parameters ()
  :precondition (and (ontable blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (not (ontable blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_orange_block_1
  :parameters ()
  :precondition (and (ontable orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (not (ontable orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_blue_block_2
  :parameters ()
  :precondition (and (ontable blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (not (ontable blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_black_block_1
  :parameters ()
  :precondition (and (ontable black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (not (ontable black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_black_block_2
  :parameters ()
  :precondition (and (ontable black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (not (ontable black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action pickup_double_black_block_3
  :parameters ()
  :precondition (and (ontable black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (not (ontable black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action putdown_green_block_1
  :parameters ()
  :precondition (and (holding green_block_1))
  :effect (and (handempty) (ontable green_block_1) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_brown_block_1
  :parameters ()
  :precondition (and (holding brown_block_1))
  :effect (and (handempty) (ontable brown_block_1) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_blue_block_1
  :parameters ()
  :precondition (and (holding blue_block_1))
  :effect (and (handempty) (ontable blue_block_1) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_orange_block_1
  :parameters ()
  :precondition (and (holding orange_block_1))
  :effect (and (handempty) (ontable orange_block_1) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_blue_block_2
  :parameters ()
  :precondition (and (holding blue_block_2))
  :effect (and (handempty) (ontable blue_block_2) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_black_block_1
  :parameters ()
  :precondition (and (holding black_block_1))
  :effect (and (handempty) (ontable black_block_1) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_black_block_2
  :parameters ()
  :precondition (and (holding black_block_2))
  :effect (and (handempty) (ontable black_block_2) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action putdown_black_block_3
  :parameters ()
  :precondition (and (holding black_block_3))
  :effect (and (handempty) (ontable black_block_3) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 green_block_1) (not (clear green_block_1)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 brown_block_1) (not (clear brown_block_1)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 blue_block_1) (not (clear blue_block_1)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 orange_block_1) (not (clear orange_block_1)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 blue_block_2) (not (clear blue_block_2)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 black_block_1) (not (clear black_block_1)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 black_block_2) (not (clear black_block_2)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_green_block_1_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding green_block_1))
  :effect (and (handempty) (on green_block_1 black_block_3) (not (clear black_block_3)) (not (holding green_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj green_block_1))) (clear green_block_1))(forall (?topobj - block) (when (on ?topobj green_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_brown_block_1_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 green_block_1) (not (clear green_block_1)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_brown_block_1_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 brown_block_1) (not (clear brown_block_1)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_brown_block_1_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 blue_block_1) (not (clear blue_block_1)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_brown_block_1_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 orange_block_1) (not (clear orange_block_1)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_brown_block_1_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 blue_block_2) (not (clear blue_block_2)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_brown_block_1_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 black_block_1) (not (clear black_block_1)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_brown_block_1_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 black_block_2) (not (clear black_block_2)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_brown_block_1_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding brown_block_1))
  :effect (and (handempty) (on brown_block_1 black_block_3) (not (clear black_block_3)) (not (holding brown_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj brown_block_1))) (clear brown_block_1))(forall (?topobj - block) (when (on ?topobj brown_block_1) (clear ?topobj))) (hold_0) (increase (total-cost) 1)))
 (:action stack_blue_block_1_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 green_block_1) (not (clear green_block_1)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 brown_block_1) (not (clear brown_block_1)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 blue_block_1) (not (clear blue_block_1)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 orange_block_1) (not (clear orange_block_1)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 blue_block_2) (not (clear blue_block_2)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 black_block_1) (not (clear black_block_1)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 black_block_2) (not (clear black_block_2)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_1_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding blue_block_1))
  :effect (and (handempty) (on blue_block_1 black_block_3) (not (clear black_block_3)) (not (holding blue_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_1))) (clear blue_block_1))(forall (?topobj - block) (when (on ?topobj blue_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 green_block_1) (not (clear green_block_1)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 brown_block_1) (not (clear brown_block_1)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 blue_block_1) (not (clear blue_block_1)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 orange_block_1) (not (clear orange_block_1)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 blue_block_2) (not (clear blue_block_2)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 black_block_1) (not (clear black_block_1)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 black_block_2) (not (clear black_block_2)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_orange_block_1_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding orange_block_1))
  :effect (and (handempty) (on orange_block_1 black_block_3) (not (clear black_block_3)) (not (holding orange_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj orange_block_1))) (clear orange_block_1))(forall (?topobj - block) (when (on ?topobj orange_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 green_block_1) (not (clear green_block_1)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 brown_block_1) (not (clear brown_block_1)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 blue_block_1) (not (clear blue_block_1)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 orange_block_1) (not (clear orange_block_1)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 blue_block_2) (not (clear blue_block_2)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 black_block_1) (not (clear black_block_1)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 black_block_2) (not (clear black_block_2)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_blue_block_2_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding blue_block_2))
  :effect (and (handempty) (on blue_block_2 black_block_3) (not (clear black_block_3)) (not (holding blue_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj blue_block_2))) (clear blue_block_2))(forall (?topobj - block) (when (on ?topobj blue_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 green_block_1) (not (clear green_block_1)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 brown_block_1) (not (clear brown_block_1)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 blue_block_1) (not (clear blue_block_1)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 orange_block_1) (not (clear orange_block_1)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 blue_block_2) (not (clear blue_block_2)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 black_block_1) (not (clear black_block_1)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 black_block_2) (not (clear black_block_2)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_1_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding black_block_1))
  :effect (and (handempty) (on black_block_1 black_block_3) (not (clear black_block_3)) (not (holding black_block_1)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_1))) (clear black_block_1))(forall (?topobj - block) (when (on ?topobj black_block_1) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 green_block_1) (not (clear green_block_1)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 brown_block_1) (not (clear brown_block_1)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 blue_block_1) (not (clear blue_block_1)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 orange_block_1) (not (clear orange_block_1)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 blue_block_2) (not (clear blue_block_2)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 black_block_1) (not (clear black_block_1)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 black_block_2) (not (clear black_block_2)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_2_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding black_block_2))
  :effect (and (handempty) (on black_block_2 black_block_3) (not (clear black_block_3)) (not (holding black_block_2)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_2))) (clear black_block_2))(forall (?topobj - block) (when (on ?topobj black_block_2) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_green_block_1
  :parameters ()
  :precondition (and (clear green_block_1) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 green_block_1) (not (clear green_block_1)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_brown_block_1
  :parameters ()
  :precondition (and (clear brown_block_1) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 brown_block_1) (not (clear brown_block_1)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_blue_block_1
  :parameters ()
  :precondition (and (clear blue_block_1) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 blue_block_1) (not (clear blue_block_1)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_orange_block_1
  :parameters ()
  :precondition (and (clear orange_block_1) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 orange_block_1) (not (clear orange_block_1)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_blue_block_2
  :parameters ()
  :precondition (and (clear blue_block_2) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 blue_block_2) (not (clear blue_block_2)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_black_block_1
  :parameters ()
  :precondition (and (clear black_block_1) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 black_block_1) (not (clear black_block_1)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_black_block_2
  :parameters ()
  :precondition (and (clear black_block_2) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 black_block_2) (not (clear black_block_2)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action stack_black_block_3_black_block_3
  :parameters ()
  :precondition (and (clear black_block_3) (holding black_block_3))
  :effect (and (handempty) (on black_block_3 black_block_3) (not (clear black_block_3)) (not (holding black_block_3)) (when (not (exists (?topobj - block)
 (on ?topobj black_block_3))) (clear black_block_3))(forall (?topobj - block) (when (on ?topobj black_block_3) (clear ?topobj))) (increase (total-cost) 1)))
 (:action unstack_green_block_1_green_block_1
  :parameters ()
  :precondition (and (on green_block_1 green_block_1) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear green_block_1) (not (on green_block_1 green_block_1)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_brown_block_1
  :parameters ()
  :precondition (and (on green_block_1 brown_block_1) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear brown_block_1) (not (on green_block_1 brown_block_1)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_blue_block_1
  :parameters ()
  :precondition (and (on green_block_1 blue_block_1) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear blue_block_1) (not (on green_block_1 blue_block_1)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_orange_block_1
  :parameters ()
  :precondition (and (on green_block_1 orange_block_1) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear orange_block_1) (not (on green_block_1 orange_block_1)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_blue_block_2
  :parameters ()
  :precondition (and (on green_block_1 blue_block_2) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear blue_block_2) (not (on green_block_1 blue_block_2)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_black_block_1
  :parameters ()
  :precondition (and (on green_block_1 black_block_1) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear black_block_1) (not (on green_block_1 black_block_1)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_black_block_2
  :parameters ()
  :precondition (and (on green_block_1 black_block_2) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear black_block_2) (not (on green_block_1 black_block_2)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_green_block_1_black_block_3
  :parameters ()
  :precondition (and (on green_block_1 black_block_3) (clear green_block_1) (handempty))
  :effect (and (holding green_block_1) (clear black_block_3) (not (on green_block_1 black_block_3)) (not (clear green_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_green_block_1
  :parameters ()
  :precondition (and (on brown_block_1 green_block_1) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear green_block_1) (not (on brown_block_1 green_block_1)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_brown_block_1
  :parameters ()
  :precondition (and (on brown_block_1 brown_block_1) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear brown_block_1) (not (on brown_block_1 brown_block_1)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 green_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_blue_block_1
  :parameters ()
  :precondition (and (on brown_block_1 blue_block_1) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear blue_block_1) (not (on brown_block_1 blue_block_1)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_orange_block_1
  :parameters ()
  :precondition (and (on brown_block_1 orange_block_1) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear orange_block_1) (not (on brown_block_1 orange_block_1)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_blue_block_2
  :parameters ()
  :precondition (and (on brown_block_1 blue_block_2) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear blue_block_2) (not (on brown_block_1 blue_block_2)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_black_block_1
  :parameters ()
  :precondition (and (on brown_block_1 black_block_1) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear black_block_1) (not (on brown_block_1 black_block_1)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_black_block_2
  :parameters ()
  :precondition (and (on brown_block_1 black_block_2) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear black_block_2) (not (on brown_block_1 black_block_2)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_brown_block_1_black_block_3
  :parameters ()
  :precondition (and (on brown_block_1 black_block_3) (clear brown_block_1) (handempty))
  :effect (and (holding brown_block_1) (clear black_block_3) (not (on brown_block_1 black_block_3)) (not (clear brown_block_1)) (not (handempty)) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_green_block_1
  :parameters ()
  :precondition (and (on blue_block_1 green_block_1) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear green_block_1) (not (on blue_block_1 green_block_1)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_brown_block_1
  :parameters ()
  :precondition (and (on blue_block_1 brown_block_1) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear brown_block_1) (not (on blue_block_1 brown_block_1)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_blue_block_1
  :parameters ()
  :precondition (and (on blue_block_1 blue_block_1) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear blue_block_1) (not (on blue_block_1 blue_block_1)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_orange_block_1
  :parameters ()
  :precondition (and (on blue_block_1 orange_block_1) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear orange_block_1) (not (on blue_block_1 orange_block_1)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_blue_block_2
  :parameters ()
  :precondition (and (on blue_block_1 blue_block_2) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear blue_block_2) (not (on blue_block_1 blue_block_2)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_black_block_1
  :parameters ()
  :precondition (and (on blue_block_1 black_block_1) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear black_block_1) (not (on blue_block_1 black_block_1)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_black_block_2
  :parameters ()
  :precondition (and (on blue_block_1 black_block_2) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear black_block_2) (not (on blue_block_1 black_block_2)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_1_black_block_3
  :parameters ()
  :precondition (and (on blue_block_1 black_block_3) (clear blue_block_1) (handempty))
  :effect (and (holding blue_block_1) (clear black_block_3) (not (on blue_block_1 black_block_3)) (not (clear blue_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_green_block_1
  :parameters ()
  :precondition (and (on orange_block_1 green_block_1) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear green_block_1) (not (on orange_block_1 green_block_1)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_brown_block_1
  :parameters ()
  :precondition (and (on orange_block_1 brown_block_1) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear brown_block_1) (not (on orange_block_1 brown_block_1)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_blue_block_1
  :parameters ()
  :precondition (and (on orange_block_1 blue_block_1) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear blue_block_1) (not (on orange_block_1 blue_block_1)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_orange_block_1
  :parameters ()
  :precondition (and (on orange_block_1 orange_block_1) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear orange_block_1) (not (on orange_block_1 orange_block_1)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_blue_block_2
  :parameters ()
  :precondition (and (on orange_block_1 blue_block_2) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear blue_block_2) (not (on orange_block_1 blue_block_2)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_black_block_1
  :parameters ()
  :precondition (and (on orange_block_1 black_block_1) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear black_block_1) (not (on orange_block_1 black_block_1)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_black_block_2
  :parameters ()
  :precondition (and (on orange_block_1 black_block_2) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear black_block_2) (not (on orange_block_1 black_block_2)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_orange_block_1_black_block_3
  :parameters ()
  :precondition (and (on orange_block_1 black_block_3) (clear orange_block_1) (handempty))
  :effect (and (holding orange_block_1) (clear black_block_3) (not (on orange_block_1 black_block_3)) (not (clear orange_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_green_block_1
  :parameters ()
  :precondition (and (on blue_block_2 green_block_1) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear green_block_1) (not (on blue_block_2 green_block_1)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_brown_block_1
  :parameters ()
  :precondition (and (on blue_block_2 brown_block_1) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear brown_block_1) (not (on blue_block_2 brown_block_1)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_blue_block_1
  :parameters ()
  :precondition (and (on blue_block_2 blue_block_1) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear blue_block_1) (not (on blue_block_2 blue_block_1)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_orange_block_1
  :parameters ()
  :precondition (and (on blue_block_2 orange_block_1) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear orange_block_1) (not (on blue_block_2 orange_block_1)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_blue_block_2
  :parameters ()
  :precondition (and (on blue_block_2 blue_block_2) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear blue_block_2) (not (on blue_block_2 blue_block_2)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_black_block_1
  :parameters ()
  :precondition (and (on blue_block_2 black_block_1) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear black_block_1) (not (on blue_block_2 black_block_1)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_black_block_2
  :parameters ()
  :precondition (and (on blue_block_2 black_block_2) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear black_block_2) (not (on blue_block_2 black_block_2)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_blue_block_2_black_block_3
  :parameters ()
  :precondition (and (on blue_block_2 black_block_3) (clear blue_block_2) (handempty))
  :effect (and (holding blue_block_2) (clear black_block_3) (not (on blue_block_2 black_block_3)) (not (clear blue_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_green_block_1
  :parameters ()
  :precondition (and (on black_block_1 green_block_1) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear green_block_1) (not (on black_block_1 green_block_1)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_brown_block_1
  :parameters ()
  :precondition (and (on black_block_1 brown_block_1) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear brown_block_1) (not (on black_block_1 brown_block_1)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_blue_block_1
  :parameters ()
  :precondition (and (on black_block_1 blue_block_1) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear blue_block_1) (not (on black_block_1 blue_block_1)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_orange_block_1
  :parameters ()
  :precondition (and (on black_block_1 orange_block_1) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear orange_block_1) (not (on black_block_1 orange_block_1)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_blue_block_2
  :parameters ()
  :precondition (and (on black_block_1 blue_block_2) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear blue_block_2) (not (on black_block_1 blue_block_2)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_black_block_1
  :parameters ()
  :precondition (and (on black_block_1 black_block_1) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear black_block_1) (not (on black_block_1 black_block_1)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_black_block_2
  :parameters ()
  :precondition (and (on black_block_1 black_block_2) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear black_block_2) (not (on black_block_1 black_block_2)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_1_black_block_3
  :parameters ()
  :precondition (and (on black_block_1 black_block_3) (clear black_block_1) (handempty))
  :effect (and (holding black_block_1) (clear black_block_3) (not (on black_block_1 black_block_3)) (not (clear black_block_1)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_green_block_1
  :parameters ()
  :precondition (and (on black_block_2 green_block_1) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear green_block_1) (not (on black_block_2 green_block_1)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_brown_block_1
  :parameters ()
  :precondition (and (on black_block_2 brown_block_1) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear brown_block_1) (not (on black_block_2 brown_block_1)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_blue_block_1
  :parameters ()
  :precondition (and (on black_block_2 blue_block_1) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear blue_block_1) (not (on black_block_2 blue_block_1)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_orange_block_1
  :parameters ()
  :precondition (and (on black_block_2 orange_block_1) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear orange_block_1) (not (on black_block_2 orange_block_1)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_blue_block_2
  :parameters ()
  :precondition (and (on black_block_2 blue_block_2) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear blue_block_2) (not (on black_block_2 blue_block_2)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_black_block_1
  :parameters ()
  :precondition (and (on black_block_2 black_block_1) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear black_block_1) (not (on black_block_2 black_block_1)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_black_block_2
  :parameters ()
  :precondition (and (on black_block_2 black_block_2) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear black_block_2) (not (on black_block_2 black_block_2)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_2_black_block_3
  :parameters ()
  :precondition (and (on black_block_2 black_block_3) (clear black_block_2) (handempty))
  :effect (and (holding black_block_2) (clear black_block_3) (not (on black_block_2 black_block_3)) (not (clear black_block_2)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_green_block_1
  :parameters ()
  :precondition (and (on black_block_3 green_block_1) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear green_block_1) (not (on black_block_3 green_block_1)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_brown_block_1
  :parameters ()
  :precondition (and (on black_block_3 brown_block_1) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear brown_block_1) (not (on black_block_3 brown_block_1)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_blue_block_1
  :parameters ()
  :precondition (and (on black_block_3 blue_block_1) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear blue_block_1) (not (on black_block_3 blue_block_1)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_orange_block_1
  :parameters ()
  :precondition (and (on black_block_3 orange_block_1) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear orange_block_1) (not (on black_block_3 orange_block_1)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_blue_block_2
  :parameters ()
  :precondition (and (on black_block_3 blue_block_2) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear blue_block_2) (not (on black_block_3 blue_block_2)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_black_block_1
  :parameters ()
  :precondition (and (on black_block_3 black_block_1) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear black_block_1) (not (on black_block_3 black_block_1)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_black_block_2
  :parameters ()
  :precondition (and (on black_block_3 black_block_2) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear black_block_2) (not (on black_block_3 black_block_2)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_black_block_3_black_block_3
  :parameters ()
  :precondition (and (on black_block_3 black_block_3) (clear black_block_3) (handempty))
  :effect (and (holding black_block_3) (clear black_block_3) (not (on black_block_3 black_block_3)) (not (clear black_block_3)) (not (handempty)) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_green_block_1
  :parameters ()
  :precondition (and (on green_block_1 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear green_block_1) (not (on green_block_1 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_brown_block_1
  :parameters ()
  :precondition (and (on green_block_1 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear brown_block_1) (not (on green_block_1 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_blue_block_1
  :parameters ()
  :precondition (and (on green_block_1 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear blue_block_1) (not (on green_block_1 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_orange_block_1
  :parameters ()
  :precondition (and (on green_block_1 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear orange_block_1) (not (on green_block_1 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_blue_block_2
  :parameters ()
  :precondition (and (on green_block_1 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear blue_block_2) (not (on green_block_1 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_black_block_1
  :parameters ()
  :precondition (and (on green_block_1 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear black_block_1) (not (on green_block_1 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_black_block_2
  :parameters ()
  :precondition (and (on green_block_1 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear black_block_2) (not (on green_block_1 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_green_block_1_black_block_3
  :parameters ()
  :precondition (and (on green_block_1 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj green_block_1) (clear ?topobj))))
  :effect (and (holding green_block_1) (clear black_block_3) (not (on green_block_1 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj green_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_green_block_1
  :parameters ()
  :precondition (and (on brown_block_1 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear green_block_1) (not (on brown_block_1 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_brown_block_1
  :parameters ()
  :precondition (and (on brown_block_1 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear brown_block_1) (not (on brown_block_1 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 green_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_blue_block_1
  :parameters ()
  :precondition (and (on brown_block_1 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear blue_block_1) (not (on brown_block_1 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_orange_block_1
  :parameters ()
  :precondition (and (on brown_block_1 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear orange_block_1) (not (on brown_block_1 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_blue_block_2
  :parameters ()
  :precondition (and (on brown_block_1 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear blue_block_2) (not (on brown_block_1 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_black_block_1
  :parameters ()
  :precondition (and (on brown_block_1 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear black_block_1) (not (on brown_block_1 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_2) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_black_block_2
  :parameters ()
  :precondition (and (on brown_block_1 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear black_block_2) (not (on brown_block_1 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_3)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_brown_block_1_black_block_3
  :parameters ()
  :precondition (and (on brown_block_1 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj brown_block_1) (clear ?topobj))))
  :effect (and (holding brown_block_1) (clear black_block_3) (not (on brown_block_1 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj brown_block_1) (not (clear ?topobj)))) (when (or (on brown_block_1 green_block_1) (on brown_block_1 brown_block_1) (on brown_block_1 blue_block_1) (on brown_block_1 orange_block_1) (on brown_block_1 blue_block_2) (on brown_block_1 black_block_1) (on brown_block_1 black_block_2)) (hold_0)) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_green_block_1
  :parameters ()
  :precondition (and (on blue_block_1 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear green_block_1) (not (on blue_block_1 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_brown_block_1
  :parameters ()
  :precondition (and (on blue_block_1 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear brown_block_1) (not (on blue_block_1 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_blue_block_1
  :parameters ()
  :precondition (and (on blue_block_1 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear blue_block_1) (not (on blue_block_1 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_orange_block_1
  :parameters ()
  :precondition (and (on blue_block_1 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear orange_block_1) (not (on blue_block_1 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_blue_block_2
  :parameters ()
  :precondition (and (on blue_block_1 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear blue_block_2) (not (on blue_block_1 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_black_block_1
  :parameters ()
  :precondition (and (on blue_block_1 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear black_block_1) (not (on blue_block_1 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_black_block_2
  :parameters ()
  :precondition (and (on blue_block_1 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear black_block_2) (not (on blue_block_1 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_1_black_block_3
  :parameters ()
  :precondition (and (on blue_block_1 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_1) (clear ?topobj))))
  :effect (and (holding blue_block_1) (clear black_block_3) (not (on blue_block_1 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_green_block_1
  :parameters ()
  :precondition (and (on orange_block_1 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear green_block_1) (not (on orange_block_1 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_brown_block_1
  :parameters ()
  :precondition (and (on orange_block_1 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear brown_block_1) (not (on orange_block_1 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_blue_block_1
  :parameters ()
  :precondition (and (on orange_block_1 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear blue_block_1) (not (on orange_block_1 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_orange_block_1
  :parameters ()
  :precondition (and (on orange_block_1 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear orange_block_1) (not (on orange_block_1 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_blue_block_2
  :parameters ()
  :precondition (and (on orange_block_1 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear blue_block_2) (not (on orange_block_1 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_black_block_1
  :parameters ()
  :precondition (and (on orange_block_1 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear black_block_1) (not (on orange_block_1 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_black_block_2
  :parameters ()
  :precondition (and (on orange_block_1 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear black_block_2) (not (on orange_block_1 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_orange_block_1_black_block_3
  :parameters ()
  :precondition (and (on orange_block_1 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj orange_block_1) (clear ?topobj))))
  :effect (and (holding orange_block_1) (clear black_block_3) (not (on orange_block_1 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj orange_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_green_block_1
  :parameters ()
  :precondition (and (on blue_block_2 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear green_block_1) (not (on blue_block_2 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_brown_block_1
  :parameters ()
  :precondition (and (on blue_block_2 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear brown_block_1) (not (on blue_block_2 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_blue_block_1
  :parameters ()
  :precondition (and (on blue_block_2 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear blue_block_1) (not (on blue_block_2 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_orange_block_1
  :parameters ()
  :precondition (and (on blue_block_2 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear orange_block_1) (not (on blue_block_2 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_blue_block_2
  :parameters ()
  :precondition (and (on blue_block_2 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear blue_block_2) (not (on blue_block_2 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_black_block_1
  :parameters ()
  :precondition (and (on blue_block_2 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear black_block_1) (not (on blue_block_2 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_black_block_2
  :parameters ()
  :precondition (and (on blue_block_2 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear black_block_2) (not (on blue_block_2 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_blue_block_2_black_block_3
  :parameters ()
  :precondition (and (on blue_block_2 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj blue_block_2) (clear ?topobj))))
  :effect (and (holding blue_block_2) (clear black_block_3) (not (on blue_block_2 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj blue_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_green_block_1
  :parameters ()
  :precondition (and (on black_block_1 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear green_block_1) (not (on black_block_1 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_brown_block_1
  :parameters ()
  :precondition (and (on black_block_1 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear brown_block_1) (not (on black_block_1 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_blue_block_1
  :parameters ()
  :precondition (and (on black_block_1 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear blue_block_1) (not (on black_block_1 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_orange_block_1
  :parameters ()
  :precondition (and (on black_block_1 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear orange_block_1) (not (on black_block_1 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_blue_block_2
  :parameters ()
  :precondition (and (on black_block_1 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear blue_block_2) (not (on black_block_1 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_black_block_1
  :parameters ()
  :precondition (and (on black_block_1 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear black_block_1) (not (on black_block_1 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_black_block_2
  :parameters ()
  :precondition (and (on black_block_1 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear black_block_2) (not (on black_block_1 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_1_black_block_3
  :parameters ()
  :precondition (and (on black_block_1 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_1) (clear ?topobj))))
  :effect (and (holding black_block_1) (clear black_block_3) (not (on black_block_1 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_1) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_green_block_1
  :parameters ()
  :precondition (and (on black_block_2 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear green_block_1) (not (on black_block_2 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_brown_block_1
  :parameters ()
  :precondition (and (on black_block_2 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear brown_block_1) (not (on black_block_2 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_blue_block_1
  :parameters ()
  :precondition (and (on black_block_2 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear blue_block_1) (not (on black_block_2 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_orange_block_1
  :parameters ()
  :precondition (and (on black_block_2 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear orange_block_1) (not (on black_block_2 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_blue_block_2
  :parameters ()
  :precondition (and (on black_block_2 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear blue_block_2) (not (on black_block_2 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_black_block_1
  :parameters ()
  :precondition (and (on black_block_2 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear black_block_1) (not (on black_block_2 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_black_block_2
  :parameters ()
  :precondition (and (on black_block_2 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear black_block_2) (not (on black_block_2 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_2_black_block_3
  :parameters ()
  :precondition (and (on black_block_2 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_2) (clear ?topobj))))
  :effect (and (holding black_block_2) (clear black_block_3) (not (on black_block_2 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_2) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_green_block_1
  :parameters ()
  :precondition (and (on black_block_3 green_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear green_block_1) (not (on black_block_3 green_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_brown_block_1
  :parameters ()
  :precondition (and (on black_block_3 brown_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear brown_block_1) (not (on black_block_3 brown_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_blue_block_1
  :parameters ()
  :precondition (and (on black_block_3 blue_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear blue_block_1) (not (on black_block_3 blue_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_orange_block_1
  :parameters ()
  :precondition (and (on black_block_3 orange_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear orange_block_1) (not (on black_block_3 orange_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_blue_block_2
  :parameters ()
  :precondition (and (on black_block_3 blue_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear blue_block_2) (not (on black_block_3 blue_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_black_block_1
  :parameters ()
  :precondition (and (on black_block_3 black_block_1) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear black_block_1) (not (on black_block_3 black_block_1)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_black_block_2
  :parameters ()
  :precondition (and (on black_block_3 black_block_2) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear black_block_2) (not (on black_block_3 black_block_2)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
 (:action unstack_double_black_block_3_black_block_3
  :parameters ()
  :precondition (and (on black_block_3 black_block_3) (handempty) (exists (?topobj - block)
 (and (on ?topobj black_block_3) (clear ?topobj))))
  :effect (and (holding black_block_3) (clear black_block_3) (not (on black_block_3 black_block_3)) (not (handempty))(forall (?topobj - block) (when (on ?topobj black_block_3) (not (clear ?topobj)))) (increase (total-cost) 1)))
)
