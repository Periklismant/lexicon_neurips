(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   empty - empty_0
   purple_door_1 blue_door_2 blue_door_1 - door
   room_2 room_4 room_3 room_1 - room
   grey_box_1 yellow_box_1 - box
   red_ball_1 yellow_ball_1 red_ball_2 purple_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (seen_psi_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (seen_psi_6) (hold_7) (hold_8))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door blue_door_2)) (seen_psi_1)) (or (not (= ?door purple_door_1)) (seen_psi_6)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door blue_door_2) (hold_0)) (when (= ?door purple_door_1) (hold_5)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4))))) (seen_psi_3)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_2)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))) (carrying yellow_box_1)) (seen_psi_6)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (= ?obj grey_box_1) (carrying grey_box_1)) (seen_psi_1)) (when (or (and (objectinroom yellow_ball_1 room_4) (not (and (= ?obj yellow_ball_1) (= ?room room_4)))) (and (objectinroom red_ball_1 room_2) (not (and (= ?obj red_ball_1) (= ?room room_2))))) (seen_psi_3)) (when (and (objectinroom purple_ball_1 room_1) (not (and (= ?obj purple_ball_1) (= ?room room_1))) (objectinroom yellow_ball_1 room_3) (not (and (= ?obj yellow_ball_1) (= ?room room_3)))) (hold_4)) (when (or (agentinroom room_1) (= ?obj yellow_box_1) (carrying yellow_box_1)) (seen_psi_6)) (when (and (objectinroom red_ball_2 room_3) (not (and (= ?obj red_ball_2) (= ?room room_3)))) (hold_8)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (carrying grey_box_1) (not (= ?obj grey_box_1))) (seen_psi_1)) (when (or (and (= ?obj yellow_ball_1) (= ?room room_4)) (objectinroom yellow_ball_1 room_4) (and (= ?obj red_ball_1) (= ?room room_2)) (objectinroom red_ball_1 room_2)) (seen_psi_3)) (when (and (or (and (= ?obj purple_ball_1) (= ?room room_1)) (objectinroom purple_ball_1 room_1)) (or (and (= ?obj yellow_ball_1) (= ?room room_3)) (objectinroom yellow_ball_1 room_3))) (hold_4)) (when (or (agentinroom room_1) (and (carrying yellow_box_1) (not (= ?obj yellow_box_1)))) (seen_psi_6)) (when (or (and (= ?obj red_ball_2) (= ?room room_3)) (objectinroom red_ball_2 room_3)) (hold_8)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door blue_door_2)) (and (locked blue_door_2) (not (and (locked ?door) (= ?door blue_door_2))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (hold_7)) (increase (total-cost) 1)))
)
