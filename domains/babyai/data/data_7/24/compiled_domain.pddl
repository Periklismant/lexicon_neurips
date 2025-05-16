(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   grey_ball_2 grey_ball_1 - ball
   room_2 room_1 room_4 - room
   yellow_box_1 yellow_box_3 - box
   empty - empty_0
   purple_door_1 blue_door_2 red_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (objectinroom grey_ball_1 room_4) (= ?obj yellow_box_3)) (hold_2)) (when (carrying yellow_box_3) (hold_3)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (carrying yellow_box_3) (hold_3)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (and (= ?door red_door_1) (carrying yellow_box_1)) (hold_1)) (when (or (= ?door blue_door_2) (carrying yellow_box_3)) (hold_3)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))))))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (carrying yellow_box_3) (hold_3)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))) (not (emptyhands))) (hold_4)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (= ?obj grey_ball_2) (carrying grey_ball_2)) (hold_0)) (when (and (at_ red_door_1) (or (= ?obj yellow_box_1) (carrying yellow_box_1))) (hold_1)) (when (and (objectinroom grey_ball_1 room_4) (not (and (= ?obj grey_ball_1) (= ?room room_4))) (at_ yellow_box_3) (not (= ?obj yellow_box_3))) (hold_2)) (when (or (at_ blue_door_2) (= ?obj yellow_box_3) (carrying yellow_box_3)) (hold_3)) (hold_4) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (carrying grey_ball_2) (not (= ?obj grey_ball_2))) (hold_0)) (when (and (at_ red_door_1) (carrying yellow_box_1) (not (= ?obj yellow_box_1))) (hold_1)) (when (and (or (and (= ?obj grey_ball_1) (= ?room room_4)) (objectinroom grey_ball_1 room_4)) (or (= ?obj yellow_box_3) (at_ yellow_box_3))) (hold_2)) (when (or (at_ blue_door_2) (and (carrying yellow_box_3) (not (= ?obj yellow_box_3)))) (hold_3)) (when (agentinroom room_1) (hold_4)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (increase (total-cost) 1)))
)
