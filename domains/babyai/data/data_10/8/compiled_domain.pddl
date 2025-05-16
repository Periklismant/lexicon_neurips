(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   empty - empty_0
   grey_ball_1 - ball
   room_3 room_1 room_4 - room
   green_door_1 blue_door_1 yellow_door_1 red_door_1 - door
   green_box_2 green_box_1 - box
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (seen_psi_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (or (= ?obj empty) (not (emptyhands))) (seen_psi_1)) (when (objectinroom grey_ball_1 room_1) (hold_7)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (not (emptyhands)) (seen_psi_1)) (when (objectinroom grey_ball_1 room_1) (hold_7)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (not (emptyhands)) (seen_psi_1)) (when (or (objectinroom grey_ball_1 room_1) (= ?door yellow_door_1)) (hold_7)) (when (= ?door red_door_1) (hold_8)) (when (and (= ?door red_door_1) (not (and (not (locked blue_door_1)) (carrying green_box_1)))) (not (hold_9))) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))))) (seen_psi_1)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (hold_0)) (when (not (emptyhands)) (seen_psi_1)) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_2)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_4)) (when (and (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (locked green_door_1)) (not (hold_5))) (when (objectinroom grey_ball_1 room_1) (hold_7)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (seen_psi_1) (when (and (not (locked blue_door_1)) (or (= ?obj green_box_2) (carrying green_box_2))) (hold_6)) (when (or (and (objectinroom grey_ball_1 room_1) (not (and (= ?obj grey_ball_1) (= ?room room_1)))) (at_ yellow_door_1)) (hold_7)) (when (and (at_ red_door_1) (not (and (not (locked blue_door_1)) (or (= ?obj green_box_1) (carrying green_box_1))))) (not (hold_9))) (when (and (not (locked blue_door_1)) (or (= ?obj green_box_1) (carrying green_box_1))) (hold_9)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (= ?obj empty) (at_ empty)) (seen_psi_1)) (when (and (not (locked blue_door_1)) (carrying green_box_2) (not (= ?obj green_box_2))) (hold_6)) (when (or (and (= ?obj grey_ball_1) (= ?room room_1)) (objectinroom grey_ball_1 room_1) (at_ yellow_door_1)) (hold_7)) (when (and (at_ red_door_1) (not (and (not (locked blue_door_1)) (carrying green_box_1) (not (= ?obj green_box_1))))) (not (hold_9))) (when (and (not (locked blue_door_1)) (carrying green_box_1) (not (= ?obj green_box_1))) (hold_9)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (hold_3)) (when (and (agentinroom room_1) (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (not (hold_5))) (when (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (hold_5)) (when (and (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (carrying green_box_2)) (hold_6)) (when (and (at_ red_door_1) (not (and (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (carrying green_box_1)))) (not (hold_9))) (when (and (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (carrying green_box_1)) (hold_9)) (increase (total-cost) 1)))
)
