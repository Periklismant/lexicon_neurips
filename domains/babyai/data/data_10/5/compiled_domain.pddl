(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   grey_door_1 red_door_1 yellow_door_1 - door
   green_box_1 - box
   empty - empty_0
   red_ball_1 blue_ball_1 yellow_ball_2 - ball
   room_2 room_4 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (hold_9) (hold_10) (hold_11))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (locked grey_door_1) (= ?obj green_box_1)) (hold_1)) (when (= ?obj empty) (hold_10)) (when (= ?obj yellow_ball_2) (hold_11)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door grey_door_1) (hold_0)) (when (= ?door grey_door_1) (not (hold_1))) (when (and (= ?door red_door_1) (objectinroom blue_ball_1 room_4)) (seen_psi_7)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))))))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (not (locked red_door_1))) (seen_psi_3)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (at_ grey_door_1) (not (and (locked grey_door_1) (at_ green_box_1) (not (= ?obj green_box_1))))) (not (hold_1))) (when (and (locked grey_door_1) (at_ green_box_1) (not (= ?obj green_box_1))) (hold_1)) (when (or (= ?obj red_ball_1) (carrying red_ball_1) (and (objectinroom blue_ball_1 room_2) (not (and (= ?obj blue_ball_1) (= ?room room_2))))) (hold_4)) (when (or (= ?obj yellow_ball_2) (carrying yellow_ball_2)) (hold_5)) (when (and (at_ red_door_1) (objectinroom blue_ball_1 room_4) (not (and (= ?obj blue_ball_1) (= ?room room_4)))) (seen_psi_7)) (hold_9) (when (and (at_ empty) (not (= ?obj empty))) (hold_10)) (when (and (at_ yellow_ball_2) (not (= ?obj yellow_ball_2))) (hold_11)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (at_ grey_door_1) (not (and (locked grey_door_1) (or (= ?obj green_box_1) (at_ green_box_1))))) (not (hold_1))) (when (and (locked grey_door_1) (or (= ?obj green_box_1) (at_ green_box_1))) (hold_1)) (when (or (and (carrying red_ball_1) (not (= ?obj red_ball_1))) (and (= ?obj blue_ball_1) (= ?room room_2)) (objectinroom blue_ball_1 room_2)) (hold_4)) (when (and (at_ red_door_1) (or (and (= ?obj blue_ball_1) (= ?room room_4)) (objectinroom blue_ball_1 room_4))) (seen_psi_7)) (when (locked grey_door_1) (not (hold_9))) (when (or (= ?obj empty) (at_ empty)) (hold_10)) (when (or (= ?obj yellow_ball_2) (at_ yellow_ball_2)) (hold_11)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))) (seen_psi_3)) (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))) (seen_psi_7)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (and (at_ grey_door_1) (not (and (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (at_ green_box_1)))) (not (hold_1))) (when (and (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (at_ green_box_1)) (hold_1)) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (hold_2)) (when (and (agentinroom room_4) (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))) (seen_psi_3)) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (hold_6)) (when (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (hold_8)) (when (and (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (emptyhands)) (not (hold_9))) (increase (total-cost) 1)))
)
