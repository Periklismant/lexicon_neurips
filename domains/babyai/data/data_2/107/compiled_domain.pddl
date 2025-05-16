(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   purple_ball_1 - ball
   room_1 room_4 - room
   green_box_1 red_box_1 - box
   empty - empty_0
   purple_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (objectinroom purple_ball_1 room_4) (= ?obj green_box_1)) (hold_0)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (objectinroom purple_ball_1 room_4) (not (and (= ?obj purple_ball_1) (= ?room room_4))) (at_ green_box_1) (not (= ?obj green_box_1))) (hold_0)) (when (and (locked purple_door_1) (not (and (objectinroom red_box_1 room_1) (not (and (= ?obj red_box_1) (= ?room room_1))) (objectinroom purple_ball_1 room_1) (not (and (= ?obj purple_ball_1) (= ?room room_1)))))) (not (hold_2))) (when (and (objectinroom red_box_1 room_1) (not (and (= ?obj red_box_1) (= ?room room_1))) (objectinroom purple_ball_1 room_1) (not (and (= ?obj purple_ball_1) (= ?room room_1)))) (hold_2)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (or (and (= ?obj purple_ball_1) (= ?room room_4)) (objectinroom purple_ball_1 room_4)) (or (= ?obj green_box_1) (at_ green_box_1))) (hold_0)) (when (and (locked purple_door_1) (not (and (or (and (= ?obj red_box_1) (= ?room room_1)) (objectinroom red_box_1 room_1)) (or (and (= ?obj purple_ball_1) (= ?room room_1)) (objectinroom purple_ball_1 room_1))))) (not (hold_2))) (when (and (or (and (= ?obj red_box_1) (= ?room room_1)) (objectinroom red_box_1 room_1)) (or (and (= ?obj purple_ball_1) (= ?room room_1)) (objectinroom purple_ball_1 room_1))) (hold_2)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))) (hold_1)) (when (and (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))) (not (and (objectinroom red_box_1 room_1) (objectinroom purple_ball_1 room_1)))) (not (hold_2))) (increase (total-cost) 1)))
)
