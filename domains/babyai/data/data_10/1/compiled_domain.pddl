(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   purple_ball_1 grey_ball_1 grey_ball_3 - ball
   room_1 room_2 room_4 - room
   grey_door_1 green_door_1 purple_door_1 - door
   empty - empty_0
   blue_box_1 - box
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (seen_psi_2) (hold_3) (seen_psi_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (seen_psi_12))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room) (or (not (= ?obj grey_ball_3)) (seen_psi_12)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (carrying purple_ball_1) (= ?obj purple_ball_1)) (seen_psi_2)) (when (and (agentinroom room_2) (not (= ?obj purple_ball_1))) (not (hold_8))) (when (= ?obj purple_ball_1) (hold_8)) (when (or (not (locked grey_door_1)) (= ?obj purple_ball_1)) (hold_10)) (when (= ?obj grey_ball_3) (hold_11)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (carrying purple_ball_1) (seen_psi_2)) (when (agentinroom room_2) (not (hold_8))) (when (not (locked grey_door_1)) (hold_10)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (carrying purple_ball_1) (seen_psi_2)) (when (agentinroom room_2) (not (hold_8))) (when (not (locked grey_door_1)) (hold_10)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4))))) (seen_psi_4)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (objectinroom blue_box_1 room_4) (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1))))) (hold_0)) (when (carrying purple_ball_1) (seen_psi_2)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_3)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_7)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (not (hold_8))) (when (not (locked grey_door_1)) (hold_10)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands) (or (not (and (at_ grey_ball_3) (not (= ?obj grey_ball_3)))) (seen_psi_12)))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (objectinroom blue_box_1 room_4) (not (and (= ?obj blue_box_1) (= ?room room_4))) (agentinroom room_1)) (hold_0)) (when (or (= ?obj purple_ball_1) (carrying purple_ball_1) (and (at_ purple_ball_1) (not (= ?obj purple_ball_1)))) (seen_psi_2)) (when (and (or (= ?obj grey_ball_1) (carrying grey_ball_1)) (not (locked green_door_1))) (seen_psi_4)) (when (and (locked purple_door_1) (not (or (= ?obj grey_ball_3) (carrying grey_ball_3)))) (not (hold_6))) (when (or (= ?obj grey_ball_3) (carrying grey_ball_3)) (hold_6)) (when (and (agentinroom room_2) (not (and (at_ purple_ball_1) (not (= ?obj purple_ball_1))))) (not (hold_8))) (when (and (at_ purple_ball_1) (not (= ?obj purple_ball_1))) (hold_8)) (hold_9) (when (or (not (locked grey_door_1)) (and (at_ purple_ball_1) (not (= ?obj purple_ball_1)))) (hold_10)) (when (and (at_ grey_ball_3) (not (= ?obj grey_ball_3))) (hold_11)) (seen_psi_12) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty) (or (not (or (= ?obj grey_ball_3) (at_ grey_ball_3))) (seen_psi_12)))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (or (and (= ?obj blue_box_1) (= ?room room_4)) (objectinroom blue_box_1 room_4)) (agentinroom room_1)) (hold_0)) (when (or (and (carrying purple_ball_1) (not (= ?obj purple_ball_1))) (= ?obj purple_ball_1) (at_ purple_ball_1)) (seen_psi_2)) (when (and (carrying grey_ball_1) (not (= ?obj grey_ball_1)) (not (locked green_door_1))) (seen_psi_4)) (when (and (locked purple_door_1) (not (and (carrying grey_ball_3) (not (= ?obj grey_ball_3))))) (not (hold_6))) (when (and (carrying grey_ball_3) (not (= ?obj grey_ball_3))) (hold_6)) (when (and (agentinroom room_2) (not (or (= ?obj purple_ball_1) (at_ purple_ball_1)))) (not (hold_8))) (when (or (= ?obj purple_ball_1) (at_ purple_ball_1)) (hold_8)) (when (or (not (locked grey_door_1)) (= ?obj purple_ball_1) (at_ purple_ball_1)) (hold_10)) (when (or (= ?obj grey_ball_3) (at_ grey_ball_3)) (hold_11)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))) (seen_psi_2)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))))) (hold_1)) (when (and (carrying grey_ball_1) (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))))) (seen_psi_4)) (when (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))) (hold_5)) (when (and (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))) (not (carrying grey_ball_3))) (not (hold_6))) (when (or (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (at_ purple_ball_1)) (hold_10)) (increase (total-cost) 1)))
)
