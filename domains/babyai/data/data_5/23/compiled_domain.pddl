(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   yellow_ball_1 green_ball_1 - ball
   empty - empty_0
   blue_door_1 red_door_1 red_door_2 - door
   room_2 room_4 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj yellow_ball_1) (hold_2)) (increase (total-cost) 1)))
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
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (not (locked blue_door_1)) (not (or (objectinroom green_ball_1 room_2) (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))))) (not (hold_4))) (when (or (objectinroom green_ball_1 room_2) (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_4)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (and (at_ yellow_ball_1) (not (= ?obj yellow_ball_1))) (hold_2)) (when (and (not (locked blue_door_1)) (not (or (and (objectinroom green_ball_1 room_2) (not (and (= ?obj green_ball_1) (= ?room room_2)))) (agentinroom room_4)))) (not (hold_4))) (when (or (and (objectinroom green_ball_1 room_2) (not (and (= ?obj green_ball_1) (= ?room room_2)))) (agentinroom room_4)) (hold_4)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (not (locked red_door_2)) (hold_0)) (when (or (= ?obj yellow_ball_1) (at_ yellow_ball_1)) (hold_2)) (when (and (not (locked blue_door_1)) (not (or (and (= ?obj green_ball_1) (= ?room room_2)) (objectinroom green_ball_1 room_2) (agentinroom room_4)))) (not (hold_4))) (when (or (and (= ?obj green_ball_1) (= ?room room_2)) (objectinroom green_ball_1 room_2) (agentinroom room_4)) (hold_4)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (not (emptyhands)) (not (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2))))))) (hold_0)) (when (not (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2)))))) (hold_1)) (when (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (hold_3)) (when (and (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (not (or (objectinroom green_ball_1 room_2) (agentinroom room_4)))) (not (hold_4))) (increase (total-cost) 1)))
)
