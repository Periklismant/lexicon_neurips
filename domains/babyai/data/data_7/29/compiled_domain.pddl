(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   blue_ball_1 - ball
   green_box_1 grey_box_1 grey_box_3 purple_box_1 - box
   empty - empty_0
   room_3 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (carrying blue_ball_1) (= ?obj purple_box_1)) (hold_1)) (when (and (carrying blue_ball_1) (= ?obj grey_box_1)) (hold_5)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (carrying blue_ball_1) (hold_1)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (carrying blue_ball_1) (hold_1)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (carrying blue_ball_1) (hold_1)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (= ?obj grey_box_3) (carrying grey_box_3) (and (objectinroom green_box_1 room_3) (not (and (= ?obj green_box_1) (= ?room room_3))))) (hold_0)) (when (or (= ?obj blue_ball_1) (carrying blue_ball_1) (and (at_ purple_box_1) (not (= ?obj purple_box_1)))) (hold_1)) (hold_3) (hold_3) (hold_4) (when (and (or (= ?obj blue_ball_1) (carrying blue_ball_1)) (at_ grey_box_1) (not (= ?obj grey_box_1))) (hold_5)) (when (or (= ?obj grey_box_3) (carrying grey_box_3)) (hold_6)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (carrying grey_box_3) (not (= ?obj grey_box_3))) (and (= ?obj green_box_1) (= ?room room_3)) (objectinroom green_box_1 room_3)) (hold_0)) (when (or (and (carrying blue_ball_1) (not (= ?obj blue_ball_1))) (= ?obj purple_box_1) (at_ purple_box_1)) (hold_1)) (when (and (carrying green_box_1) (not (= ?obj green_box_1))) (hold_4)) (when (and (carrying blue_ball_1) (not (= ?obj blue_ball_1)) (or (= ?obj grey_box_1) (at_ grey_box_1))) (hold_5)) (when (and (carrying grey_box_3) (not (= ?obj grey_box_3))) (hold_6)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (increase (total-cost) 1)))
)
