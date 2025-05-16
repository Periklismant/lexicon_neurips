(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   blue_box_2 green_box_1 - box
   red_ball_1 - ball
   empty - empty_0
   green_door_1 - door
   room_1 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4) (seen_psi_5))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj green_box_1) (hold_2)) (when (and (= ?obj green_box_1) (not (or (carrying blue_box_2) (= ?obj red_ball_1)))) (not (hold_3))) (when (or (carrying blue_box_2) (= ?obj red_ball_1)) (hold_3)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (carrying blue_box_2) (hold_3)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door green_door_1) (seen_psi_1)) (when (carrying blue_box_2) (hold_3)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))))) (seen_psi_5)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (carrying blue_box_2) (hold_3)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_4)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands) (seen_psi_1))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (and (at_ green_box_1) (not (= ?obj green_box_1))) (hold_2)) (when (and (at_ green_box_1) (not (= ?obj green_box_1)) (not (or (= ?obj blue_box_2) (carrying blue_box_2) (and (at_ red_ball_1) (not (= ?obj red_ball_1)))))) (not (hold_3))) (when (or (= ?obj blue_box_2) (carrying blue_box_2) (and (at_ red_ball_1) (not (= ?obj red_ball_1)))) (hold_3)) (seen_psi_5) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (= ?obj green_box_1) (at_ green_box_1)) (hold_2)) (when (and (or (= ?obj green_box_1) (at_ green_box_1)) (not (or (and (carrying blue_box_2) (not (= ?obj blue_box_2))) (= ?obj red_ball_1) (at_ red_ball_1)))) (not (hold_3))) (when (or (and (carrying blue_box_2) (not (= ?obj blue_box_2))) (= ?obj red_ball_1) (at_ red_ball_1)) (hold_3)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (increase (total-cost) 1)))
)
