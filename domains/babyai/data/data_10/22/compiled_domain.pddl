(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   purple_box_1 red_box_1 green_box_1 yellow_box_1 - box
   green_door_1 grey_door_1 yellow_door_1 - door
   empty - empty_0
   red_ball_1 - ball
   room_3 room_1 room_4 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (seen_psi_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room) (or (not (= ?obj red_box_1)) (seen_psi_7)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (locked grey_door_1) (locked green_door_1)) (not (hold_2))) (when (not (locked green_door_1)) (hold_2)) (when (= ?obj red_box_1) (hold_6)) (when (= ?obj empty) (seen_psi_7)) (when (or (= ?obj yellow_box_1) (not (emptyhands))) (hold_14)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (and (locked grey_door_1) (locked green_door_1)) (not (hold_2))) (when (not (locked green_door_1)) (hold_2)) (when (not (emptyhands)) (hold_14)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (and (locked grey_door_1) (not (or (not (locked green_door_1)) (= ?door yellow_door_1)))) (not (hold_2))) (when (or (not (locked green_door_1)) (= ?door yellow_door_1)) (hold_2)) (when (= ?door grey_door_1) (hold_10)) (when (and (= ?door grey_door_1) (not (or (objectinroom red_ball_1 room_1) (locked grey_door_1)))) (not (hold_11))) (when (not (emptyhands)) (hold_14)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (locked grey_door_1) (locked green_door_1)) (not (hold_2))) (when (not (locked green_door_1)) (hold_2)) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))) (carrying yellow_box_1)) (seen_psi_4)) (when (and (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (carrying green_box_1)) (hold_5)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_12)) (when (and (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))))) (not (hold_13))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_13)) (when (not (emptyhands)) (hold_14)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands) (or (not (and (at_ red_box_1) (not (= ?obj red_box_1)))) (seen_psi_7)))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (or (agentinroom room_3) (= ?obj yellow_box_1) (carrying yellow_box_1)) (seen_psi_4)) (when (and (agentinroom room_3) (or (= ?obj green_box_1) (carrying green_box_1))) (hold_5)) (when (and (at_ red_box_1) (not (= ?obj red_box_1))) (hold_6)) (when (and (at_ empty) (not (= ?obj empty))) (seen_psi_7)) (when (or (= ?obj red_box_1) (carrying red_box_1) (= ?obj green_box_1) (carrying green_box_1)) (hold_8)) (when (and (objectinroom purple_box_1 room_4) (not (and (= ?obj purple_box_1) (= ?room room_4)))) (hold_9)) (when (and (at_ grey_door_1) (not (or (and (objectinroom red_ball_1 room_1) (not (and (= ?obj red_ball_1) (= ?room room_1)))) (locked grey_door_1)))) (not (hold_11))) (when (or (and (objectinroom red_ball_1 room_1) (not (and (= ?obj red_ball_1) (= ?room room_1)))) (locked grey_door_1)) (hold_11)) (hold_14) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty) (or (not (or (= ?obj red_box_1) (at_ red_box_1))) (seen_psi_7)))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (agentinroom room_3) (and (carrying yellow_box_1) (not (= ?obj yellow_box_1)))) (seen_psi_4)) (when (and (agentinroom room_3) (carrying green_box_1) (not (= ?obj green_box_1))) (hold_5)) (when (or (= ?obj red_box_1) (at_ red_box_1)) (hold_6)) (when (or (= ?obj empty) (at_ empty)) (seen_psi_7)) (when (or (and (carrying red_box_1) (not (= ?obj red_box_1))) (and (carrying green_box_1) (not (= ?obj green_box_1)))) (hold_8)) (when (and (at_ grey_door_1) (not (or (and (= ?obj red_ball_1) (= ?room room_1)) (objectinroom red_ball_1 room_1) (locked grey_door_1)))) (not (hold_11))) (when (or (and (= ?obj red_ball_1) (= ?room room_1)) (objectinroom red_ball_1 room_1) (locked grey_door_1)) (hold_11)) (when (or (= ?obj yellow_box_1) (at_ yellow_box_1)) (hold_14)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))) (seen_psi_4)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (hold_1)) (when (and (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (not (or (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (at_ yellow_door_1)))) (not (hold_2))) (when (or (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (at_ yellow_door_1)) (hold_2)) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (hold_3)) (when (and (at_ grey_door_1) (not (or (objectinroom red_ball_1 room_1) (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))))) (not (hold_11))) (when (or (objectinroom red_ball_1 room_1) (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (hold_11)) (increase (total-cost) 1)))
)
