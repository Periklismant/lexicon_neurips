(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   blue_box_1 purple_box_1 - box
   empty - empty_0
   room_1 room_2 - room
   yellow_ball_2 red_ball_1 green_ball_1 - ball
   grey_door_1 purple_door_1 red_door_1 yellow_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (seen_psi_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room) (or (not (= ?obj purple_box_1)) (seen_psi_7)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj purple_box_1) (hold_6)) (increase (total-cost) 1)))
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
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))))) (seen_psi_9)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_2)) (when (and (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (not (and (carrying red_ball_1) (objectinroom yellow_ball_2 room_2)))) (not (hold_3))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_8)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands) (or (not (and (at_ purple_box_1) (not (= ?obj purple_box_1)))) (seen_psi_7)))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (and (agentinroom room_2) (not (and (or (= ?obj red_ball_1) (carrying red_ball_1)) (objectinroom yellow_ball_2 room_2) (not (and (= ?obj yellow_ball_2) (= ?room room_2)))))) (not (hold_3))) (when (and (or (= ?obj red_ball_1) (carrying red_ball_1)) (objectinroom yellow_ball_2 room_2) (not (and (= ?obj yellow_ball_2) (= ?room room_2)))) (hold_3)) (when (and (objectinroom blue_box_1 room_1) (not (and (= ?obj blue_box_1) (= ?room room_1)))) (hold_5)) (when (and (at_ purple_box_1) (not (= ?obj purple_box_1))) (hold_6)) (seen_psi_7) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty) (or (not (or (= ?obj purple_box_1) (at_ purple_box_1))) (seen_psi_7)))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (agentinroom room_2) (not (and (carrying red_ball_1) (not (= ?obj red_ball_1)) (or (and (= ?obj yellow_ball_2) (= ?room room_2)) (objectinroom yellow_ball_2 room_2))))) (not (hold_3))) (when (and (carrying red_ball_1) (not (= ?obj red_ball_1)) (or (and (= ?obj yellow_ball_2) (= ?room room_2)) (objectinroom yellow_ball_2 room_2))) (hold_3)) (when (or (and (= ?obj blue_box_1) (= ?room room_1)) (objectinroom blue_box_1 room_1)) (hold_5)) (when (or (= ?obj purple_box_1) (at_ purple_box_1)) (hold_6)) (when (and (carrying green_ball_1) (not (= ?obj green_ball_1))) (seen_psi_7)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (hold_1)) (when (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))))) (hold_4)) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (seen_psi_9)) (increase (total-cost) 1)))
)
