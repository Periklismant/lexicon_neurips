(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   red_box_1 green_box_1 - box
   empty - empty_0
   blue_door_1 purple_door_1 - door
   room_2 room_3 room_1 - room
   grey_ball_1 - ball
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (seen_psi_7) (hold_8) (hold_9) (hold_10) (hold_11))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj green_box_1) (hold_0)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door blue_door_1) (hold_1)) (when (and (= ?door blue_door_1) (not (carrying red_box_1))) (not (hold_2))) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))))) (seen_psi_7)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (not (emptyhands)) (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))))) (hold_5)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_6)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_9)) (when (and (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (not (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))))) (not (hold_10))) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (hold_10)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (at_ green_box_1) (not (= ?obj green_box_1))) (hold_0)) (when (and (at_ blue_door_1) (not (or (= ?obj red_box_1) (carrying red_box_1)))) (not (hold_2))) (when (or (= ?obj red_box_1) (carrying red_box_1)) (hold_2)) (when (or (= ?obj grey_ball_1) (carrying grey_ball_1)) (hold_3)) (when (or (= ?obj green_box_1) (carrying green_box_1)) (hold_4)) (when (agentinroom room_3) (hold_5)) (seen_psi_7) (when (and (or (= ?obj grey_ball_1) (carrying grey_ball_1)) (objectinroom green_box_1 room_2) (not (and (= ?obj green_box_1) (= ?room room_2)))) (hold_8)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (= ?obj green_box_1) (at_ green_box_1)) (hold_0)) (when (and (at_ blue_door_1) (not (and (carrying red_box_1) (not (= ?obj red_box_1))))) (not (hold_2))) (when (and (carrying red_box_1) (not (= ?obj red_box_1))) (hold_2)) (when (and (carrying grey_ball_1) (not (= ?obj grey_ball_1))) (hold_3)) (when (and (carrying green_box_1) (not (= ?obj green_box_1))) (hold_4)) (when (and (carrying grey_ball_1) (not (= ?obj grey_ball_1)) (or (and (= ?obj green_box_1) (= ?room room_2)) (objectinroom green_box_1 room_2))) (hold_8)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door purple_door_1)) (and (locked purple_door_1) (not (and (locked ?door) (= ?door purple_door_1)))))) (hold_11)) (increase (total-cost) 1)))
)
