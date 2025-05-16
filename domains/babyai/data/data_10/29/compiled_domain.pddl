(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   empty - empty_0
   grey_door_1 red_door_1 red_door_2 purple_door_1 - door
   green_ball_1 red_ball_1 purple_ball_1 - ball
   room_3 room_2 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (seen_psi_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (seen_psi_8) (hold_9) (hold_10) (hold_11) (hold_12) (seen_psi_13))
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
 (not (blocked ?door ?o ?room1))) (or (not (= ?door grey_door_1)) (seen_psi_8)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door purple_door_1) (hold_0)) (when (= ?door red_door_2) (hold_5)) (when (and (= ?door red_door_2) (not (or (carrying red_ball_1) (carrying purple_ball_1)))) (not (hold_6))) (when (= ?door grey_door_1) (hold_7)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))))))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (not (locked purple_door_1)) (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (seen_psi_8)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (seen_psi_2) (hold_4) (when (and (at_ red_door_2) (not (or (= ?obj red_ball_1) (carrying red_ball_1) (= ?obj purple_ball_1) (carrying purple_ball_1)))) (not (hold_6))) (when (or (= ?obj red_ball_1) (carrying red_ball_1) (= ?obj purple_ball_1) (carrying purple_ball_1)) (hold_6)) (when (and (locked red_door_2) (not (or (= ?obj green_ball_1) (carrying green_ball_1) (not (locked purple_door_1))))) (not (hold_10))) (when (or (= ?obj green_ball_1) (carrying green_ball_1) (not (locked purple_door_1))) (hold_10)) (when (not (locked purple_door_1)) (hold_11)) (seen_psi_13) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (at_ red_door_2) (not (or (and (carrying red_ball_1) (not (= ?obj red_ball_1))) (and (carrying purple_ball_1) (not (= ?obj purple_ball_1)))))) (not (hold_6))) (when (or (and (carrying red_ball_1) (not (= ?obj red_ball_1))) (and (carrying purple_ball_1) (not (= ?obj purple_ball_1)))) (hold_6)) (when (and (locked red_door_2) (not (or (and (carrying green_ball_1) (not (= ?obj green_ball_1))) (not (locked purple_door_1))))) (not (hold_10))) (when (or (and (carrying green_ball_1) (not (= ?obj green_ball_1))) (not (locked purple_door_1))) (hold_10)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))) (seen_psi_2)) (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2)))) (seen_psi_13)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (hold_1)) (when (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))))) (hold_3)) (when (or (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))))) (agentinroom room_3)) (seen_psi_8)) (when (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2))))) (hold_9)) (when (and (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2))))) (not (or (carrying green_ball_1) (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))))))) (not (hold_10))) (when (or (carrying green_ball_1) (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))))) (hold_10)) (when (and (not (emptyhands)) (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1))))))) (hold_11)) (when (not (or (and (not (locked ?door)) (= ?door red_door_2)) (and (locked red_door_2) (not (and (locked ?door) (= ?door red_door_2)))))) (hold_12)) (increase (total-cost) 1)))
)
