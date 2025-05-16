(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   grey_ball_3 red_ball_1 - ball
   blue_box_1 - box
   room_1 room_3 room_4 - room
   empty - empty_0
   grey_door_1 green_door_1 purple_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (seen_psi_2) (hold_3) (seen_psi_4) (hold_5) (hold_6) (hold_7) (hold_8) (seen_psi_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room) (or (not (= ?obj grey_ball_3)) (seen_psi_9)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (= ?obj blue_box_1) (agentinroom room_1)) (hold_0)) (when (or (carrying red_ball_1) (= ?obj red_ball_1)) (seen_psi_2)) (when (= ?obj grey_ball_3) (hold_8)) (when (= ?obj empty) (seen_psi_9)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (carrying red_ball_1) (seen_psi_2)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (carrying red_ball_1) (seen_psi_2)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4))))) (seen_psi_4)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (carrying red_ball_1) (seen_psi_2)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_3)) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (hold_6)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands) (or (not (and (at_ grey_ball_3) (not (= ?obj grey_ball_3)))) (seen_psi_9)))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (at_ blue_box_1) (not (= ?obj blue_box_1)) (agentinroom room_1)) (hold_0)) (when (or (= ?obj red_ball_1) (carrying red_ball_1) (and (at_ red_ball_1) (not (= ?obj red_ball_1)))) (seen_psi_2)) (when (and (or (= ?obj blue_box_1) (carrying blue_box_1)) (not (locked green_door_1))) (seen_psi_4)) (hold_7) (when (and (at_ grey_ball_3) (not (= ?obj grey_ball_3))) (hold_8)) (when (and (at_ empty) (not (= ?obj empty))) (seen_psi_9)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty) (or (not (or (= ?obj grey_ball_3) (at_ grey_ball_3))) (seen_psi_9)))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (or (= ?obj blue_box_1) (at_ blue_box_1)) (agentinroom room_1)) (hold_0)) (when (or (and (carrying red_ball_1) (not (= ?obj red_ball_1))) (= ?obj red_ball_1) (at_ red_ball_1)) (seen_psi_2)) (when (and (carrying blue_box_1) (not (= ?obj blue_box_1)) (not (locked green_door_1))) (seen_psi_4)) (when (or (= ?obj grey_ball_3) (at_ grey_ball_3)) (hold_8)) (when (or (= ?obj empty) (at_ empty)) (seen_psi_9)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))) (seen_psi_2)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))))) (hold_1)) (when (and (carrying blue_box_1) (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))))) (seen_psi_4)) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (hold_5)) (increase (total-cost) 1)))
)
