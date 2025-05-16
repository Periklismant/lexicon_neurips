(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   grey_ball_1 purple_ball_1 red_ball_2 - ball
   yellow_door_1 blue_door_1 grey_door_1 red_door_1 - door
   purple_box_1 green_box_1 - box
   empty - empty_0
   room_2 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (seen_psi_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (= ?obj grey_ball_1) (carrying purple_ball_1)) (hold_8)) (when (or (not (locked grey_door_1)) (= ?obj purple_box_1)) (hold_10)) (when (or (carrying red_ball_2) (= ?obj green_box_1)) (hold_12)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (carrying purple_ball_1) (hold_8)) (when (not (locked grey_door_1)) (hold_10)) (when (carrying red_ball_2) (hold_12)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door red_door_1)) (seen_psi_5)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door red_door_1) (hold_4)) (when (= ?door blue_door_1) (seen_psi_5)) (when (carrying purple_ball_1) (hold_8)) (when (not (locked grey_door_1)) (hold_10)) (when (carrying red_ball_2) (hold_12)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (carrying purple_ball_1) (hold_8)) (when (not (locked grey_door_1)) (hold_10)) (when (carrying red_ball_2) (hold_12)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (objectinroom purple_ball_1 room_2) (not (and (= ?obj purple_ball_1) (= ?room room_2)))) (seen_psi_3)) (hold_7) (when (or (and (at_ grey_ball_1) (not (= ?obj grey_ball_1))) (= ?obj purple_ball_1) (carrying purple_ball_1)) (hold_8)) (when (or (= ?obj green_box_1) (carrying green_box_1)) (hold_9)) (when (or (not (locked grey_door_1)) (and (at_ purple_box_1) (not (= ?obj purple_box_1)))) (hold_10)) (hold_11) (when (or (= ?obj red_ball_2) (carrying red_ball_2) (and (at_ green_box_1) (not (= ?obj green_box_1)))) (hold_12)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (= ?obj purple_ball_1) (= ?room room_2)) (objectinroom purple_ball_1 room_2)) (seen_psi_3)) (when (or (= ?obj grey_ball_1) (at_ grey_ball_1) (and (carrying purple_ball_1) (not (= ?obj purple_ball_1)))) (hold_8)) (when (or (not (locked grey_door_1)) (= ?obj purple_box_1) (at_ purple_box_1)) (hold_10)) (when (and (carrying purple_ball_1) (not (= ?obj purple_ball_1))) (hold_11)) (when (or (and (carrying red_ball_2) (not (= ?obj red_ball_2))) (= ?obj green_box_1) (at_ green_box_1)) (hold_12)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))) (seen_psi_3)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (hold_0)) (when (and (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (not (hold_1))) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (hold_1)) (when (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))))) (hold_2)) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (hold_6)) (when (or (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (at_ purple_box_1)) (hold_10)) (increase (total-cost) 1)))
)
