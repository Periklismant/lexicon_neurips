(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   grey_ball_1 green_ball_2 grey_ball_2 red_ball_1 - ball
   empty - empty_0
   blue_door_1 grey_door_1 yellow_door_1 - door
   room_2 room_1 room_4 - room
   purple_box_1 - box
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (seen_psi_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (seen_psi_11))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (= ?obj green_ball_2) (hold_0)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door grey_door_1)) (seen_psi_11)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (= ?door grey_door_1) (hold_10)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))))))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_4)) (when (and (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (not (or (carrying red_ball_1) (objectinroom green_ball_2 room_2)))) (not (hold_5))) (when (or (= ?room2 room_4) (and (agentinroom room_4) (not (= ?room1 room_4))) (objectinroom purple_box_1 room_4)) (seen_psi_11)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (when (and (at_ green_ball_2) (not (= ?obj green_ball_2))) (hold_0)) (when (not (locked blue_door_1)) (hold_1)) (when (or (= ?obj grey_ball_2) (carrying grey_ball_2)) (seen_psi_3)) (when (and (agentinroom room_1) (not (or (= ?obj red_ball_1) (carrying red_ball_1) (and (objectinroom green_ball_2 room_2) (not (and (= ?obj green_ball_2) (= ?room room_2))))))) (not (hold_5))) (when (or (= ?obj red_ball_1) (carrying red_ball_1) (and (objectinroom green_ball_2 room_2) (not (and (= ?obj green_ball_2) (= ?room room_2))))) (hold_5)) (when (or (= ?obj grey_ball_1) (carrying grey_ball_1)) (hold_8)) (hold_9) (when (or (agentinroom room_4) (and (objectinroom purple_box_1 room_4) (not (and (= ?obj purple_box_1) (= ?room room_4))))) (seen_psi_11)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (= ?obj green_ball_2) (at_ green_ball_2)) (hold_0)) (when (and (carrying grey_ball_2) (not (= ?obj grey_ball_2))) (seen_psi_3)) (when (and (agentinroom room_1) (not (or (and (carrying red_ball_1) (not (= ?obj red_ball_1))) (and (= ?obj green_ball_2) (= ?room room_2)) (objectinroom green_ball_2 room_2)))) (not (hold_5))) (when (or (and (carrying red_ball_1) (not (= ?obj red_ball_1))) (and (= ?obj green_ball_2) (= ?room room_2)) (objectinroom green_ball_2 room_2)) (hold_5)) (when (or (agentinroom room_4) (and (= ?obj purple_box_1) (= ?room room_4)) (objectinroom purple_box_1 room_4)) (seen_psi_11)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))) (seen_psi_3)) (or (and (not (locked ?door)) (= ?door grey_door_1)) (and (locked grey_door_1) (not (and (locked ?door) (= ?door grey_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (and (not (emptyhands)) (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1))))))) (hold_1)) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1)))))) (hold_2)) (when (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1))))) (hold_6)) (when (and (or (and (not (locked ?door)) (= ?door yellow_door_1)) (and (locked yellow_door_1) (not (and (locked ?door) (= ?door yellow_door_1))))) (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (not (hold_7))) (when (not (or (and (not (locked ?door)) (= ?door blue_door_1)) (and (locked blue_door_1) (not (and (locked ?door) (= ?door blue_door_1)))))) (hold_7)) (increase (total-cost) 1)))
)
