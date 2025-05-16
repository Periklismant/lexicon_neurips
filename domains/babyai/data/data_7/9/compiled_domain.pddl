(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   purple_door_1 blue_door_1 red_door_1 - door
   yellow_ball_1 blue_ball_1 - ball
   green_box_1 yellow_box_2 yellow_box_1 - box
   empty - empty_0
   room_2 room_1 room_4 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (seen_psi_6) (hold_7) (seen_psi_8) (hold_9) (hold_10))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (not (locked purple_door_1)) (hold_0)) (when (= ?obj blue_ball_1) (hold_2)) (when (and (carrying yellow_ball_1) (= ?obj yellow_box_2)) (seen_psi_6)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (not (locked purple_door_1)) (hold_0)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (or (not (locked purple_door_1)) (= ?door purple_door_1)) (hold_0)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))))) (seen_psi_6)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (not (locked purple_door_1)) (hold_0)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_5)) (when (and (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (objectinroom green_box_1 room_4)) (seen_psi_8)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_9)) (when (and (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (locked blue_door_1)) (not (hold_10))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (= ?obj yellow_box_1) (carrying yellow_box_1)) (hold_1)) (when (and (at_ blue_ball_1) (not (= ?obj blue_ball_1))) (hold_2)) (hold_4) (when (and (or (= ?obj yellow_ball_1) (carrying yellow_ball_1)) (at_ yellow_box_2) (not (= ?obj yellow_box_2))) (seen_psi_6)) (when (and (agentinroom room_4) (objectinroom green_box_1 room_4) (not (and (= ?obj green_box_1) (= ?room room_4)))) (seen_psi_8)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (= ?obj blue_ball_1) (at_ blue_ball_1)) (hold_2)) (when (locked red_door_1) (not (hold_4))) (when (and (carrying yellow_ball_1) (not (= ?obj yellow_ball_1)) (or (= ?obj yellow_box_2) (at_ yellow_box_2))) (seen_psi_6)) (when (and (agentinroom room_4) (or (and (= ?obj green_box_1) (= ?room room_4)) (objectinroom green_box_1 room_4))) (seen_psi_8)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))) (seen_psi_8)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))))) (at_ purple_door_1)) (hold_0)) (when (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (hold_3)) (when (and (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (emptyhands)) (not (hold_4))) (when (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))))) (hold_7)) (when (and (agentinroom room_2) (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (not (hold_10))) (when (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (hold_10)) (increase (total-cost) 1)))
)
