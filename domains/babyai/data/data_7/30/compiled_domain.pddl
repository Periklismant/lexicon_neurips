(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   green_door_1 red_door_1 yellow_door_1 grey_door_1 - door
   yellow_box_1 blue_box_1 - box
   empty - empty_0
   room_4 room_3 room_1 - room
   red_ball_2 red_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (seen_psi_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (hold_9) (hold_10))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (locked grey_door_1) (locked green_door_1)) (not (hold_2))) (when (not (locked green_door_1)) (hold_2)) (when (= ?obj blue_box_1) (hold_8)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (and (locked grey_door_1) (locked green_door_1)) (not (hold_2))) (when (not (locked green_door_1)) (hold_2)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door grey_door_1)) (seen_psi_7)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (and (locked grey_door_1) (not (or (not (locked green_door_1)) (= ?door yellow_door_1)))) (not (hold_2))) (when (or (not (locked green_door_1)) (= ?door yellow_door_1)) (hold_2)) (when (= ?door grey_door_1) (hold_6)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (locked grey_door_1) (locked green_door_1)) (not (hold_2))) (when (not (locked green_door_1)) (hold_2)) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))) (carrying red_ball_2)) (seen_psi_4)) (when (and (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (carrying red_ball_1)) (hold_5)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_9)) (when (and (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))) (not (locked red_door_1))))) (not (hold_10))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))) (not (locked red_door_1))) (hold_10)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (or (agentinroom room_3) (= ?obj red_ball_2) (carrying red_ball_2)) (seen_psi_4)) (when (and (agentinroom room_3) (or (= ?obj red_ball_1) (carrying red_ball_1))) (hold_5)) (when (or (= ?obj yellow_box_1) (carrying yellow_box_1)) (seen_psi_7)) (when (and (at_ blue_box_1) (not (= ?obj blue_box_1))) (hold_8)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (agentinroom room_3) (and (carrying red_ball_2) (not (= ?obj red_ball_2)))) (seen_psi_4)) (when (and (agentinroom room_3) (carrying red_ball_1) (not (= ?obj red_ball_1))) (hold_5)) (when (and (carrying yellow_box_1) (not (= ?obj yellow_box_1))) (seen_psi_7)) (when (or (= ?obj blue_box_1) (at_ blue_box_1)) (hold_8)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))) (seen_psi_4)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (hold_1)) (when (and (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (not (or (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (at_ yellow_door_1)))) (not (hold_2))) (when (or (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (at_ yellow_door_1)) (hold_2)) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (hold_3)) (when (and (agentinroom room_4) (not (or (agentinroom room_1) (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))))) (not (hold_10))) (when (or (agentinroom room_1) (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))) (hold_10)) (increase (total-cost) 1)))
)
