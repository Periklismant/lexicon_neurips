(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   blue_box_1 - box
   empty - empty_0
   room_2 room_3 room_4 room_1 - room
   blue_ball_1 yellow_ball_1 - ball
   purple_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4) (seen_psi_5) (hold_6) (hold_7))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (= ?obj blue_box_1) (= ?obj empty)) (seen_psi_1)) (when (and (agentinroom room_2) (not (or (= ?obj yellow_ball_1) (carrying blue_ball_1)))) (not (hold_3))) (when (or (= ?obj yellow_ball_1) (carrying blue_ball_1)) (hold_3)) (when (or (= ?obj blue_box_1) (agentinroom room_4)) (seen_psi_5)) (when (or (objectinroom blue_box_1 room_3) (= ?obj yellow_ball_1)) (hold_7)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (and (agentinroom room_2) (not (carrying blue_ball_1))) (not (hold_3))) (when (carrying blue_ball_1) (hold_3)) (when (agentinroom room_4) (seen_psi_5)) (when (objectinroom blue_box_1 room_3) (hold_7)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door purple_door_1)) (seen_psi_5)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (and (agentinroom room_2) (not (carrying blue_ball_1))) (not (hold_3))) (when (carrying blue_ball_1) (hold_3)) (when (= ?door purple_door_1) (hold_4)) (when (agentinroom room_4) (seen_psi_5)) (when (objectinroom blue_box_1 room_3) (hold_7)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))))) (or (not (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))))) (seen_psi_1)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (hold_0)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_2)) (when (and (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (not (carrying blue_ball_1))) (not (hold_3))) (when (carrying blue_ball_1) (hold_3)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (seen_psi_5)) (when (objectinroom blue_box_1 room_3) (hold_7)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (and (at_ blue_box_1) (not (= ?obj blue_box_1))) (and (at_ empty) (not (= ?obj empty)))) (seen_psi_1)) (when (and (agentinroom room_2) (not (or (and (at_ yellow_ball_1) (not (= ?obj yellow_ball_1))) (= ?obj blue_ball_1) (carrying blue_ball_1)))) (not (hold_3))) (when (or (and (at_ yellow_ball_1) (not (= ?obj yellow_ball_1))) (= ?obj blue_ball_1) (carrying blue_ball_1)) (hold_3)) (when (or (and (at_ blue_box_1) (not (= ?obj blue_box_1))) (agentinroom room_4)) (seen_psi_5)) (hold_6) (when (or (and (objectinroom blue_box_1 room_3) (not (and (= ?obj blue_box_1) (= ?room room_3)))) (and (at_ yellow_ball_1) (not (= ?obj yellow_ball_1)))) (hold_7)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (= ?obj blue_box_1) (at_ blue_box_1) (= ?obj empty) (at_ empty)) (seen_psi_1)) (when (and (agentinroom room_2) (not (or (= ?obj yellow_ball_1) (at_ yellow_ball_1) (and (carrying blue_ball_1) (not (= ?obj blue_ball_1)))))) (not (hold_3))) (when (or (= ?obj yellow_ball_1) (at_ yellow_ball_1) (and (carrying blue_ball_1) (not (= ?obj blue_ball_1)))) (hold_3)) (when (or (= ?obj blue_box_1) (at_ blue_box_1) (agentinroom room_4)) (seen_psi_5)) (when (or (and (= ?obj blue_box_1) (= ?room room_3)) (objectinroom blue_box_1 room_3) (= ?obj yellow_ball_1) (at_ yellow_ball_1)) (hold_7)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (increase (total-cost) 1)))
)
