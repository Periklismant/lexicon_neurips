(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   green_door_1 red_door_1 - door
   red_ball_1 green_ball_1 - ball
   green_box_1 red_box_2 grey_box_1 - box
   empty - empty_0
   room_1 room_3 room_4 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (seen_psi_5) (hold_6) (hold_7) (hold_8) (hold_9))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (not (locked green_door_1)) (not (and (carrying red_ball_1) (= ?obj green_box_1)))) (not (hold_1))) (when (and (carrying red_ball_1) (= ?obj green_box_1)) (hold_1)) (when (and (locked red_door_1) (not (= ?obj green_ball_1))) (not (hold_3))) (when (= ?obj green_ball_1) (hold_3)) (when (and (= ?obj red_box_2) (carrying grey_box_1)) (seen_psi_5)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (not (locked green_door_1)) (not (hold_1))) (when (locked red_door_1) (not (hold_3))) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (not (locked green_door_1)) (not (hold_1))) (when (locked red_door_1) (not (hold_3))) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))))))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (not (locked green_door_1)) (not (hold_1))) (when (locked red_door_1) (not (hold_3))) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (hold_6)) (when (and (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4)))) (emptyhands)) (not (hold_7))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_9)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (not (locked green_door_1)) (not (and (or (= ?obj red_ball_1) (carrying red_ball_1)) (at_ green_box_1) (not (= ?obj green_box_1))))) (not (hold_1))) (when (and (or (= ?obj red_ball_1) (carrying red_ball_1)) (at_ green_box_1) (not (= ?obj green_box_1))) (hold_1)) (when (and (locked red_door_1) (not (and (at_ green_ball_1) (not (= ?obj green_ball_1))))) (not (hold_3))) (when (and (at_ green_ball_1) (not (= ?obj green_ball_1))) (hold_3)) (when (and (at_ red_box_2) (not (= ?obj red_box_2)) (or (= ?obj grey_box_1) (carrying grey_box_1))) (seen_psi_5)) (hold_7) (when (or (= ?obj grey_box_1) (carrying grey_box_1)) (hold_8)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (not (locked green_door_1)) (not (and (carrying red_ball_1) (not (= ?obj red_ball_1)) (or (= ?obj green_box_1) (at_ green_box_1))))) (not (hold_1))) (when (and (carrying red_ball_1) (not (= ?obj red_ball_1)) (or (= ?obj green_box_1) (at_ green_box_1))) (hold_1)) (when (and (locked red_door_1) (not (or (= ?obj green_ball_1) (at_ green_ball_1)))) (not (hold_3))) (when (or (= ?obj green_ball_1) (at_ green_ball_1)) (hold_3)) (when (and (or (= ?obj red_box_2) (at_ red_box_2)) (carrying grey_box_1) (not (= ?obj grey_box_1))) (seen_psi_5)) (when (agentinroom room_4) (not (hold_7))) (when (and (carrying grey_box_1) (not (= ?obj grey_box_1))) (hold_8)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))) (seen_psi_5)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (hold_0)) (when (and (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (not (and (carrying red_ball_1) (at_ green_box_1)))) (not (hold_1))) (when (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (hold_2)) (when (and (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (not (at_ green_ball_1))) (not (hold_3))) (when (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))))) (hold_4)) (increase (total-cost) 1)))
)
