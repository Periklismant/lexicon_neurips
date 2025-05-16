(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   empty - empty_0
   red_door_2 red_door_1 - door
   green_box_1 yellow_box_1 blue_box_1 - box
   room_1 room_4 - room
   red_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (seen_psi_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj empty) (hold_3)) (when (and (locked red_door_2) (not (= ?obj empty))) (not (hold_5))) (when (= ?obj empty) (hold_5)) (when (= ?obj green_box_1) (seen_psi_7)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (locked red_door_2) (not (hold_5))) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door red_door_2)) (seen_psi_7)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (locked red_door_2) (not (hold_5))) (when (= ?door red_door_2) (hold_6)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4))))) (seen_psi_1)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_0)) (when (locked red_door_2) (not (hold_5))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (= ?obj yellow_box_1) (carrying yellow_box_1)) (seen_psi_1)) (when (and (objectinroom blue_box_1 room_4) (not (and (= ?obj blue_box_1) (= ?room room_4)))) (hold_2)) (when (and (at_ empty) (not (= ?obj empty))) (hold_3)) (when (and (locked red_door_2) (not (and (at_ empty) (not (= ?obj empty))))) (not (hold_5))) (when (and (at_ empty) (not (= ?obj empty))) (hold_5)) (when (and (at_ green_box_1) (not (= ?obj green_box_1))) (seen_psi_7)) (when (and (objectinroom red_ball_1 room_1) (not (and (= ?obj red_ball_1) (= ?room room_1)))) (seen_psi_9)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (carrying yellow_box_1) (not (= ?obj yellow_box_1))) (seen_psi_1)) (when (or (and (= ?obj blue_box_1) (= ?room room_4)) (objectinroom blue_box_1 room_4)) (hold_2)) (when (or (= ?obj empty) (at_ empty)) (hold_3)) (when (and (locked red_door_2) (not (or (= ?obj empty) (at_ empty)))) (not (hold_5))) (when (or (= ?obj empty) (at_ empty)) (hold_5)) (when (or (= ?obj green_box_1) (at_ green_box_1)) (seen_psi_7)) (when (or (and (= ?obj red_ball_1) (= ?room room_1)) (objectinroom red_ball_1 room_1)) (seen_psi_9)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2)))) (seen_psi_9)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2))))) (hold_4)) (when (and (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2))))) (not (at_ empty))) (not (hold_5))) (when (not (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2)))))) (hold_8)) (increase (total-cost) 1)))
)
