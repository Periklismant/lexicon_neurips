(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   blue_ball_1 red_ball_1 grey_ball_1 - ball
   yellow_door_2 yellow_door_1 grey_door_1 - door
   blue_box_1 yellow_box_1 purple_box_1 - box
   room_2 room_4 room_3 - room
   empty - empty_0
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (hold_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (= ?obj blue_ball_1) (not (locked yellow_door_1))) (hold_1)) (when (or (not (emptyhands)) (= ?obj purple_box_1)) (hold_2)) (when (objectinroom blue_box_1 room_3) (seen_psi_7)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (not (locked yellow_door_1)) (hold_1)) (when (not (emptyhands)) (hold_2)) (when (objectinroom blue_box_1 room_3) (seen_psi_7)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (not (locked yellow_door_1)) (hold_1)) (when (not (emptyhands)) (hold_2)) (when (or (objectinroom blue_box_1 room_3) (= ?door yellow_door_1)) (seen_psi_7)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4))))) (seen_psi_7)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (not (locked yellow_door_1)) (hold_1)) (when (not (emptyhands)) (hold_2)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_6)) (when (objectinroom blue_box_1 room_3) (seen_psi_7)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_8)) (when (and (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (locked yellow_door_2)) (not (hold_9))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (or (= ?obj blue_box_1) (carrying blue_box_1)) (objectinroom red_ball_1 room_4) (not (and (= ?obj red_ball_1) (= ?room room_4)))) (hold_0)) (when (or (and (at_ blue_ball_1) (not (= ?obj blue_ball_1))) (not (locked yellow_door_1))) (hold_1)) (hold_2) (when (and (locked grey_door_1) (not (and (objectinroom yellow_box_1 room_3) (not (and (= ?obj yellow_box_1) (= ?room room_3)))))) (not (hold_4))) (when (and (objectinroom yellow_box_1 room_3) (not (and (= ?obj yellow_box_1) (= ?room room_3)))) (hold_4)) (when (or (= ?obj grey_ball_1) (carrying grey_ball_1)) (hold_5)) (when (or (and (objectinroom blue_box_1 room_3) (not (and (= ?obj blue_box_1) (= ?room room_3)))) (at_ yellow_door_1)) (seen_psi_7)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (carrying blue_box_1) (not (= ?obj blue_box_1)) (or (and (= ?obj red_ball_1) (= ?room room_4)) (objectinroom red_ball_1 room_4))) (hold_0)) (when (or (= ?obj blue_ball_1) (at_ blue_ball_1) (not (locked yellow_door_1))) (hold_1)) (when (or (= ?obj purple_box_1) (at_ purple_box_1)) (hold_2)) (when (and (locked grey_door_1) (not (or (and (= ?obj yellow_box_1) (= ?room room_3)) (objectinroom yellow_box_1 room_3)))) (not (hold_4))) (when (or (and (= ?obj yellow_box_1) (= ?room room_3)) (objectinroom yellow_box_1 room_3)) (hold_4)) (when (and (carrying grey_ball_1) (not (= ?obj grey_ball_1))) (hold_5)) (when (or (and (= ?obj blue_box_1) (= ?room room_3)) (objectinroom blue_box_1 room_3) (at_ yellow_door_1)) (seen_psi_7)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (at_ blue_ball_1) (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1))))))) (hold_1)) (when (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (hold_3)) (when (and (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (not (objectinroom yellow_box_1 room_3))) (not (hold_4))) (when (and (agentinroom room_2) (or (and (not (locked ?door)) (= ?door yellow_door_2)) (and (locked yellow_door_2) (not (and (locked ?door) (= ?door yellow_door_2)))))) (not (hold_9))) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_2)) (and (locked yellow_door_2) (not (and (locked ?door) (= ?door yellow_door_2)))))) (hold_9)) (increase (total-cost) 1)))
)
