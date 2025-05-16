(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   grey_box_3 purple_box_1 grey_box_1 - box
   empty - empty_0
   red_door_1 yellow_door_1 green_door_1 yellow_door_2 - door
   room_3 room_2 room_1 - room
   green_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (seen_psi_2) (hold_3) (hold_4) (seen_psi_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room) (or (not (= ?obj grey_box_3)) (seen_psi_5)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj grey_box_3) (hold_4)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door green_door_1)) (seen_psi_2)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door green_door_1) (hold_1)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_7)) (when (and (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (emptyhands)) (not (hold_8))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands) (or (not (and (at_ grey_box_3) (not (= ?obj grey_box_3)))) (seen_psi_5)))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (seen_psi_2) (when (and (at_ grey_box_3) (not (= ?obj grey_box_3))) (hold_4)) (seen_psi_5) (hold_6) (hold_8) (when (and (objectinroom purple_box_1 room_3) (not (and (= ?obj purple_box_1) (= ?room room_3)))) (hold_9)) (hold_10) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty) (or (not (or (= ?obj grey_box_3) (at_ grey_box_3))) (seen_psi_5)))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (= ?obj green_ball_1) (= ?room room_1)) (objectinroom green_ball_1 room_1)) (hold_0)) (when (or (= ?obj grey_box_3) (at_ grey_box_3)) (hold_4)) (when (or (and (= ?obj grey_box_1) (= ?room room_2)) (objectinroom grey_box_1 room_2)) (seen_psi_5)) (when (not (locked yellow_door_1)) (hold_6)) (when (agentinroom room_1) (not (hold_8))) (when (or (and (= ?obj purple_box_1) (= ?room room_3)) (objectinroom purple_box_1 room_3)) (hold_9)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))) (hold_3)) (when (or (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (not (emptyhands))) (hold_6)) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_2)) (and (locked yellow_door_2) (not (and (locked ?door) (= ?door yellow_door_2)))))) (hold_11)) (increase (total-cost) 1)))
)
