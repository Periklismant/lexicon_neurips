(define (domain trajectoryconstraintsremover_minigrid_problem-domain)
 (:requirements :strips :typing :negative-preconditions :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball key - object_
 )
 (:constants
   empty - empty_0
   room_3 room_4 room_2 room_1 - room
   grey_ball_1 yellow_ball_1 - ball
   red_key_3 blue_key_1 blue_key_4 red_key_4 red_key_2 blue_key_2 blue_key_3 red_key_1 - key
   blue_door_1 red_door_2 red_door_1 blue_door_2 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0))
 (:functions (total-cost))
 (:action gotoobject_empty_room_1
  :parameters ()
  :precondition (and (objectinroom empty room_1) (agentinroom room_1))
  :effect (and (at_ empty)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_empty_room_2
  :parameters ()
  :precondition (and (objectinroom empty room_2) (agentinroom room_2))
  :effect (and (at_ empty)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_empty_room_3
  :parameters ()
  :precondition (and (objectinroom empty room_3) (agentinroom room_3))
  :effect (and (at_ empty)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_empty_room_4
  :parameters ()
  :precondition (and (objectinroom empty room_4) (agentinroom room_4))
  :effect (and (at_ empty)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_ball_1_room_1
  :parameters ()
  :precondition (and (objectinroom grey_ball_1 room_1) (agentinroom room_1))
  :effect (and (at_ grey_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_ball_1_room_2
  :parameters ()
  :precondition (and (objectinroom grey_ball_1 room_2) (agentinroom room_2))
  :effect (and (at_ grey_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_ball_1_room_3
  :parameters ()
  :precondition (and (objectinroom grey_ball_1 room_3) (agentinroom room_3))
  :effect (and (at_ grey_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_ball_1_room_4
  :parameters ()
  :precondition (and (objectinroom grey_ball_1 room_4) (agentinroom room_4))
  :effect (and (at_ grey_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_ball_1_room_1
  :parameters ()
  :precondition (and (objectinroom yellow_ball_1 room_1) (agentinroom room_1))
  :effect (and (at_ yellow_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_ball_1_room_2
  :parameters ()
  :precondition (and (objectinroom yellow_ball_1 room_2) (agentinroom room_2))
  :effect (and (at_ yellow_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_ball_1_room_3
  :parameters ()
  :precondition (and (objectinroom yellow_ball_1 room_3) (agentinroom room_3))
  :effect (and (at_ yellow_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_ball_1_room_4
  :parameters ()
  :precondition (and (objectinroom yellow_ball_1 room_4) (agentinroom room_4))
  :effect (and (at_ yellow_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_3_room_1
  :parameters ()
  :precondition (and (objectinroom blue_key_3 room_1) (agentinroom room_1))
  :effect (and (at_ blue_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_3_room_2
  :parameters ()
  :precondition (and (objectinroom blue_key_3 room_2) (agentinroom room_2))
  :effect (and (at_ blue_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_3_room_3
  :parameters ()
  :precondition (and (objectinroom blue_key_3 room_3) (agentinroom room_3))
  :effect (and (at_ blue_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_3_room_4
  :parameters ()
  :precondition (and (objectinroom blue_key_3 room_4) (agentinroom room_4))
  :effect (and (at_ blue_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_3_room_1
  :parameters ()
  :precondition (and (objectinroom red_key_3 room_1) (agentinroom room_1))
  :effect (and (at_ red_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_3_room_2
  :parameters ()
  :precondition (and (objectinroom red_key_3 room_2) (agentinroom room_2))
  :effect (and (at_ red_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_3_room_3
  :parameters ()
  :precondition (and (objectinroom red_key_3 room_3) (agentinroom room_3))
  :effect (and (at_ red_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_3_room_4
  :parameters ()
  :precondition (and (objectinroom red_key_3 room_4) (agentinroom room_4))
  :effect (and (at_ red_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_2_room_1
  :parameters ()
  :precondition (and (objectinroom blue_key_2 room_1) (agentinroom room_1))
  :effect (and (at_ blue_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_2_room_2
  :parameters ()
  :precondition (and (objectinroom blue_key_2 room_2) (agentinroom room_2))
  :effect (and (at_ blue_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_2_room_3
  :parameters ()
  :precondition (and (objectinroom blue_key_2 room_3) (agentinroom room_3))
  :effect (and (at_ blue_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_2_room_4
  :parameters ()
  :precondition (and (objectinroom blue_key_2 room_4) (agentinroom room_4))
  :effect (and (at_ blue_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_4_room_1
  :parameters ()
  :precondition (and (objectinroom red_key_4 room_1) (agentinroom room_1))
  :effect (and (at_ red_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_4_room_2
  :parameters ()
  :precondition (and (objectinroom red_key_4 room_2) (agentinroom room_2))
  :effect (and (at_ red_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_4_room_3
  :parameters ()
  :precondition (and (objectinroom red_key_4 room_3) (agentinroom room_3))
  :effect (and (at_ red_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_4_room_4
  :parameters ()
  :precondition (and (objectinroom red_key_4 room_4) (agentinroom room_4))
  :effect (and (at_ red_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_1_room_1
  :parameters ()
  :precondition (and (objectinroom blue_key_1 room_1) (agentinroom room_1))
  :effect (and (at_ blue_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_1_room_2
  :parameters ()
  :precondition (and (objectinroom blue_key_1 room_2) (agentinroom room_2))
  :effect (and (at_ blue_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_1_room_3
  :parameters ()
  :precondition (and (objectinroom blue_key_1 room_3) (agentinroom room_3))
  :effect (and (at_ blue_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_1_room_4
  :parameters ()
  :precondition (and (objectinroom blue_key_1 room_4) (agentinroom room_4))
  :effect (and (at_ blue_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_1_room_1
  :parameters ()
  :precondition (and (objectinroom red_key_1 room_1) (agentinroom room_1))
  :effect (and (at_ red_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_1_room_2
  :parameters ()
  :precondition (and (objectinroom red_key_1 room_2) (agentinroom room_2))
  :effect (and (at_ red_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_1_room_3
  :parameters ()
  :precondition (and (objectinroom red_key_1 room_3) (agentinroom room_3))
  :effect (and (at_ red_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_1_room_4
  :parameters ()
  :precondition (and (objectinroom red_key_1 room_4) (agentinroom room_4))
  :effect (and (at_ red_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_4_room_1
  :parameters ()
  :precondition (and (objectinroom blue_key_4 room_1) (agentinroom room_1))
  :effect (and (at_ blue_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_4_room_2
  :parameters ()
  :precondition (and (objectinroom blue_key_4 room_2) (agentinroom room_2))
  :effect (and (at_ blue_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_4_room_3
  :parameters ()
  :precondition (and (objectinroom blue_key_4 room_3) (agentinroom room_3))
  :effect (and (at_ blue_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_key_4_room_4
  :parameters ()
  :precondition (and (objectinroom blue_key_4 room_4) (agentinroom room_4))
  :effect (and (at_ blue_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_2_room_1
  :parameters ()
  :precondition (and (objectinroom red_key_2 room_1) (agentinroom room_1))
  :effect (and (at_ red_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_2_room_2
  :parameters ()
  :precondition (and (objectinroom red_key_2 room_2) (agentinroom room_2))
  :effect (and (at_ red_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_2_room_3
  :parameters ()
  :precondition (and (objectinroom red_key_2 room_3) (agentinroom room_3))
  :effect (and (at_ red_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_red_key_2_room_4
  :parameters ()
  :precondition (and (objectinroom red_key_2 room_4) (agentinroom room_4))
  :effect (and (at_ red_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and (at_ empty)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_blue_door_1_room_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_1) (forall (?o - object_)
 (not (blocked blue_door_1 ?o room_1))))
  :effect (and (at_ blue_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_blue_door_1_room_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_2) (forall (?o - object_)
 (not (blocked blue_door_1 ?o room_2))))
  :effect (and (at_ blue_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_red_door_1_room_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_1) (forall (?o - object_)
 (not (blocked red_door_1 ?o room_1))))
  :effect (and (at_ red_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_red_door_1_room_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_3) (forall (?o - object_)
 (not (blocked red_door_1 ?o room_3))))
  :effect (and (at_ red_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_red_door_2_room_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_2) (forall (?o - object_)
 (not (blocked red_door_2 ?o room_2))))
  :effect (and (at_ red_door_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_red_door_2_room_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_4) (forall (?o - object_)
 (not (blocked red_door_2 ?o room_4))))
  :effect (and (at_ red_door_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_blue_door_2_room_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_3) (forall (?o - object_)
 (not (blocked blue_door_2 ?o room_3))))
  :effect (and (at_ blue_door_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_blue_door_2_room_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_4) (forall (?o - object_)
 (not (blocked blue_door_2 ?o room_4))))
  :effect (and (at_ blue_door_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_1_room_2_blue_door_1
  :parameters ()
  :precondition (and (agentinroom room_1) (not (locked blue_door_1)))
  :effect (and (not (agentinroom room_1)) (agentinroom room_2) (visited room_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_1_room_3_red_door_1
  :parameters ()
  :precondition (and (agentinroom room_1) (not (locked red_door_1)))
  :effect (and (not (agentinroom room_1)) (agentinroom room_3) (visited room_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_2_room_1_blue_door_1
  :parameters ()
  :precondition (and (agentinroom room_2) (not (locked blue_door_1)))
  :effect (and (not (agentinroom room_2)) (agentinroom room_1) (visited room_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_2_room_4_red_door_2
  :parameters ()
  :precondition (and (agentinroom room_2) (not (locked red_door_2)))
  :effect (and (not (agentinroom room_2)) (agentinroom room_4) (visited room_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_3_room_1_red_door_1
  :parameters ()
  :precondition (and (agentinroom room_3) (not (locked red_door_1)))
  :effect (and (not (agentinroom room_3)) (agentinroom room_1) (visited room_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_3_room_4_blue_door_2
  :parameters ()
  :precondition (and (agentinroom room_3) (not (locked blue_door_2)))
  :effect (and (not (agentinroom room_3)) (agentinroom room_4) (visited room_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_4_room_2_red_door_2
  :parameters ()
  :precondition (and (agentinroom room_4) (not (locked red_door_2)))
  :effect (and (not (agentinroom room_4)) (agentinroom room_2) (visited room_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_4_room_3_blue_door_2
  :parameters ()
  :precondition (and (agentinroom room_4) (not (locked blue_door_2)))
  :effect (and (not (agentinroom room_4)) (agentinroom room_3) (visited room_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action pick_empty_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom empty room_1) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_1))(forall (?d - door) (when (blocked ?d empty room_1) (not (blocked ?d empty room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_empty_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom empty room_2) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_2))(forall (?d - door) (when (blocked ?d empty room_2) (not (blocked ?d empty room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_empty_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom empty room_3) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_3))(forall (?d - door) (when (blocked ?d empty room_3) (not (blocked ?d empty room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_empty_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom empty room_4) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_4))(forall (?d - door) (when (blocked ?d empty room_4) (not (blocked ?d empty room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_ball_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom grey_ball_1 room_1) (at_ grey_ball_1) (emptyhands))
  :effect (and (not (at_ grey_ball_1)) (not (emptyhands)) (carrying grey_ball_1) (not (objectinroom grey_ball_1 room_1))(forall (?d - door) (when (blocked ?d grey_ball_1 room_1) (not (blocked ?d grey_ball_1 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_ball_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom grey_ball_1 room_2) (at_ grey_ball_1) (emptyhands))
  :effect (and (not (at_ grey_ball_1)) (not (emptyhands)) (carrying grey_ball_1) (not (objectinroom grey_ball_1 room_2))(forall (?d - door) (when (blocked ?d grey_ball_1 room_2) (not (blocked ?d grey_ball_1 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_ball_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom grey_ball_1 room_3) (at_ grey_ball_1) (emptyhands))
  :effect (and (not (at_ grey_ball_1)) (not (emptyhands)) (carrying grey_ball_1) (not (objectinroom grey_ball_1 room_3))(forall (?d - door) (when (blocked ?d grey_ball_1 room_3) (not (blocked ?d grey_ball_1 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_ball_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom grey_ball_1 room_4) (at_ grey_ball_1) (emptyhands))
  :effect (and (not (at_ grey_ball_1)) (not (emptyhands)) (carrying grey_ball_1) (not (objectinroom grey_ball_1 room_4))(forall (?d - door) (when (blocked ?d grey_ball_1 room_4) (not (blocked ?d grey_ball_1 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_ball_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom yellow_ball_1 room_1) (at_ yellow_ball_1) (emptyhands))
  :effect (and (not (at_ yellow_ball_1)) (not (emptyhands)) (carrying yellow_ball_1) (not (objectinroom yellow_ball_1 room_1))(forall (?d - door) (when (blocked ?d yellow_ball_1 room_1) (not (blocked ?d yellow_ball_1 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_ball_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom yellow_ball_1 room_2) (at_ yellow_ball_1) (emptyhands))
  :effect (and (not (at_ yellow_ball_1)) (not (emptyhands)) (carrying yellow_ball_1) (not (objectinroom yellow_ball_1 room_2))(forall (?d - door) (when (blocked ?d yellow_ball_1 room_2) (not (blocked ?d yellow_ball_1 room_2)))) (increase (total-cost) 1)))
 (:action pick_yellow_ball_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom yellow_ball_1 room_3) (at_ yellow_ball_1) (emptyhands))
  :effect (and (not (at_ yellow_ball_1)) (not (emptyhands)) (carrying yellow_ball_1) (not (objectinroom yellow_ball_1 room_3))(forall (?d - door) (when (blocked ?d yellow_ball_1 room_3) (not (blocked ?d yellow_ball_1 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_ball_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom yellow_ball_1 room_4) (at_ yellow_ball_1) (emptyhands))
  :effect (and (not (at_ yellow_ball_1)) (not (emptyhands)) (carrying yellow_ball_1) (not (objectinroom yellow_ball_1 room_4))(forall (?d - door) (when (blocked ?d yellow_ball_1 room_4) (not (blocked ?d yellow_ball_1 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom blue_key_3 room_1) (at_ blue_key_3) (emptyhands))
  :effect (and (not (at_ blue_key_3)) (not (emptyhands)) (carrying blue_key_3) (not (objectinroom blue_key_3 room_1))(forall (?d - door) (when (blocked ?d blue_key_3 room_1) (not (blocked ?d blue_key_3 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_3_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom blue_key_3 room_2) (at_ blue_key_3) (emptyhands))
  :effect (and (not (at_ blue_key_3)) (not (emptyhands)) (carrying blue_key_3) (not (objectinroom blue_key_3 room_2))(forall (?d - door) (when (blocked ?d blue_key_3 room_2) (not (blocked ?d blue_key_3 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_3_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom blue_key_3 room_3) (at_ blue_key_3) (emptyhands))
  :effect (and (not (at_ blue_key_3)) (not (emptyhands)) (carrying blue_key_3) (not (objectinroom blue_key_3 room_3))(forall (?d - door) (when (blocked ?d blue_key_3 room_3) (not (blocked ?d blue_key_3 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom blue_key_3 room_4) (at_ blue_key_3) (emptyhands))
  :effect (and (not (at_ blue_key_3)) (not (emptyhands)) (carrying blue_key_3) (not (objectinroom blue_key_3 room_4))(forall (?d - door) (when (blocked ?d blue_key_3 room_4) (not (blocked ?d blue_key_3 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom red_key_3 room_1) (at_ red_key_3) (emptyhands))
  :effect (and (not (at_ red_key_3)) (not (emptyhands)) (carrying red_key_3) (not (objectinroom red_key_3 room_1))(forall (?d - door) (when (blocked ?d red_key_3 room_1) (not (blocked ?d red_key_3 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_3_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom red_key_3 room_2) (at_ red_key_3) (emptyhands))
  :effect (and (not (at_ red_key_3)) (not (emptyhands)) (carrying red_key_3) (not (objectinroom red_key_3 room_2))(forall (?d - door) (when (blocked ?d red_key_3 room_2) (not (blocked ?d red_key_3 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_3_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom red_key_3 room_3) (at_ red_key_3) (emptyhands))
  :effect (and (not (at_ red_key_3)) (not (emptyhands)) (carrying red_key_3) (not (objectinroom red_key_3 room_3))(forall (?d - door) (when (blocked ?d red_key_3 room_3) (not (blocked ?d red_key_3 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom red_key_3 room_4) (at_ red_key_3) (emptyhands))
  :effect (and (not (at_ red_key_3)) (not (emptyhands)) (carrying red_key_3) (not (objectinroom red_key_3 room_4))(forall (?d - door) (when (blocked ?d red_key_3 room_4) (not (blocked ?d red_key_3 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom blue_key_2 room_1) (at_ blue_key_2) (emptyhands))
  :effect (and (not (at_ blue_key_2)) (not (emptyhands)) (carrying blue_key_2) (not (objectinroom blue_key_2 room_1))(forall (?d - door) (when (blocked ?d blue_key_2 room_1) (not (blocked ?d blue_key_2 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom blue_key_2 room_2) (at_ blue_key_2) (emptyhands))
  :effect (and (not (at_ blue_key_2)) (not (emptyhands)) (carrying blue_key_2) (not (objectinroom blue_key_2 room_2))(forall (?d - door) (when (blocked ?d blue_key_2 room_2) (not (blocked ?d blue_key_2 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom blue_key_2 room_3) (at_ blue_key_2) (emptyhands))
  :effect (and (not (at_ blue_key_2)) (not (emptyhands)) (carrying blue_key_2) (not (objectinroom blue_key_2 room_3))(forall (?d - door) (when (blocked ?d blue_key_2 room_3) (not (blocked ?d blue_key_2 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom blue_key_2 room_4) (at_ blue_key_2) (emptyhands))
  :effect (and (not (at_ blue_key_2)) (not (emptyhands)) (carrying blue_key_2) (not (objectinroom blue_key_2 room_4))(forall (?d - door) (when (blocked ?d blue_key_2 room_4) (not (blocked ?d blue_key_2 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_4_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom red_key_4 room_1) (at_ red_key_4) (emptyhands))
  :effect (and (not (at_ red_key_4)) (not (emptyhands)) (carrying red_key_4) (not (objectinroom red_key_4 room_1))(forall (?d - door) (when (blocked ?d red_key_4 room_1) (not (blocked ?d red_key_4 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom red_key_4 room_2) (at_ red_key_4) (emptyhands))
  :effect (and (not (at_ red_key_4)) (not (emptyhands)) (carrying red_key_4) (not (objectinroom red_key_4 room_2))(forall (?d - door) (when (blocked ?d red_key_4 room_2) (not (blocked ?d red_key_4 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom red_key_4 room_3) (at_ red_key_4) (emptyhands))
  :effect (and (not (at_ red_key_4)) (not (emptyhands)) (carrying red_key_4) (not (objectinroom red_key_4 room_3))(forall (?d - door) (when (blocked ?d red_key_4 room_3) (not (blocked ?d red_key_4 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_4_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom red_key_4 room_4) (at_ red_key_4) (emptyhands))
  :effect (and (not (at_ red_key_4)) (not (emptyhands)) (carrying red_key_4) (not (objectinroom red_key_4 room_4))(forall (?d - door) (when (blocked ?d red_key_4 room_4) (not (blocked ?d red_key_4 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom blue_key_1 room_1) (at_ blue_key_1) (emptyhands))
  :effect (and (not (at_ blue_key_1)) (not (emptyhands)) (carrying blue_key_1) (not (objectinroom blue_key_1 room_1))(forall (?d - door) (when (blocked ?d blue_key_1 room_1) (not (blocked ?d blue_key_1 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom blue_key_1 room_2) (at_ blue_key_1) (emptyhands))
  :effect (and (not (at_ blue_key_1)) (not (emptyhands)) (carrying blue_key_1) (not (objectinroom blue_key_1 room_2))(forall (?d - door) (when (blocked ?d blue_key_1 room_2) (not (blocked ?d blue_key_1 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom blue_key_1 room_3) (at_ blue_key_1) (emptyhands))
  :effect (and (not (at_ blue_key_1)) (not (emptyhands)) (carrying blue_key_1) (not (objectinroom blue_key_1 room_3))(forall (?d - door) (when (blocked ?d blue_key_1 room_3) (not (blocked ?d blue_key_1 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom blue_key_1 room_4) (at_ blue_key_1) (emptyhands))
  :effect (and (not (at_ blue_key_1)) (not (emptyhands)) (carrying blue_key_1) (not (objectinroom blue_key_1 room_4))(forall (?d - door) (when (blocked ?d blue_key_1 room_4) (not (blocked ?d blue_key_1 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom red_key_1 room_1) (at_ red_key_1) (emptyhands))
  :effect (and (not (at_ red_key_1)) (not (emptyhands)) (carrying red_key_1) (not (objectinroom red_key_1 room_1))(forall (?d - door) (when (blocked ?d red_key_1 room_1) (not (blocked ?d red_key_1 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom red_key_1 room_2) (at_ red_key_1) (emptyhands))
  :effect (and (not (at_ red_key_1)) (not (emptyhands)) (carrying red_key_1) (not (objectinroom red_key_1 room_2))(forall (?d - door) (when (blocked ?d red_key_1 room_2) (not (blocked ?d red_key_1 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom red_key_1 room_3) (at_ red_key_1) (emptyhands))
  :effect (and (not (at_ red_key_1)) (not (emptyhands)) (carrying red_key_1) (not (objectinroom red_key_1 room_3))(forall (?d - door) (when (blocked ?d red_key_1 room_3) (not (blocked ?d red_key_1 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom red_key_1 room_4) (at_ red_key_1) (emptyhands))
  :effect (and (not (at_ red_key_1)) (not (emptyhands)) (carrying red_key_1) (not (objectinroom red_key_1 room_4))(forall (?d - door) (when (blocked ?d red_key_1 room_4) (not (blocked ?d red_key_1 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_4_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom blue_key_4 room_1) (at_ blue_key_4) (emptyhands))
  :effect (and (not (at_ blue_key_4)) (not (emptyhands)) (carrying blue_key_4) (not (objectinroom blue_key_4 room_1))(forall (?d - door) (when (blocked ?d blue_key_4 room_1) (not (blocked ?d blue_key_4 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom blue_key_4 room_2) (at_ blue_key_4) (emptyhands))
  :effect (and (not (at_ blue_key_4)) (not (emptyhands)) (carrying blue_key_4) (not (objectinroom blue_key_4 room_2))(forall (?d - door) (when (blocked ?d blue_key_4 room_2) (not (blocked ?d blue_key_4 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom blue_key_4 room_3) (at_ blue_key_4) (emptyhands))
  :effect (and (not (at_ blue_key_4)) (not (emptyhands)) (carrying blue_key_4) (not (objectinroom blue_key_4 room_3))(forall (?d - door) (when (blocked ?d blue_key_4 room_3) (not (blocked ?d blue_key_4 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_key_4_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom blue_key_4 room_4) (at_ blue_key_4) (emptyhands))
  :effect (and (not (at_ blue_key_4)) (not (emptyhands)) (carrying blue_key_4) (not (objectinroom blue_key_4 room_4))(forall (?d - door) (when (blocked ?d blue_key_4 room_4) (not (blocked ?d blue_key_4 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom red_key_2 room_1) (at_ red_key_2) (emptyhands))
  :effect (and (not (at_ red_key_2)) (not (emptyhands)) (carrying red_key_2) (not (objectinroom red_key_2 room_1))(forall (?d - door) (when (blocked ?d red_key_2 room_1) (not (blocked ?d red_key_2 room_1)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom red_key_2 room_2) (at_ red_key_2) (emptyhands))
  :effect (and (not (at_ red_key_2)) (not (emptyhands)) (carrying red_key_2) (not (objectinroom red_key_2 room_2))(forall (?d - door) (when (blocked ?d red_key_2 room_2) (not (blocked ?d red_key_2 room_2)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom red_key_2 room_3) (at_ red_key_2) (emptyhands))
  :effect (and (not (at_ red_key_2)) (not (emptyhands)) (carrying red_key_2) (not (objectinroom red_key_2 room_3))(forall (?d - door) (when (blocked ?d red_key_2 room_3) (not (blocked ?d red_key_2 room_3)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action pick_red_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom red_key_2 room_4) (at_ red_key_2) (emptyhands))
  :effect (and (not (at_ red_key_2)) (not (emptyhands)) (carrying red_key_2) (not (objectinroom red_key_2 room_4))(forall (?d - door) (when (blocked ?d red_key_2 room_4) (not (blocked ?d red_key_2 room_4)))) (when (objectinroom yellow_ball_1 room_2) (hold_0)) (increase (total-cost) 1)))
 (:action drop_empty_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying empty) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying empty)) (at_ empty) (not (at_ empty)) (emptyhands) (objectinroom empty room_1) (increase (total-cost) 1)))
 (:action drop_empty_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying empty) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying empty)) (at_ empty) (not (at_ empty)) (emptyhands) (objectinroom empty room_2) (increase (total-cost) 1)))
 (:action drop_empty_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying empty) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying empty)) (at_ empty) (not (at_ empty)) (emptyhands) (objectinroom empty room_3) (increase (total-cost) 1)))
 (:action drop_empty_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying empty) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying empty)) (at_ empty) (not (at_ empty)) (emptyhands) (objectinroom empty room_4) (increase (total-cost) 1)))
 (:action drop_grey_ball_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying grey_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_ball_1)) (at_ grey_ball_1) (not (at_ empty)) (emptyhands) (objectinroom grey_ball_1 room_1) (increase (total-cost) 1)))
 (:action drop_grey_ball_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying grey_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_ball_1)) (at_ grey_ball_1) (not (at_ empty)) (emptyhands) (objectinroom grey_ball_1 room_2) (increase (total-cost) 1)))
 (:action drop_grey_ball_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying grey_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_ball_1)) (at_ grey_ball_1) (not (at_ empty)) (emptyhands) (objectinroom grey_ball_1 room_3) (increase (total-cost) 1)))
 (:action drop_grey_ball_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying grey_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_ball_1)) (at_ grey_ball_1) (not (at_ empty)) (emptyhands) (objectinroom grey_ball_1 room_4) (increase (total-cost) 1)))
 (:action drop_yellow_ball_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying yellow_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_ball_1)) (at_ yellow_ball_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_ball_1 room_1) (increase (total-cost) 1)))
 (:action drop_yellow_ball_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying yellow_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_ball_1)) (at_ yellow_ball_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_ball_1 room_2) (increase (total-cost) 1)))
 (:action drop_yellow_ball_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying yellow_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_ball_1)) (at_ yellow_ball_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_ball_1 room_3) (increase (total-cost) 1)))
 (:action drop_yellow_ball_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying yellow_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_ball_1)) (at_ yellow_ball_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_ball_1 room_4) (increase (total-cost) 1)))
 (:action drop_blue_key_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying blue_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_3)) (at_ blue_key_3) (not (at_ empty)) (emptyhands) (objectinroom blue_key_3 room_1) (increase (total-cost) 1)))
 (:action drop_blue_key_3_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying blue_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_3)) (at_ blue_key_3) (not (at_ empty)) (emptyhands) (objectinroom blue_key_3 room_2) (increase (total-cost) 1)))
 (:action drop_blue_key_3_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying blue_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_3)) (at_ blue_key_3) (not (at_ empty)) (emptyhands) (objectinroom blue_key_3 room_3) (increase (total-cost) 1)))
 (:action drop_blue_key_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying blue_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_3)) (at_ blue_key_3) (not (at_ empty)) (emptyhands) (objectinroom blue_key_3 room_4) (increase (total-cost) 1)))
 (:action drop_red_key_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying red_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_3)) (at_ red_key_3) (not (at_ empty)) (emptyhands) (objectinroom red_key_3 room_1) (increase (total-cost) 1)))
 (:action drop_red_key_3_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying red_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_3)) (at_ red_key_3) (not (at_ empty)) (emptyhands) (objectinroom red_key_3 room_2) (increase (total-cost) 1)))
 (:action drop_red_key_3_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying red_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_3)) (at_ red_key_3) (not (at_ empty)) (emptyhands) (objectinroom red_key_3 room_3) (increase (total-cost) 1)))
 (:action drop_red_key_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying red_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_3)) (at_ red_key_3) (not (at_ empty)) (emptyhands) (objectinroom red_key_3 room_4) (increase (total-cost) 1)))
 (:action drop_blue_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying blue_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_2)) (at_ blue_key_2) (not (at_ empty)) (emptyhands) (objectinroom blue_key_2 room_1) (increase (total-cost) 1)))
 (:action drop_blue_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying blue_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_2)) (at_ blue_key_2) (not (at_ empty)) (emptyhands) (objectinroom blue_key_2 room_2) (increase (total-cost) 1)))
 (:action drop_blue_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying blue_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_2)) (at_ blue_key_2) (not (at_ empty)) (emptyhands) (objectinroom blue_key_2 room_3) (increase (total-cost) 1)))
 (:action drop_blue_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying blue_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_2)) (at_ blue_key_2) (not (at_ empty)) (emptyhands) (objectinroom blue_key_2 room_4) (increase (total-cost) 1)))
 (:action drop_red_key_4_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying red_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_4)) (at_ red_key_4) (not (at_ empty)) (emptyhands) (objectinroom red_key_4 room_1) (increase (total-cost) 1)))
 (:action drop_red_key_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying red_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_4)) (at_ red_key_4) (not (at_ empty)) (emptyhands) (objectinroom red_key_4 room_2) (increase (total-cost) 1)))
 (:action drop_red_key_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying red_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_4)) (at_ red_key_4) (not (at_ empty)) (emptyhands) (objectinroom red_key_4 room_3) (increase (total-cost) 1)))
 (:action drop_red_key_4_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying red_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_4)) (at_ red_key_4) (not (at_ empty)) (emptyhands) (objectinroom red_key_4 room_4) (increase (total-cost) 1)))
 (:action drop_blue_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying blue_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_1)) (at_ blue_key_1) (not (at_ empty)) (emptyhands) (objectinroom blue_key_1 room_1) (increase (total-cost) 1)))
 (:action drop_blue_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying blue_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_1)) (at_ blue_key_1) (not (at_ empty)) (emptyhands) (objectinroom blue_key_1 room_2) (increase (total-cost) 1)))
 (:action drop_blue_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying blue_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_1)) (at_ blue_key_1) (not (at_ empty)) (emptyhands) (objectinroom blue_key_1 room_3) (increase (total-cost) 1)))
 (:action drop_blue_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying blue_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_1)) (at_ blue_key_1) (not (at_ empty)) (emptyhands) (objectinroom blue_key_1 room_4) (increase (total-cost) 1)))
 (:action drop_red_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying red_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_1)) (at_ red_key_1) (not (at_ empty)) (emptyhands) (objectinroom red_key_1 room_1) (increase (total-cost) 1)))
 (:action drop_red_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying red_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_1)) (at_ red_key_1) (not (at_ empty)) (emptyhands) (objectinroom red_key_1 room_2) (increase (total-cost) 1)))
 (:action drop_red_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying red_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_1)) (at_ red_key_1) (not (at_ empty)) (emptyhands) (objectinroom red_key_1 room_3) (increase (total-cost) 1)))
 (:action drop_red_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying red_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_1)) (at_ red_key_1) (not (at_ empty)) (emptyhands) (objectinroom red_key_1 room_4) (increase (total-cost) 1)))
 (:action drop_blue_key_4_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying blue_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_4)) (at_ blue_key_4) (not (at_ empty)) (emptyhands) (objectinroom blue_key_4 room_1) (increase (total-cost) 1)))
 (:action drop_blue_key_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying blue_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_4)) (at_ blue_key_4) (not (at_ empty)) (emptyhands) (objectinroom blue_key_4 room_2) (increase (total-cost) 1)))
 (:action drop_blue_key_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying blue_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_4)) (at_ blue_key_4) (not (at_ empty)) (emptyhands) (objectinroom blue_key_4 room_3) (increase (total-cost) 1)))
 (:action drop_blue_key_4_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying blue_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_key_4)) (at_ blue_key_4) (not (at_ empty)) (emptyhands) (objectinroom blue_key_4 room_4) (increase (total-cost) 1)))
 (:action drop_red_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying red_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_2)) (at_ red_key_2) (not (at_ empty)) (emptyhands) (objectinroom red_key_2 room_1) (increase (total-cost) 1)))
 (:action drop_red_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying red_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_2)) (at_ red_key_2) (not (at_ empty)) (emptyhands) (objectinroom red_key_2 room_2) (increase (total-cost) 1)))
 (:action drop_red_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying red_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_2)) (at_ red_key_2) (not (at_ empty)) (emptyhands) (objectinroom red_key_2 room_3) (increase (total-cost) 1)))
 (:action drop_red_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying red_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying red_key_2)) (at_ red_key_2) (not (at_ empty)) (emptyhands) (objectinroom red_key_2 room_4) (increase (total-cost) 1)))
 (:action toggle_blue_door_1
  :parameters ()
  :precondition (and (at_ blue_door_1))
  :effect (and (when (not (locked blue_door_1)) (locked blue_door_1)) (when (locked blue_door_1) (not (locked blue_door_1))) (increase (total-cost) 1)))
 (:action toggle_red_door_1
  :parameters ()
  :precondition (and (at_ red_door_1))
  :effect (and (when (not (locked red_door_1)) (locked red_door_1)) (when (locked red_door_1) (not (locked red_door_1))) (increase (total-cost) 1)))
 (:action toggle_red_door_2
  :parameters ()
  :precondition (and (at_ red_door_2))
  :effect (and (when (not (locked red_door_2)) (locked red_door_2)) (when (locked red_door_2) (not (locked red_door_2))) (increase (total-cost) 1)))
 (:action toggle_blue_door_2
  :parameters ()
  :precondition (and (at_ blue_door_2))
  :effect (and (when (not (locked blue_door_2)) (locked blue_door_2)) (when (locked blue_door_2) (not (locked blue_door_2))) (increase (total-cost) 1)))
)
