(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   grey_door_1 red_door_1 - door
   red_ball_4 grey_ball_1 - ball
   empty - empty_0
   room_2 room_4 room_3 room_1 - room
   yellow_box_2 - box
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (hold_6) (hold_7) (seen_psi_8) (hold_9) (hold_10))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (locked grey_door_1) (not (= ?obj red_ball_4))) (not (hold_10))) (when (= ?obj red_ball_4) (hold_10)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (locked grey_door_1) (not (hold_10))) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door grey_door_1)) (seen_psi_3)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door grey_door_1) (hold_2)) (when (locked grey_door_1) (not (hold_10))) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4))))))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (and (locked red_door_1) (not (or (carrying grey_ball_1) (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))))) (not (hold_1))) (when (or (carrying grey_ball_1) (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_1)) (when (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (hold_4)) (when (and (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2)))) (not (objectinroom red_ball_4 room_3))) (not (hold_5))) (when (locked grey_door_1) (not (hold_10))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (locked red_door_1) (not (or (= ?obj grey_ball_1) (carrying grey_ball_1) (agentinroom room_1)))) (not (hold_1))) (when (or (= ?obj grey_ball_1) (carrying grey_ball_1) (agentinroom room_1)) (hold_1)) (seen_psi_3) (when (and (agentinroom room_2) (not (and (objectinroom red_ball_4 room_3) (not (and (= ?obj red_ball_4) (= ?room room_3)))))) (not (hold_5))) (when (and (objectinroom red_ball_4 room_3) (not (and (= ?obj red_ball_4) (= ?room room_3)))) (hold_5)) (when (or (= ?obj red_ball_4) (carrying red_ball_4)) (hold_6)) (seen_psi_8) (when (and (locked grey_door_1) (not (and (at_ red_ball_4) (not (= ?obj red_ball_4))))) (not (hold_10))) (when (and (at_ red_ball_4) (not (= ?obj red_ball_4))) (hold_10)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (and (locked red_door_1) (not (or (and (carrying grey_ball_1) (not (= ?obj grey_ball_1))) (agentinroom room_1)))) (not (hold_1))) (when (or (and (carrying grey_ball_1) (not (= ?obj grey_ball_1))) (agentinroom room_1)) (hold_1)) (when (and (carrying yellow_box_2) (not (= ?obj yellow_box_2))) (seen_psi_3)) (when (and (agentinroom room_2) (not (or (and (= ?obj red_ball_4) (= ?room room_3)) (objectinroom red_ball_4 room_3)))) (not (hold_5))) (when (or (and (= ?obj red_ball_4) (= ?room room_3)) (objectinroom red_ball_4 room_3)) (hold_5)) (when (and (carrying red_ball_4) (not (= ?obj red_ball_4))) (hold_6)) (when (and (locked grey_door_1) (not (or (= ?obj red_ball_4) (at_ red_ball_4)))) (not (hold_10))) (when (or (= ?obj red_ball_4) (at_ red_ball_4)) (hold_10)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))) (seen_psi_8)))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (hold_0)) (when (and (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1))))) (not (or (carrying grey_ball_1) (agentinroom room_1)))) (not (hold_1))) (when (not (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1)))))) (hold_7)) (when (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (hold_9)) (when (and (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))) (not (at_ red_ball_4))) (not (hold_10))) (increase (total-cost) 1)))
)
