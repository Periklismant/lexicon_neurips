(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   yellow_box_1 grey_box_1 - box
   room_1 room_3 room_4 - room
   green_door_1 blue_door_3 - door
   empty - empty_0
   purple_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (= ?obj yellow_box_1) (objectinroom grey_box_1 room_4)) (hold_3)) (when (and (= ?obj grey_box_1) (not (locked green_door_1))) (hold_5)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (objectinroom grey_box_1 room_4) (hold_3)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door blue_door_3) (hold_1)) (when (objectinroom grey_box_1 room_4) (hold_3)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (objectinroom purple_ball_1 room_3)) (hold_2)) (when (objectinroom grey_box_1 room_4) (hold_3)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_4)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (and (agentinroom room_3) (objectinroom purple_ball_1 room_3) (not (and (= ?obj purple_ball_1) (= ?room room_3)))) (hold_2)) (when (or (and (at_ yellow_box_1) (not (= ?obj yellow_box_1))) (and (objectinroom grey_box_1 room_4) (not (and (= ?obj grey_box_1) (= ?room room_4))))) (hold_3)) (when (and (at_ grey_box_1) (not (= ?obj grey_box_1)) (not (locked green_door_1))) (hold_5)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (agentinroom room_3) (or (and (= ?obj purple_ball_1) (= ?room room_3)) (objectinroom purple_ball_1 room_3))) (hold_2)) (when (or (= ?obj yellow_box_1) (at_ yellow_box_1) (and (= ?obj grey_box_1) (= ?room room_4)) (objectinroom grey_box_1 room_4)) (hold_3)) (when (and (or (= ?obj grey_box_1) (at_ grey_box_1)) (not (locked green_door_1))) (hold_5)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (and (at_ grey_box_1) (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))))) (hold_5)) (increase (total-cost) 1)))
)
