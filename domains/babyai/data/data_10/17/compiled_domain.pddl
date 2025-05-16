(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   empty - empty_0
   room_2 room_1 room_4 - room
   blue_box_2 purple_box_1 blue_box_1 grey_box_1 - box
   yellow_door_1 green_door_1 - door
   purple_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (seen_psi_11) (hold_12))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (objectinroom empty room_2) (= ?obj purple_box_1)) (hold_12)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (objectinroom empty room_2) (hold_12)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door green_door_1)) (seen_psi_11)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door yellow_door_1) (hold_9)) (when (= ?door green_door_1) (hold_10)) (when (objectinroom empty room_2) (hold_12)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))) (carrying purple_box_1)) (hold_7)) (when (objectinroom empty room_2) (hold_12)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (objectinroom blue_box_1 room_4) (not (and (= ?obj blue_box_1) (= ?room room_4)))) (seen_psi_1)) (when (and (objectinroom blue_box_2 room_1) (not (and (= ?obj blue_box_2) (= ?room room_1)))) (hold_2)) (when (or (= ?obj blue_box_1) (carrying blue_box_1) (and (objectinroom purple_ball_1 room_2) (not (and (= ?obj purple_ball_1) (= ?room room_2))))) (hold_3)) (hold_5) (when (or (= ?obj grey_box_1) (carrying grey_box_1)) (hold_6)) (when (or (agentinroom room_2) (= ?obj purple_box_1) (carrying purple_box_1)) (hold_7)) (hold_8) (seen_psi_11) (when (or (and (objectinroom empty room_2) (not (and (= ?obj empty) (= ?room room_2)))) (and (at_ purple_box_1) (not (= ?obj purple_box_1)))) (hold_12)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (= ?obj blue_box_1) (= ?room room_4)) (objectinroom blue_box_1 room_4)) (seen_psi_1)) (when (or (and (carrying blue_box_1) (not (= ?obj blue_box_1))) (and (= ?obj purple_ball_1) (= ?room room_2)) (objectinroom purple_ball_1 room_2)) (hold_3)) (when (locked green_door_1) (not (hold_5))) (when (and (carrying grey_box_1) (not (= ?obj grey_box_1))) (hold_6)) (when (or (agentinroom room_2) (and (carrying purple_box_1) (not (= ?obj purple_box_1)))) (hold_7)) (when (or (and (= ?obj empty) (= ?room room_2)) (objectinroom empty room_2) (= ?obj purple_box_1) (at_ purple_box_1)) (hold_12)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))) (seen_psi_1)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (hold_0)) (when (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))) (hold_4)) (when (and (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))) (emptyhands)) (not (hold_5))) (increase (total-cost) 1)))
)
