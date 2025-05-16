(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 ball box - object_
 )
 (:constants
   yellow_door_1 blue_door_1 yellow_door_2 green_door_1 - door
   purple_ball_1 grey_ball_1 - ball
   empty - empty_0
   green_box_1 yellow_box_2 - box
   room_3 room_2 room_1 - room
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (not (locked green_door_1)) (not (= ?obj grey_ball_1))) (not (hold_2))) (when (= ?obj grey_ball_1) (hold_2)) (when (and (= ?obj empty) (objectinroom green_box_1 room_1)) (hold_5)) (when (and (locked green_door_1) (emptyhands)) (not (hold_7))) (when (not (emptyhands)) (hold_7)) (when (agentinroom room_1) (not (hold_10))) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (not (locked green_door_1)) (not (hold_2))) (when (and (locked green_door_1) (emptyhands)) (not (hold_7))) (when (not (emptyhands)) (hold_7)) (when (agentinroom room_1) (not (hold_10))) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (not (locked green_door_1)) (not (hold_2))) (when (and (locked green_door_1) (not (or (= ?door blue_door_1) (not (emptyhands))))) (not (hold_7))) (when (or (= ?door blue_door_1) (not (emptyhands))) (hold_7)) (when (and (agentinroom room_1) (not (= ?door yellow_door_1))) (not (hold_10))) (when (= ?door yellow_door_1) (hold_10)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (not (or (= ?room2 room_2) (and (agentinroom room_2) (not (= ?room1 room_2))))))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (not (locked green_door_1)) (not (hold_2))) (when (and (locked green_door_1) (emptyhands)) (not (hold_7))) (when (not (emptyhands)) (hold_7)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_9)) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (not (hold_10))) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (and (not (locked green_door_1)) (not (and (at_ grey_ball_1) (not (= ?obj grey_ball_1))))) (not (hold_2))) (when (and (at_ grey_ball_1) (not (= ?obj grey_ball_1))) (hold_2)) (when (and (not (locked yellow_door_2)) (not (or (= ?obj green_box_1) (carrying green_box_1) (= ?obj purple_ball_1) (carrying purple_ball_1)))) (not (hold_4))) (when (or (= ?obj green_box_1) (carrying green_box_1) (= ?obj purple_ball_1) (carrying purple_ball_1)) (hold_4)) (when (and (at_ empty) (not (= ?obj empty)) (objectinroom green_box_1 room_1) (not (and (= ?obj green_box_1) (= ?room room_1)))) (hold_5)) (hold_7) (when (or (= ?obj green_box_1) (carrying green_box_1)) (hold_8)) (when (and (objectinroom green_box_1 room_1) (not (and (= ?obj green_box_1) (= ?room room_1)))) (hold_11)) (hold_12) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (= ?obj yellow_box_2) (= ?room room_3)) (objectinroom yellow_box_2 room_3)) (hold_0)) (when (and (not (locked green_door_1)) (not (or (= ?obj grey_ball_1) (at_ grey_ball_1)))) (not (hold_2))) (when (or (= ?obj grey_ball_1) (at_ grey_ball_1)) (hold_2)) (when (and (not (locked yellow_door_2)) (not (or (and (carrying green_box_1) (not (= ?obj green_box_1))) (and (carrying purple_ball_1) (not (= ?obj purple_ball_1)))))) (not (hold_4))) (when (or (and (carrying green_box_1) (not (= ?obj green_box_1))) (and (carrying purple_ball_1) (not (= ?obj purple_ball_1)))) (hold_4)) (when (and (or (= ?obj empty) (at_ empty)) (or (and (= ?obj green_box_1) (= ?room room_1)) (objectinroom green_box_1 room_1))) (hold_5)) (when (and (locked green_door_1) (not (at_ blue_door_1))) (not (hold_7))) (when (at_ blue_door_1) (hold_7)) (when (and (carrying green_box_1) (not (= ?obj green_box_1))) (hold_8)) (when (or (and (= ?obj green_box_1) (= ?room room_1)) (objectinroom green_box_1 room_1)) (hold_11)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (hold_1)) (when (and (not (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1)))))) (not (at_ grey_ball_1))) (not (hold_2))) (when (not (or (and (not (locked ?door)) (= ?door yellow_door_2)) (and (locked yellow_door_2) (not (and (locked ?door) (= ?door yellow_door_2)))))) (hold_3)) (when (and (not (or (and (not (locked ?door)) (= ?door yellow_door_2)) (and (locked yellow_door_2) (not (and (locked ?door) (= ?door yellow_door_2)))))) (not (or (carrying green_box_1) (carrying purple_ball_1)))) (not (hold_4))) (when (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))) (hold_6)) (when (and (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))) (not (or (at_ blue_door_1) (not (emptyhands))))) (not (hold_7))) (increase (total-cost) 1)))
)
