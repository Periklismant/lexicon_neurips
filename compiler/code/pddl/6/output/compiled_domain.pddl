(define (domain trajectoryconstraintsremover_minigrid_problem-domain)
 (:requirements :strips :typing :negative-preconditions :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 key ball box - object_
 )
 (:constants
   empty - empty_0
   room_3 room_4 room_2 room_1 - room
   grey_key_3 yellow_key_2 green_key_1 yellow_key_1 green_key_2 grey_key_2 grey_key_4 grey_key_1 - key
   blue_ball_1 - ball
   purple_box_1 - box
   yellow_door_1 grey_door_2 green_door_1 grey_door_1 - door
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
 (:action gotoobject_grey_key_2_room_1
  :parameters ()
  :precondition (and (objectinroom grey_key_2 room_1) (agentinroom room_1))
  :effect (and (at_ grey_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_2_room_2
  :parameters ()
  :precondition (and (objectinroom grey_key_2 room_2) (agentinroom room_2))
  :effect (and (at_ grey_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_2_room_3
  :parameters ()
  :precondition (and (objectinroom grey_key_2 room_3) (agentinroom room_3))
  :effect (and (at_ grey_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_2_room_4
  :parameters ()
  :precondition (and (objectinroom grey_key_2 room_4) (agentinroom room_4))
  :effect (and (at_ grey_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_3_room_1
  :parameters ()
  :precondition (and (objectinroom grey_key_3 room_1) (agentinroom room_1))
  :effect (and (at_ grey_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_3_room_2
  :parameters ()
  :precondition (and (objectinroom grey_key_3 room_2) (agentinroom room_2))
  :effect (and (at_ grey_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_3_room_3
  :parameters ()
  :precondition (and (objectinroom grey_key_3 room_3) (agentinroom room_3))
  :effect (and (at_ grey_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_3_room_4
  :parameters ()
  :precondition (and (objectinroom grey_key_3 room_4) (agentinroom room_4))
  :effect (and (at_ grey_key_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_1_room_1
  :parameters ()
  :precondition (and (objectinroom yellow_key_1 room_1) (agentinroom room_1))
  :effect (and (at_ yellow_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_1_room_2
  :parameters ()
  :precondition (and (objectinroom yellow_key_1 room_2) (agentinroom room_2))
  :effect (and (at_ yellow_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_1_room_3
  :parameters ()
  :precondition (and (objectinroom yellow_key_1 room_3) (agentinroom room_3))
  :effect (and (at_ yellow_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_1_room_4
  :parameters ()
  :precondition (and (objectinroom yellow_key_1 room_4) (agentinroom room_4))
  :effect (and (at_ yellow_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_4_room_1
  :parameters ()
  :precondition (and (objectinroom grey_key_4 room_1) (agentinroom room_1))
  :effect (and (at_ grey_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_4_room_2
  :parameters ()
  :precondition (and (objectinroom grey_key_4 room_2) (agentinroom room_2))
  :effect (and (at_ grey_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_4_room_3
  :parameters ()
  :precondition (and (objectinroom grey_key_4 room_3) (agentinroom room_3))
  :effect (and (at_ grey_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_4_room_4
  :parameters ()
  :precondition (and (objectinroom grey_key_4 room_4) (agentinroom room_4))
  :effect (and (at_ grey_key_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_1_room_1
  :parameters ()
  :precondition (and (objectinroom green_key_1 room_1) (agentinroom room_1))
  :effect (and (at_ green_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_1_room_2
  :parameters ()
  :precondition (and (objectinroom green_key_1 room_2) (agentinroom room_2))
  :effect (and (at_ green_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_1_room_3
  :parameters ()
  :precondition (and (objectinroom green_key_1 room_3) (agentinroom room_3))
  :effect (and (at_ green_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_1_room_4
  :parameters ()
  :precondition (and (objectinroom green_key_1 room_4) (agentinroom room_4))
  :effect (and (at_ green_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_2_room_1
  :parameters ()
  :precondition (and (objectinroom green_key_2 room_1) (agentinroom room_1))
  :effect (and (at_ green_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_2_room_2
  :parameters ()
  :precondition (and (objectinroom green_key_2 room_2) (agentinroom room_2))
  :effect (and (at_ green_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_2_room_3
  :parameters ()
  :precondition (and (objectinroom green_key_2 room_3) (agentinroom room_3))
  :effect (and (at_ green_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_green_key_2_room_4
  :parameters ()
  :precondition (and (objectinroom green_key_2 room_4) (agentinroom room_4))
  :effect (and (at_ green_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_1_room_1
  :parameters ()
  :precondition (and (objectinroom grey_key_1 room_1) (agentinroom room_1))
  :effect (and (at_ grey_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_1_room_2
  :parameters ()
  :precondition (and (objectinroom grey_key_1 room_2) (agentinroom room_2))
  :effect (and (at_ grey_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_1_room_3
  :parameters ()
  :precondition (and (objectinroom grey_key_1 room_3) (agentinroom room_3))
  :effect (and (at_ grey_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_grey_key_1_room_4
  :parameters ()
  :precondition (and (objectinroom grey_key_1 room_4) (agentinroom room_4))
  :effect (and (at_ grey_key_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_2_room_1
  :parameters ()
  :precondition (and (objectinroom yellow_key_2 room_1) (agentinroom room_1))
  :effect (and (at_ yellow_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_2_room_2
  :parameters ()
  :precondition (and (objectinroom yellow_key_2 room_2) (agentinroom room_2))
  :effect (and (at_ yellow_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_2_room_3
  :parameters ()
  :precondition (and (objectinroom yellow_key_2 room_3) (agentinroom room_3))
  :effect (and (at_ yellow_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_yellow_key_2_room_4
  :parameters ()
  :precondition (and (objectinroom yellow_key_2 room_4) (agentinroom room_4))
  :effect (and (at_ yellow_key_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_ball_1_room_1
  :parameters ()
  :precondition (and (objectinroom blue_ball_1 room_1) (agentinroom room_1))
  :effect (and (at_ blue_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_ball_1_room_2
  :parameters ()
  :precondition (and (objectinroom blue_ball_1 room_2) (agentinroom room_2))
  :effect (and (at_ blue_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_ball_1_room_3
  :parameters ()
  :precondition (and (objectinroom blue_ball_1 room_3) (agentinroom room_3))
  :effect (and (at_ blue_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_blue_ball_1_room_4
  :parameters ()
  :precondition (and (objectinroom blue_ball_1 room_4) (agentinroom room_4))
  :effect (and (at_ blue_ball_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_purple_box_1_room_1
  :parameters ()
  :precondition (and (objectinroom purple_box_1 room_1) (agentinroom room_1))
  :effect (and (at_ purple_box_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_purple_box_1_room_2
  :parameters ()
  :precondition (and (objectinroom purple_box_1 room_2) (agentinroom room_2))
  :effect (and (at_ purple_box_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_purple_box_1_room_3
  :parameters ()
  :precondition (and (objectinroom purple_box_1 room_3) (agentinroom room_3))
  :effect (and (at_ purple_box_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoobject_purple_box_1_room_4
  :parameters ()
  :precondition (and (objectinroom purple_box_1 room_4) (agentinroom room_4))
  :effect (and (at_ purple_box_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and (at_ empty)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_grey_door_1_room_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_1) (forall (?o - object_)
 (not (blocked grey_door_1 ?o room_1))))
  :effect (and (at_ grey_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_grey_door_1_room_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_2) (forall (?o - object_)
 (not (blocked grey_door_1 ?o room_2))))
  :effect (and (at_ grey_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_yellow_door_1_room_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_1) (forall (?o - object_)
 (not (blocked yellow_door_1 ?o room_1))))
  :effect (and (at_ yellow_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_yellow_door_1_room_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_3) (forall (?o - object_)
 (not (blocked yellow_door_1 ?o room_3))))
  :effect (and (at_ yellow_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_green_door_1_room_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_2) (forall (?o - object_)
 (not (blocked green_door_1 ?o room_2))))
  :effect (and (at_ green_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (not (emptyhands)) (hold_0)) (increase (total-cost) 1)))
 (:action gotodoor_green_door_1_room_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_4) (forall (?o - object_)
 (not (blocked green_door_1 ?o room_4))))
  :effect (and (at_ green_door_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (not (emptyhands)) (hold_0)) (increase (total-cost) 1)))
 (:action gotodoor_grey_door_2_room_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_3) (forall (?o - object_)
 (not (blocked grey_door_2 ?o room_3))))
  :effect (and (at_ grey_door_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotodoor_grey_door_2_room_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_4) (forall (?o - object_)
 (not (blocked grey_door_2 ?o room_4))))
  :effect (and (at_ grey_door_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_1_room_2_grey_door_1
  :parameters ()
  :precondition (and (agentinroom room_1) (not (locked grey_door_1)))
  :effect (and (not (agentinroom room_1)) (agentinroom room_2) (visited room_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_1_room_3_yellow_door_1
  :parameters ()
  :precondition (and (agentinroom room_1) (not (locked yellow_door_1)))
  :effect (and (not (agentinroom room_1)) (agentinroom room_3) (visited room_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_2_room_1_grey_door_1
  :parameters ()
  :precondition (and (agentinroom room_2) (not (locked grey_door_1)))
  :effect (and (not (agentinroom room_2)) (agentinroom room_1) (visited room_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_2_room_4_green_door_1
  :parameters ()
  :precondition (and (agentinroom room_2) (not (locked green_door_1)))
  :effect (and (not (agentinroom room_2)) (agentinroom room_4) (visited room_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_3_room_1_yellow_door_1
  :parameters ()
  :precondition (and (agentinroom room_3) (not (locked yellow_door_1)))
  :effect (and (not (agentinroom room_3)) (agentinroom room_1) (visited room_1)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_3_room_4_grey_door_2
  :parameters ()
  :precondition (and (agentinroom room_3) (not (locked grey_door_2)))
  :effect (and (not (agentinroom room_3)) (agentinroom room_4) (visited room_4)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_4_room_2_green_door_1
  :parameters ()
  :precondition (and (agentinroom room_4) (not (locked green_door_1)))
  :effect (and (not (agentinroom room_4)) (agentinroom room_2) (visited room_2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action gotoroom_room_4_room_3_grey_door_2
  :parameters ()
  :precondition (and (agentinroom room_4) (not (locked grey_door_2)))
  :effect (and (not (agentinroom room_4)) (agentinroom room_3) (visited room_3)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action pick_empty_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom empty room_1) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_1))(forall (?d - door) (when (blocked ?d empty room_1) (not (blocked ?d empty room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_empty_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom empty room_2) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_2))(forall (?d - door) (when (blocked ?d empty room_2) (not (blocked ?d empty room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_empty_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom empty room_3) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_3))(forall (?d - door) (when (blocked ?d empty room_3) (not (blocked ?d empty room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_empty_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom empty room_4) (at_ empty) (emptyhands))
  :effect (and (not (at_ empty)) (not (emptyhands)) (carrying empty) (not (objectinroom empty room_4))(forall (?d - door) (when (blocked ?d empty room_4) (not (blocked ?d empty room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom grey_key_2 room_1) (at_ grey_key_2) (emptyhands))
  :effect (and (not (at_ grey_key_2)) (not (emptyhands)) (carrying grey_key_2) (not (objectinroom grey_key_2 room_1))(forall (?d - door) (when (blocked ?d grey_key_2 room_1) (not (blocked ?d grey_key_2 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom grey_key_2 room_2) (at_ grey_key_2) (emptyhands))
  :effect (and (not (at_ grey_key_2)) (not (emptyhands)) (carrying grey_key_2) (not (objectinroom grey_key_2 room_2))(forall (?d - door) (when (blocked ?d grey_key_2 room_2) (not (blocked ?d grey_key_2 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom grey_key_2 room_3) (at_ grey_key_2) (emptyhands))
  :effect (and (not (at_ grey_key_2)) (not (emptyhands)) (carrying grey_key_2) (not (objectinroom grey_key_2 room_3))(forall (?d - door) (when (blocked ?d grey_key_2 room_3) (not (blocked ?d grey_key_2 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom grey_key_2 room_4) (at_ grey_key_2) (emptyhands))
  :effect (and (not (at_ grey_key_2)) (not (emptyhands)) (carrying grey_key_2) (not (objectinroom grey_key_2 room_4))(forall (?d - door) (when (blocked ?d grey_key_2 room_4) (not (blocked ?d grey_key_2 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom grey_key_3 room_1) (at_ grey_key_3) (emptyhands))
  :effect (and (not (at_ grey_key_3)) (not (emptyhands)) (carrying grey_key_3) (not (objectinroom grey_key_3 room_1))(forall (?d - door) (when (blocked ?d grey_key_3 room_1) (not (blocked ?d grey_key_3 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_3_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom grey_key_3 room_2) (at_ grey_key_3) (emptyhands))
  :effect (and (not (at_ grey_key_3)) (not (emptyhands)) (carrying grey_key_3) (not (objectinroom grey_key_3 room_2))(forall (?d - door) (when (blocked ?d grey_key_3 room_2) (not (blocked ?d grey_key_3 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_3_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom grey_key_3 room_3) (at_ grey_key_3) (emptyhands))
  :effect (and (not (at_ grey_key_3)) (not (emptyhands)) (carrying grey_key_3) (not (objectinroom grey_key_3 room_3))(forall (?d - door) (when (blocked ?d grey_key_3 room_3) (not (blocked ?d grey_key_3 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom grey_key_3 room_4) (at_ grey_key_3) (emptyhands))
  :effect (and (not (at_ grey_key_3)) (not (emptyhands)) (carrying grey_key_3) (not (objectinroom grey_key_3 room_4))(forall (?d - door) (when (blocked ?d grey_key_3 room_4) (not (blocked ?d grey_key_3 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom yellow_key_1 room_1) (at_ yellow_key_1) (emptyhands))
  :effect (and (not (at_ yellow_key_1)) (not (emptyhands)) (carrying yellow_key_1) (not (objectinroom yellow_key_1 room_1))(forall (?d - door) (when (blocked ?d yellow_key_1 room_1) (not (blocked ?d yellow_key_1 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom yellow_key_1 room_2) (at_ yellow_key_1) (emptyhands))
  :effect (and (not (at_ yellow_key_1)) (not (emptyhands)) (carrying yellow_key_1) (not (objectinroom yellow_key_1 room_2))(forall (?d - door) (when (blocked ?d yellow_key_1 room_2) (not (blocked ?d yellow_key_1 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom yellow_key_1 room_3) (at_ yellow_key_1) (emptyhands))
  :effect (and (not (at_ yellow_key_1)) (not (emptyhands)) (carrying yellow_key_1) (not (objectinroom yellow_key_1 room_3))(forall (?d - door) (when (blocked ?d yellow_key_1 room_3) (not (blocked ?d yellow_key_1 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom yellow_key_1 room_4) (at_ yellow_key_1) (emptyhands))
  :effect (and (not (at_ yellow_key_1)) (not (emptyhands)) (carrying yellow_key_1) (not (objectinroom yellow_key_1 room_4))(forall (?d - door) (when (blocked ?d yellow_key_1 room_4) (not (blocked ?d yellow_key_1 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_4_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom grey_key_4 room_1) (at_ grey_key_4) (emptyhands))
  :effect (and (not (at_ grey_key_4)) (not (emptyhands)) (carrying grey_key_4) (not (objectinroom grey_key_4 room_1))(forall (?d - door) (when (blocked ?d grey_key_4 room_1) (not (blocked ?d grey_key_4 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom grey_key_4 room_2) (at_ grey_key_4) (emptyhands))
  :effect (and (not (at_ grey_key_4)) (not (emptyhands)) (carrying grey_key_4) (not (objectinroom grey_key_4 room_2))(forall (?d - door) (when (blocked ?d grey_key_4 room_2) (not (blocked ?d grey_key_4 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom grey_key_4 room_3) (at_ grey_key_4) (emptyhands))
  :effect (and (not (at_ grey_key_4)) (not (emptyhands)) (carrying grey_key_4) (not (objectinroom grey_key_4 room_3))(forall (?d - door) (when (blocked ?d grey_key_4 room_3) (not (blocked ?d grey_key_4 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_4_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom grey_key_4 room_4) (at_ grey_key_4) (emptyhands))
  :effect (and (not (at_ grey_key_4)) (not (emptyhands)) (carrying grey_key_4) (not (objectinroom grey_key_4 room_4))(forall (?d - door) (when (blocked ?d grey_key_4 room_4) (not (blocked ?d grey_key_4 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom green_key_1 room_1) (at_ green_key_1) (emptyhands))
  :effect (and (not (at_ green_key_1)) (not (emptyhands)) (carrying green_key_1) (not (objectinroom green_key_1 room_1))(forall (?d - door) (when (blocked ?d green_key_1 room_1) (not (blocked ?d green_key_1 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom green_key_1 room_2) (at_ green_key_1) (emptyhands))
  :effect (and (not (at_ green_key_1)) (not (emptyhands)) (carrying green_key_1) (not (objectinroom green_key_1 room_2))(forall (?d - door) (when (blocked ?d green_key_1 room_2) (not (blocked ?d green_key_1 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom green_key_1 room_3) (at_ green_key_1) (emptyhands))
  :effect (and (not (at_ green_key_1)) (not (emptyhands)) (carrying green_key_1) (not (objectinroom green_key_1 room_3))(forall (?d - door) (when (blocked ?d green_key_1 room_3) (not (blocked ?d green_key_1 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom green_key_1 room_4) (at_ green_key_1) (emptyhands))
  :effect (and (not (at_ green_key_1)) (not (emptyhands)) (carrying green_key_1) (not (objectinroom green_key_1 room_4))(forall (?d - door) (when (blocked ?d green_key_1 room_4) (not (blocked ?d green_key_1 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom green_key_2 room_1) (at_ green_key_2) (emptyhands))
  :effect (and (not (at_ green_key_2)) (not (emptyhands)) (carrying green_key_2) (not (objectinroom green_key_2 room_1))(forall (?d - door) (when (blocked ?d green_key_2 room_1) (not (blocked ?d green_key_2 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom green_key_2 room_2) (at_ green_key_2) (emptyhands))
  :effect (and (not (at_ green_key_2)) (not (emptyhands)) (carrying green_key_2) (not (objectinroom green_key_2 room_2))(forall (?d - door) (when (blocked ?d green_key_2 room_2) (not (blocked ?d green_key_2 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom green_key_2 room_3) (at_ green_key_2) (emptyhands))
  :effect (and (not (at_ green_key_2)) (not (emptyhands)) (carrying green_key_2) (not (objectinroom green_key_2 room_3))(forall (?d - door) (when (blocked ?d green_key_2 room_3) (not (blocked ?d green_key_2 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_green_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom green_key_2 room_4) (at_ green_key_2) (emptyhands))
  :effect (and (not (at_ green_key_2)) (not (emptyhands)) (carrying green_key_2) (not (objectinroom green_key_2 room_4))(forall (?d - door) (when (blocked ?d green_key_2 room_4) (not (blocked ?d green_key_2 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom grey_key_1 room_1) (at_ grey_key_1) (emptyhands))
  :effect (and (not (at_ grey_key_1)) (not (emptyhands)) (carrying grey_key_1) (not (objectinroom grey_key_1 room_1))(forall (?d - door) (when (blocked ?d grey_key_1 room_1) (not (blocked ?d grey_key_1 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom grey_key_1 room_2) (at_ grey_key_1) (emptyhands))
  :effect (and (not (at_ grey_key_1)) (not (emptyhands)) (carrying grey_key_1) (not (objectinroom grey_key_1 room_2))(forall (?d - door) (when (blocked ?d grey_key_1 room_2) (not (blocked ?d grey_key_1 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom grey_key_1 room_3) (at_ grey_key_1) (emptyhands))
  :effect (and (not (at_ grey_key_1)) (not (emptyhands)) (carrying grey_key_1) (not (objectinroom grey_key_1 room_3))(forall (?d - door) (when (blocked ?d grey_key_1 room_3) (not (blocked ?d grey_key_1 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_grey_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom grey_key_1 room_4) (at_ grey_key_1) (emptyhands))
  :effect (and (not (at_ grey_key_1)) (not (emptyhands)) (carrying grey_key_1) (not (objectinroom grey_key_1 room_4))(forall (?d - door) (when (blocked ?d grey_key_1 room_4) (not (blocked ?d grey_key_1 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom yellow_key_2 room_1) (at_ yellow_key_2) (emptyhands))
  :effect (and (not (at_ yellow_key_2)) (not (emptyhands)) (carrying yellow_key_2) (not (objectinroom yellow_key_2 room_1))(forall (?d - door) (when (blocked ?d yellow_key_2 room_1) (not (blocked ?d yellow_key_2 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom yellow_key_2 room_2) (at_ yellow_key_2) (emptyhands))
  :effect (and (not (at_ yellow_key_2)) (not (emptyhands)) (carrying yellow_key_2) (not (objectinroom yellow_key_2 room_2))(forall (?d - door) (when (blocked ?d yellow_key_2 room_2) (not (blocked ?d yellow_key_2 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom yellow_key_2 room_3) (at_ yellow_key_2) (emptyhands))
  :effect (and (not (at_ yellow_key_2)) (not (emptyhands)) (carrying yellow_key_2) (not (objectinroom yellow_key_2 room_3))(forall (?d - door) (when (blocked ?d yellow_key_2 room_3) (not (blocked ?d yellow_key_2 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_yellow_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom yellow_key_2 room_4) (at_ yellow_key_2) (emptyhands))
  :effect (and (not (at_ yellow_key_2)) (not (emptyhands)) (carrying yellow_key_2) (not (objectinroom yellow_key_2 room_4))(forall (?d - door) (when (blocked ?d yellow_key_2 room_4) (not (blocked ?d yellow_key_2 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_ball_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom blue_ball_1 room_1) (at_ blue_ball_1) (emptyhands))
  :effect (and (not (at_ blue_ball_1)) (not (emptyhands)) (carrying blue_ball_1) (not (objectinroom blue_ball_1 room_1))(forall (?d - door) (when (blocked ?d blue_ball_1 room_1) (not (blocked ?d blue_ball_1 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_ball_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom blue_ball_1 room_2) (at_ blue_ball_1) (emptyhands))
  :effect (and (not (at_ blue_ball_1)) (not (emptyhands)) (carrying blue_ball_1) (not (objectinroom blue_ball_1 room_2))(forall (?d - door) (when (blocked ?d blue_ball_1 room_2) (not (blocked ?d blue_ball_1 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_ball_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom blue_ball_1 room_3) (at_ blue_ball_1) (emptyhands))
  :effect (and (not (at_ blue_ball_1)) (not (emptyhands)) (carrying blue_ball_1) (not (objectinroom blue_ball_1 room_3))(forall (?d - door) (when (blocked ?d blue_ball_1 room_3) (not (blocked ?d blue_ball_1 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_blue_ball_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom blue_ball_1 room_4) (at_ blue_ball_1) (emptyhands))
  :effect (and (not (at_ blue_ball_1)) (not (emptyhands)) (carrying blue_ball_1) (not (objectinroom blue_ball_1 room_4))(forall (?d - door) (when (blocked ?d blue_ball_1 room_4) (not (blocked ?d blue_ball_1 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_purple_box_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (objectinroom purple_box_1 room_1) (at_ purple_box_1) (emptyhands))
  :effect (and (not (at_ purple_box_1)) (not (emptyhands)) (carrying purple_box_1) (not (objectinroom purple_box_1 room_1))(forall (?d - door) (when (blocked ?d purple_box_1 room_1) (not (blocked ?d purple_box_1 room_1)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_purple_box_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (objectinroom purple_box_1 room_2) (at_ purple_box_1) (emptyhands))
  :effect (and (not (at_ purple_box_1)) (not (emptyhands)) (carrying purple_box_1) (not (objectinroom purple_box_1 room_2))(forall (?d - door) (when (blocked ?d purple_box_1 room_2) (not (blocked ?d purple_box_1 room_2)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_purple_box_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (objectinroom purple_box_1 room_3) (at_ purple_box_1) (emptyhands))
  :effect (and (not (at_ purple_box_1)) (not (emptyhands)) (carrying purple_box_1) (not (objectinroom purple_box_1 room_3))(forall (?d - door) (when (blocked ?d purple_box_1 room_3) (not (blocked ?d purple_box_1 room_3)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
 (:action pick_purple_box_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (objectinroom purple_box_1 room_4) (at_ purple_box_1) (emptyhands))
  :effect (and (not (at_ purple_box_1)) (not (emptyhands)) (carrying purple_box_1) (not (objectinroom purple_box_1 room_4))(forall (?d - door) (when (blocked ?d purple_box_1 room_4) (not (blocked ?d purple_box_1 room_4)))) (when (at_ green_door_1) (hold_0)) (increase (total-cost) 1)))
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
 (:action drop_grey_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying grey_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_2)) (at_ grey_key_2) (not (at_ empty)) (emptyhands) (objectinroom grey_key_2 room_1) (increase (total-cost) 1)))
 (:action drop_grey_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying grey_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_2)) (at_ grey_key_2) (not (at_ empty)) (emptyhands) (objectinroom grey_key_2 room_2) (increase (total-cost) 1)))
 (:action drop_grey_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying grey_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_2)) (at_ grey_key_2) (not (at_ empty)) (emptyhands) (objectinroom grey_key_2 room_3) (increase (total-cost) 1)))
 (:action drop_grey_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying grey_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_2)) (at_ grey_key_2) (not (at_ empty)) (emptyhands) (objectinroom grey_key_2 room_4) (increase (total-cost) 1)))
 (:action drop_grey_key_3_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying grey_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_3)) (at_ grey_key_3) (not (at_ empty)) (emptyhands) (objectinroom grey_key_3 room_1) (increase (total-cost) 1)))
 (:action drop_grey_key_3_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying grey_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_3)) (at_ grey_key_3) (not (at_ empty)) (emptyhands) (objectinroom grey_key_3 room_2) (increase (total-cost) 1)))
 (:action drop_grey_key_3_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying grey_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_3)) (at_ grey_key_3) (not (at_ empty)) (emptyhands) (objectinroom grey_key_3 room_3) (increase (total-cost) 1)))
 (:action drop_grey_key_3_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying grey_key_3) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_3)) (at_ grey_key_3) (not (at_ empty)) (emptyhands) (objectinroom grey_key_3 room_4) (increase (total-cost) 1)))
 (:action drop_yellow_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying yellow_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_1)) (at_ yellow_key_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_1 room_1) (increase (total-cost) 1)))
 (:action drop_yellow_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying yellow_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_1)) (at_ yellow_key_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_1 room_2) (increase (total-cost) 1)))
 (:action drop_yellow_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying yellow_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_1)) (at_ yellow_key_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_1 room_3) (increase (total-cost) 1)))
 (:action drop_yellow_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying yellow_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_1)) (at_ yellow_key_1) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_1 room_4) (increase (total-cost) 1)))
 (:action drop_grey_key_4_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying grey_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_4)) (at_ grey_key_4) (not (at_ empty)) (emptyhands) (objectinroom grey_key_4 room_1) (increase (total-cost) 1)))
 (:action drop_grey_key_4_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying grey_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_4)) (at_ grey_key_4) (not (at_ empty)) (emptyhands) (objectinroom grey_key_4 room_2) (increase (total-cost) 1)))
 (:action drop_grey_key_4_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying grey_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_4)) (at_ grey_key_4) (not (at_ empty)) (emptyhands) (objectinroom grey_key_4 room_3) (increase (total-cost) 1)))
 (:action drop_grey_key_4_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying grey_key_4) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_4)) (at_ grey_key_4) (not (at_ empty)) (emptyhands) (objectinroom grey_key_4 room_4) (increase (total-cost) 1)))
 (:action drop_green_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying green_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_1)) (at_ green_key_1) (not (at_ empty)) (emptyhands) (objectinroom green_key_1 room_1) (increase (total-cost) 1)))
 (:action drop_green_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying green_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_1)) (at_ green_key_1) (not (at_ empty)) (emptyhands) (objectinroom green_key_1 room_2) (increase (total-cost) 1)))
 (:action drop_green_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying green_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_1)) (at_ green_key_1) (not (at_ empty)) (emptyhands) (objectinroom green_key_1 room_3) (increase (total-cost) 1)))
 (:action drop_green_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying green_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_1)) (at_ green_key_1) (not (at_ empty)) (emptyhands) (objectinroom green_key_1 room_4) (increase (total-cost) 1)))
 (:action drop_green_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying green_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_2)) (at_ green_key_2) (not (at_ empty)) (emptyhands) (objectinroom green_key_2 room_1) (increase (total-cost) 1)))
 (:action drop_green_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying green_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_2)) (at_ green_key_2) (not (at_ empty)) (emptyhands) (objectinroom green_key_2 room_2) (increase (total-cost) 1)))
 (:action drop_green_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying green_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_2)) (at_ green_key_2) (not (at_ empty)) (emptyhands) (objectinroom green_key_2 room_3) (increase (total-cost) 1)))
 (:action drop_green_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying green_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying green_key_2)) (at_ green_key_2) (not (at_ empty)) (emptyhands) (objectinroom green_key_2 room_4) (increase (total-cost) 1)))
 (:action drop_grey_key_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying grey_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_1)) (at_ grey_key_1) (not (at_ empty)) (emptyhands) (objectinroom grey_key_1 room_1) (increase (total-cost) 1)))
 (:action drop_grey_key_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying grey_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_1)) (at_ grey_key_1) (not (at_ empty)) (emptyhands) (objectinroom grey_key_1 room_2) (increase (total-cost) 1)))
 (:action drop_grey_key_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying grey_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_1)) (at_ grey_key_1) (not (at_ empty)) (emptyhands) (objectinroom grey_key_1 room_3) (increase (total-cost) 1)))
 (:action drop_grey_key_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying grey_key_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying grey_key_1)) (at_ grey_key_1) (not (at_ empty)) (emptyhands) (objectinroom grey_key_1 room_4) (increase (total-cost) 1)))
 (:action drop_yellow_key_2_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying yellow_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_2)) (at_ yellow_key_2) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_2 room_1) (increase (total-cost) 1)))
 (:action drop_yellow_key_2_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying yellow_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_2)) (at_ yellow_key_2) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_2 room_2) (increase (total-cost) 1)))
 (:action drop_yellow_key_2_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying yellow_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_2)) (at_ yellow_key_2) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_2 room_3) (increase (total-cost) 1)))
 (:action drop_yellow_key_2_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying yellow_key_2) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying yellow_key_2)) (at_ yellow_key_2) (not (at_ empty)) (emptyhands) (objectinroom yellow_key_2 room_4) (increase (total-cost) 1)))
 (:action drop_blue_ball_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying blue_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_ball_1)) (at_ blue_ball_1) (not (at_ empty)) (emptyhands) (objectinroom blue_ball_1 room_1) (increase (total-cost) 1)))
 (:action drop_blue_ball_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying blue_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_ball_1)) (at_ blue_ball_1) (not (at_ empty)) (emptyhands) (objectinroom blue_ball_1 room_2) (increase (total-cost) 1)))
 (:action drop_blue_ball_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying blue_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_ball_1)) (at_ blue_ball_1) (not (at_ empty)) (emptyhands) (objectinroom blue_ball_1 room_3) (increase (total-cost) 1)))
 (:action drop_blue_ball_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying blue_ball_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying blue_ball_1)) (at_ blue_ball_1) (not (at_ empty)) (emptyhands) (objectinroom blue_ball_1 room_4) (increase (total-cost) 1)))
 (:action drop_purple_box_1_room_1
  :parameters ()
  :precondition (and (agentinroom room_1) (carrying purple_box_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying purple_box_1)) (at_ purple_box_1) (not (at_ empty)) (emptyhands) (objectinroom purple_box_1 room_1) (increase (total-cost) 1)))
 (:action drop_purple_box_1_room_2
  :parameters ()
  :precondition (and (agentinroom room_2) (carrying purple_box_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying purple_box_1)) (at_ purple_box_1) (not (at_ empty)) (emptyhands) (objectinroom purple_box_1 room_2) (increase (total-cost) 1)))
 (:action drop_purple_box_1_room_3
  :parameters ()
  :precondition (and (agentinroom room_3) (carrying purple_box_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying purple_box_1)) (at_ purple_box_1) (not (at_ empty)) (emptyhands) (objectinroom purple_box_1 room_3) (increase (total-cost) 1)))
 (:action drop_purple_box_1_room_4
  :parameters ()
  :precondition (and (agentinroom room_4) (carrying purple_box_1) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying purple_box_1)) (at_ purple_box_1) (not (at_ empty)) (emptyhands) (objectinroom purple_box_1 room_4) (increase (total-cost) 1)))
 (:action toggle_grey_door_1
  :parameters ()
  :precondition (and (at_ grey_door_1))
  :effect (and (when (not (locked grey_door_1)) (locked grey_door_1)) (when (locked grey_door_1) (not (locked grey_door_1))) (increase (total-cost) 1)))
 (:action toggle_yellow_door_1
  :parameters ()
  :precondition (and (at_ yellow_door_1))
  :effect (and (when (not (locked yellow_door_1)) (locked yellow_door_1)) (when (locked yellow_door_1) (not (locked yellow_door_1))) (increase (total-cost) 1)))
 (:action toggle_green_door_1
  :parameters ()
  :precondition (and (at_ green_door_1))
  :effect (and (when (not (locked green_door_1)) (locked green_door_1)) (when (locked green_door_1) (not (locked green_door_1))) (increase (total-cost) 1)))
 (:action toggle_grey_door_2
  :parameters ()
  :precondition (and (at_ grey_door_2))
  :effect (and (when (not (locked grey_door_2)) (locked grey_door_2)) (when (locked grey_door_2) (not (locked grey_door_2))) (increase (total-cost) 1)))
)
