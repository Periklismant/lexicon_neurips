(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   empty - empty_0
   room_1 room_3 room_4 - room
   grey_ball_2 blue_ball_1 purple_ball_1 - ball
   purple_door_2 grey_door_1 - door
   grey_box_1 - box
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (seen_psi_6) (hold_7) (hold_8) (hold_9) (hold_10))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))))) (seen_psi_6)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_0)) (when (and (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (not (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))))) (not (hold_1))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_1)) (when (and (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (carrying purple_ball_1)) (seen_psi_3)) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (hold_5)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_8)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (agentinroom room_3) (or (= ?obj purple_ball_1) (carrying purple_ball_1))) (seen_psi_3)) (when (and (not (locked grey_door_1)) (or (= ?obj purple_ball_1) (carrying purple_ball_1))) (hold_4)) (when (or (= ?obj grey_box_1) (carrying grey_box_1) (and (objectinroom grey_ball_2 room_1) (not (and (= ?obj grey_ball_2) (= ?room room_1))))) (seen_psi_6)) (when (and (not (locked grey_door_1)) (or (= ?obj blue_ball_1) (carrying blue_ball_1))) (hold_7)) (when (and (locked purple_door_2) (not (and (objectinroom grey_ball_2 room_1) (not (and (= ?obj grey_ball_2) (= ?room room_1)))))) (not (hold_10))) (when (and (objectinroom grey_ball_2 room_1) (not (and (= ?obj grey_ball_2) (= ?room room_1)))) (hold_10)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (agentinroom room_3) (carrying purple_ball_1) (not (= ?obj purple_ball_1))) (seen_psi_3)) (when (and (not (locked grey_door_1)) (carrying purple_ball_1) (not (= ?obj purple_ball_1))) (hold_4)) (when (or (and (carrying grey_box_1) (not (= ?obj grey_box_1))) (and (= ?obj grey_ball_2) (= ?room room_1)) (objectinroom grey_ball_2 room_1)) (seen_psi_6)) (when (and (not (locked grey_door_1)) (carrying blue_ball_1) (not (= ?obj blue_ball_1))) (hold_7)) (when (and (locked purple_door_2) (not (or (and (= ?obj grey_ball_2) (= ?room room_1)) (objectinroom grey_ball_2 room_1)))) (not (hold_10))) (when (or (and (= ?obj grey_ball_2) (= ?room room_1)) (objectinroom grey_ball_2 room_1)) (hold_10)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2)))) (seen_psi_3)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2)))))) (hold_2)) (when (and (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (carrying purple_ball_1)) (hold_4)) (when (and (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (carrying blue_ball_1)) (hold_7)) (when (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2))))) (hold_9)) (when (and (or (and (not (locked ?door)) (= ?door purple_door_2)) (and (locked purple_door_2) (not (and (locked ?door) (= ?door purple_door_2))))) (not (objectinroom grey_ball_2 room_1))) (not (hold_10))) (increase (total-cost) 1)))
)
