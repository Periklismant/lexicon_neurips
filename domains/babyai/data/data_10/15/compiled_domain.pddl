(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   grey_box_1 green_box_1 - box
   grey_ball_1 green_ball_1 purple_ball_1 blue_ball_1 - ball
   room_2 room_3 room_1 room_4 - room
   empty - empty_0
   blue_door_1 green_door_1 purple_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (hold_6) (hold_7) (seen_psi_8) (hold_9) (hold_10) (hold_11) (hold_12))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (carrying green_box_1) (hold_4)) (when (or (= ?obj blue_ball_1) (objectinroom grey_ball_1 room_2)) (seen_psi_8)) (when (or (objectinroom green_ball_1 room_2) (= ?obj empty)) (hold_11)) (when (carrying purple_ball_1) (hold_12)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (carrying green_box_1) (hold_4)) (when (objectinroom grey_ball_1 room_2) (seen_psi_8)) (when (objectinroom green_ball_1 room_2) (hold_11)) (when (carrying purple_ball_1) (hold_12)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door blue_door_1)) (seen_psi_8)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (or (= ?door purple_door_1) (carrying green_box_1)) (hold_4)) (when (= ?door blue_door_1) (hold_7)) (when (objectinroom grey_ball_1 room_2) (seen_psi_8)) (when (objectinroom green_ball_1 room_2) (hold_11)) (when (or (carrying purple_ball_1) (= ?door green_door_1)) (hold_12)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (seen_psi_3)) (when (carrying green_box_1) (hold_4)) (when (objectinroom grey_ball_1 room_2) (seen_psi_8)) (when (objectinroom green_ball_1 room_2) (hold_11)) (when (carrying purple_ball_1) (hold_12)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_1) (when (or (at_ purple_door_1) (= ?obj green_box_1) (carrying green_box_1)) (hold_4)) (when (and (objectinroom grey_ball_1 room_1) (not (and (= ?obj grey_ball_1) (= ?room room_1)))) (hold_5)) (when (and (objectinroom green_box_1 room_4) (not (and (= ?obj green_box_1) (= ?room room_4)))) (hold_6)) (when (or (and (at_ blue_ball_1) (not (= ?obj blue_ball_1))) (and (objectinroom grey_ball_1 room_2) (not (and (= ?obj grey_ball_1) (= ?room room_2))))) (seen_psi_8)) (when (or (and (objectinroom grey_box_1 room_3) (not (and (= ?obj grey_box_1) (= ?room room_3)))) (and (objectinroom green_ball_1 room_1) (not (and (= ?obj green_ball_1) (= ?room room_1))))) (hold_9)) (hold_10) (when (or (and (objectinroom green_ball_1 room_2) (not (and (= ?obj green_ball_1) (= ?room room_2)))) (and (at_ empty) (not (= ?obj empty)))) (hold_11)) (when (or (= ?obj purple_ball_1) (carrying purple_ball_1) (at_ green_door_1)) (hold_12)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (locked blue_door_1) (not (hold_1))) (when (or (at_ purple_door_1) (and (carrying green_box_1) (not (= ?obj green_box_1)))) (hold_4)) (when (or (and (= ?obj grey_ball_1) (= ?room room_1)) (objectinroom grey_ball_1 room_1)) (hold_5)) (when (or (and (= ?obj green_box_1) (= ?room room_4)) (objectinroom green_box_1 room_4)) (hold_6)) (when (or (= ?obj blue_ball_1) (at_ blue_ball_1) (and (= ?obj grey_ball_1) (= ?room room_2)) (objectinroom grey_ball_1 room_2)) (seen_psi_8)) (when (or (and (= ?obj grey_box_1) (= ?room room_3)) (objectinroom grey_box_1 room_3) (and (= ?obj green_ball_1) (= ?room room_1)) (objectinroom green_ball_1 room_1)) (hold_9)) (when (or (and (= ?obj green_ball_1) (= ?room room_2)) (objectinroom green_ball_1 room_2) (= ?obj empty) (at_ empty)) (hold_11)) (when (or (and (carrying purple_ball_1) (not (= ?obj purple_ball_1))) (at_ green_door_1)) (hold_12)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))) (seen_psi_3)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1))))) (hold_0)) (when (and (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1))))) (emptyhands)) (not (hold_1))) (when (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (hold_2)) (increase (total-cost) 1)))
)
