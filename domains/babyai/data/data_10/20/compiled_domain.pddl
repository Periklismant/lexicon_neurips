(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   room_2 room_3 room_1 room_4 - room
   purple_box_1 blue_box_1 yellow_box_1 grey_box_1 - box
   blue_door_1 green_door_1 green_door_2 purple_door_1 - door
   empty - empty_0
   purple_ball_1 grey_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (seen_psi_2) (hold_3) (seen_psi_4) (hold_5) (seen_psi_6) (hold_7) (hold_8) (hold_9) (seen_psi_10) (hold_11) (hold_12))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (agentinroom room_4) (seen_psi_2)) (when (or (= ?obj yellow_box_1) (not (locked green_door_2))) (hold_11)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (agentinroom room_4) (seen_psi_2)) (when (not (locked green_door_2)) (hold_11)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door purple_door_1)) (seen_psi_4)) (or (not (= ?door blue_door_1)) (seen_psi_6)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (or (agentinroom room_4) (= ?door green_door_1)) (seen_psi_2)) (when (= ?door purple_door_1) (hold_3)) (when (= ?door blue_door_1) (hold_5)) (when (not (locked green_door_2)) (hold_11)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))))) (seen_psi_2)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_1)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (seen_psi_2)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))) (not (emptyhands))) (hold_7)) (when (not (locked green_door_2)) (hold_11)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (= ?obj grey_box_1) (carrying grey_box_1) (and (objectinroom yellow_box_1 room_4) (not (and (= ?obj yellow_box_1) (= ?room room_4))))) (seen_psi_4)) (when (and (objectinroom purple_box_1 room_4) (not (and (= ?obj purple_box_1) (= ?room room_4)))) (seen_psi_6)) (hold_7) (when (and (objectinroom blue_box_1 room_3) (not (and (= ?obj blue_box_1) (= ?room room_3)))) (hold_8)) (when (or (= ?obj purple_box_1) (carrying purple_box_1) (and (objectinroom purple_ball_1 room_3) (not (and (= ?obj purple_ball_1) (= ?room room_3))))) (seen_psi_10)) (when (or (and (at_ yellow_box_1) (not (= ?obj yellow_box_1))) (not (locked green_door_2))) (hold_11)) (when (and (objectinroom grey_ball_1 room_4) (not (and (= ?obj grey_ball_1) (= ?room room_4))) (not (locked green_door_1))) (hold_12)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (carrying grey_box_1) (not (= ?obj grey_box_1))) (and (= ?obj yellow_box_1) (= ?room room_4)) (objectinroom yellow_box_1 room_4)) (seen_psi_4)) (when (or (and (= ?obj purple_box_1) (= ?room room_4)) (objectinroom purple_box_1 room_4)) (seen_psi_6)) (when (agentinroom room_2) (hold_7)) (when (or (and (= ?obj blue_box_1) (= ?room room_3)) (objectinroom blue_box_1 room_3)) (hold_8)) (when (or (and (carrying purple_box_1) (not (= ?obj purple_box_1))) (and (= ?obj purple_ball_1) (= ?room room_3)) (objectinroom purple_ball_1 room_3)) (seen_psi_10)) (when (or (= ?obj yellow_box_1) (at_ yellow_box_1) (not (locked green_door_2))) (hold_11)) (when (and (or (and (= ?obj grey_ball_1) (= ?room room_4)) (objectinroom grey_ball_1 room_4)) (not (locked green_door_1))) (hold_12)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))) (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))) (seen_psi_10)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (hold_0)) (when (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (hold_9)) (when (or (at_ yellow_box_1) (not (or (and (not (locked ?door)) (= ?door green_door_2)) (and (locked green_door_2) (not (and (locked ?door) (= ?door green_door_2))))))) (hold_11)) (when (and (objectinroom grey_ball_1 room_4) (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))))) (hold_12)) (increase (total-cost) 1)))
)
