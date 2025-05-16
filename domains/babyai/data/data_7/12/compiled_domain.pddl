(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   room_2 room_3 room_4 - room
   green_box_1 yellow_box_1 - box
   empty - empty_0
   yellow_door_1 purple_door_1 red_door_1 purple_door_2 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (hold_9) (seen_psi_10) (hold_11))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (agentinroom room_4) (not (hold_1))) (when (carrying green_box_1) (seen_psi_10)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (agentinroom room_4) (not (hold_1))) (when (carrying green_box_1) (seen_psi_10)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door purple_door_2)) (seen_psi_3)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (and (agentinroom room_4) (not (= ?door purple_door_1))) (not (hold_1))) (when (= ?door purple_door_1) (hold_1)) (when (= ?door purple_door_2) (hold_2)) (when (= ?door purple_door_1) (hold_8)) (when (or (carrying green_box_1) (= ?door purple_door_1)) (seen_psi_10)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_0)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (not (hold_1))) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))) (not (emptyhands))) (seen_psi_7)) (when (carrying green_box_1) (seen_psi_10)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (or (and (objectinroom yellow_box_1 room_2) (not (and (= ?obj yellow_box_1) (= ?room room_2)))) (= ?obj green_box_1) (carrying green_box_1)) (seen_psi_3)) (hold_5) (seen_psi_7) (when (or (= ?obj green_box_1) (carrying green_box_1) (at_ purple_door_1)) (seen_psi_10)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (= ?obj yellow_box_1) (= ?room room_2)) (objectinroom yellow_box_1 room_2) (and (carrying green_box_1) (not (= ?obj green_box_1)))) (seen_psi_3)) (when (locked purple_door_2) (not (hold_5))) (when (agentinroom room_3) (seen_psi_7)) (when (or (and (carrying green_box_1) (not (= ?obj green_box_1))) (at_ purple_door_1)) (seen_psi_10)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2)))) (seen_psi_7)) (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))) (seen_psi_10)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2))))) (hold_4)) (when (and (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2))))) (emptyhands)) (not (hold_5))) (when (not (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2)))))) (hold_6)) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (hold_9)) (when (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))))) (hold_11)) (increase (total-cost) 1)))
)
