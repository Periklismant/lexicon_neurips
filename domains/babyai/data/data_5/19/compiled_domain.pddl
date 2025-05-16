(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   purple_ball_2 - ball
   room_1 room_4 room_2 - room
   purple_box_1 red_box_1 yellow_box_1 - box
   empty - empty_0
   red_door_1 purple_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (seen_psi_2) (hold_3) (hold_4) (hold_5))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (= ?obj purple_ball_2) (agentinroom room_2)) (hold_0)) (when (and (agentinroom room_4) (not (= ?obj red_box_1))) (not (hold_4))) (when (= ?obj red_box_1) (hold_4)) (when (= ?obj yellow_box_1) (hold_5)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (agentinroom room_2) (hold_0)) (when (agentinroom room_4) (not (hold_4))) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (agentinroom room_2) (hold_0)) (when (agentinroom room_4) (not (hold_4))) (when (= ?door purple_door_1) (hold_5)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_0)) (when (or (objectinroom purple_box_1 room_4) (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (seen_psi_2)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_3)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (not (hold_4))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands) (seen_psi_2))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (and (at_ purple_ball_2) (not (= ?obj purple_ball_2))) (agentinroom room_2)) (hold_0)) (hold_1) (when (or (and (objectinroom purple_box_1 room_4) (not (and (= ?obj purple_box_1) (= ?room room_4)))) (agentinroom room_1)) (seen_psi_2)) (when (and (agentinroom room_4) (not (and (at_ red_box_1) (not (= ?obj red_box_1))))) (not (hold_4))) (when (and (at_ red_box_1) (not (= ?obj red_box_1))) (hold_4)) (when (or (and (at_ yellow_box_1) (not (= ?obj yellow_box_1))) (at_ purple_door_1)) (hold_5)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (= ?obj purple_ball_2) (at_ purple_ball_2) (agentinroom room_2)) (hold_0)) (when (or (and (= ?obj purple_box_1) (= ?room room_4)) (objectinroom purple_box_1 room_4) (agentinroom room_1)) (seen_psi_2)) (when (and (agentinroom room_4) (not (or (= ?obj red_box_1) (at_ red_box_1)))) (not (hold_4))) (when (or (= ?obj red_box_1) (at_ red_box_1)) (hold_4)) (when (or (= ?obj yellow_box_1) (at_ yellow_box_1) (at_ purple_door_1)) (hold_5)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (increase (total-cost) 1)))
)
