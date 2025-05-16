(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   green_box_1 red_box_1 blue_box_1 blue_box_2 - box
   room_2 room_3 - room
   empty - empty_0
   green_door_1 yellow_door_2 yellow_door_1 - door
   blue_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (seen_psi_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj green_box_1) (hold_2)) (when (and (agentinroom room_3) (not (= ?obj red_box_1))) (not (hold_6))) (when (= ?obj red_box_1) (hold_6)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (agentinroom room_3) (not (hold_6))) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (agentinroom room_3) (not (hold_6))) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (hold_5)) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (not (hold_6))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (locked yellow_door_2) (not (or (not (locked yellow_door_1)) (and (objectinroom blue_box_1 room_2) (not (and (= ?obj blue_box_1) (= ?room room_2))))))) (not (hold_1))) (when (or (not (locked yellow_door_1)) (and (objectinroom blue_box_1 room_2) (not (and (= ?obj blue_box_1) (= ?room room_2))))) (hold_1)) (when (and (at_ green_box_1) (not (= ?obj green_box_1))) (hold_2)) (seen_psi_4) (when (and (agentinroom room_3) (not (and (at_ red_box_1) (not (= ?obj red_box_1))))) (not (hold_6))) (when (and (at_ red_box_1) (not (= ?obj red_box_1))) (hold_6)) (when (or (= ?obj blue_box_2) (carrying blue_box_2)) (hold_7)) (when (and (objectinroom blue_ball_1 room_2) (not (and (= ?obj blue_ball_1) (= ?room room_2)))) (hold_9)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (locked yellow_door_2) (not (or (not (locked yellow_door_1)) (and (= ?obj blue_box_1) (= ?room room_2)) (objectinroom blue_box_1 room_2)))) (not (hold_1))) (when (or (not (locked yellow_door_1)) (and (= ?obj blue_box_1) (= ?room room_2)) (objectinroom blue_box_1 room_2)) (hold_1)) (when (or (= ?obj green_box_1) (at_ green_box_1)) (hold_2)) (when (and (agentinroom room_3) (not (or (= ?obj red_box_1) (at_ red_box_1)))) (not (hold_6))) (when (or (= ?obj red_box_1) (at_ red_box_1)) (hold_6)) (when (and (carrying blue_box_2) (not (= ?obj blue_box_2))) (hold_7)) (when (or (and (= ?obj blue_ball_1) (= ?room room_2)) (objectinroom blue_ball_1 room_2)) (hold_9)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))) (seen_psi_4)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door yellow_door_2)) (and (locked yellow_door_2) (not (and (locked ?door) (= ?door yellow_door_2))))) (hold_0)) (when (and (or (and (not (locked ?door)) (= ?door yellow_door_2)) (and (locked yellow_door_2) (not (and (locked ?door) (= ?door yellow_door_2))))) (not (or (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (objectinroom blue_box_1 room_2)))) (not (hold_1))) (when (or (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (objectinroom blue_box_1 room_2)) (hold_1)) (when (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (hold_3)) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (hold_8)) (increase (total-cost) 1)))
)
