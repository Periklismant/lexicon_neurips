(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   grey_ball_1 green_ball_2 - ball
   room_3 room_2 room_4 - room
   purple_door_1 yellow_door_1 red_door_2 - door
   empty - empty_0
   grey_box_1 - box
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (= ?obj green_ball_2) (agentinroom room_2)) (hold_0)) (when (and (not (locked yellow_door_1)) (= ?obj grey_ball_1)) (hold_4)) (when (= ?obj grey_ball_1) (hold_6)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door red_door_2) (hold_3)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))) (not (locked yellow_door_1))) (hold_7)) (when (or (carrying grey_box_1) (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_9)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (at_ green_ball_2) (not (= ?obj green_ball_2)) (agentinroom room_2)) (hold_0)) (hold_1) (when (or (= ?obj green_ball_2) (carrying green_ball_2) (= ?obj grey_box_1) (carrying grey_box_1)) (hold_2)) (when (and (not (locked yellow_door_1)) (at_ grey_ball_1) (not (= ?obj grey_ball_1))) (hold_4)) (when (or (= ?obj grey_box_1) (carrying grey_box_1) (not (locked purple_door_1))) (hold_5)) (when (and (at_ grey_ball_1) (not (= ?obj grey_ball_1))) (hold_6)) (when (or (= ?obj grey_ball_1) (carrying grey_ball_1)) (hold_8)) (when (or (= ?obj grey_box_1) (carrying grey_box_1) (agentinroom room_4)) (hold_9)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (or (= ?obj green_ball_2) (at_ green_ball_2)) (agentinroom room_2)) (hold_0)) (when (or (and (carrying green_ball_2) (not (= ?obj green_ball_2))) (and (carrying grey_box_1) (not (= ?obj grey_box_1)))) (hold_2)) (when (and (not (locked yellow_door_1)) (or (= ?obj grey_ball_1) (at_ grey_ball_1))) (hold_4)) (when (or (and (carrying grey_box_1) (not (= ?obj grey_box_1))) (not (locked purple_door_1))) (hold_5)) (when (or (= ?obj grey_ball_1) (at_ grey_ball_1)) (hold_6)) (when (and (carrying grey_ball_1) (not (= ?obj grey_ball_1))) (hold_8)) (when (or (and (carrying grey_box_1) (not (= ?obj grey_box_1))) (agentinroom room_4)) (hold_9)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (and (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (at_ grey_ball_1)) (hold_4)) (when (or (carrying grey_box_1) (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))))) (hold_5)) (when (or (agentinroom room_3) (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1))))))) (hold_7)) (increase (total-cost) 1)))
)
