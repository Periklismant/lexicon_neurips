(define (domain liftedtcore_minigrid-domain)
 (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :equality :conditional-effects :existential-preconditions :universal-preconditions :action-costs)
 (:types
    room objectordoor color - object
    object_ door - objectordoor
    empty_0 box ball - object_
 )
 (:constants
   room_2 room_3 room_4 room_1 - room
   red_box_1 grey_box_2 yellow_box_2 grey_box_3 purple_box_1 - box
   empty - empty_0
   green_door_1 red_door_1 - door
 )
 (:predicates (agentinroom ?room - room) (objectinroom ?obj - object_ ?room - room) (objectcolor ?objectordoor - objectordoor ?color - color) (at_ ?objectordoor - objectordoor) (carrying ?obj - object_) (locked ?door - door) (adjacentrooms ?room1 - room ?room2 - room ?door - door) (blocked ?door - door ?obj - object_ ?room - room) (visited ?room - room) (emptyhands) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (seen_psi_5) (hold_6) (seen_psi_7) (hold_8))
 (:functions (total-cost))
 (:action gotoobject
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (objectinroom ?obj ?room) (agentinroom ?room))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?obj) (when (and (agentinroom room_1) (not (or (= ?obj purple_box_1) (objectinroom grey_box_2 room_4)))) (not (hold_2))) (when (or (= ?obj purple_box_1) (objectinroom grey_box_2 room_4)) (hold_2)) (when (or (objectinroom empty room_1) (= ?obj yellow_box_2)) (hold_8)) (increase (total-cost) 1)))
 (:action gotoempty
  :parameters ()
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ empty) (when (and (agentinroom room_1) (not (objectinroom grey_box_2 room_4))) (not (hold_2))) (when (objectinroom grey_box_2 room_4) (hold_2)) (when (objectinroom empty room_1) (hold_8)) (increase (total-cost) 1)))
 (:action gotodoor
  :parameters ( ?door - door ?room1 - room ?room2 - room)
  :precondition (and (adjacentrooms ?room1 ?room2 ?door) (agentinroom ?room1) (forall (?o - object_)
 (not (blocked ?door ?o ?room1))) (or (not (= ?door green_door_1)) (seen_psi_7)))
  :effect (and(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (at_ ?door) (when (and (agentinroom room_1) (not (objectinroom grey_box_2 room_4))) (not (hold_2))) (when (objectinroom grey_box_2 room_4) (hold_2)) (when (= ?door green_door_1) (hold_6)) (when (objectinroom empty room_1) (hold_8)) (increase (total-cost) 1)))
 (:action gotoroom
  :parameters ( ?room1 - room ?room2 - room ?door - door)
  :precondition (and (agentinroom ?room1) (adjacentrooms ?room1 ?room2 ?door) (not (locked ?door)) (or (not (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3))))) (seen_psi_5)))
  :effect (and (not (agentinroom ?room1)) (agentinroom ?room2) (visited ?room2)(forall (?o - object_) (when (at_ ?o) (not (at_ ?o))))(forall (?d - door) (when (at_ ?d) (not (at_ ?d)))) (when (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (hold_1)) (when (and (or (= ?room2 room_1) (and (agentinroom room_1) (not (= ?room1 room_1)))) (not (objectinroom grey_box_2 room_4))) (not (hold_2))) (when (objectinroom grey_box_2 room_4) (hold_2)) (when (or (= ?room2 room_3) (and (agentinroom room_3) (not (= ?room1 room_3)))) (hold_4)) (when (objectinroom empty room_1) (hold_8)) (increase (total-cost) 1)))
 (:action pick
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (objectinroom ?obj ?room) (at_ ?obj) (emptyhands))
  :effect (and (not (at_ ?obj)) (not (emptyhands)) (carrying ?obj) (not (objectinroom ?obj ?room))(forall (?d - door) (when (blocked ?d ?obj ?room) (not (blocked ?d ?obj ?room)))) (hold_0) (when (and (agentinroom room_1) (not (or (and (at_ purple_box_1) (not (= ?obj purple_box_1))) (and (objectinroom grey_box_2 room_4) (not (and (= ?obj grey_box_2) (= ?room room_4))))))) (not (hold_2))) (when (or (and (at_ purple_box_1) (not (= ?obj purple_box_1))) (and (objectinroom grey_box_2 room_4) (not (and (= ?obj grey_box_2) (= ?room room_4))))) (hold_2)) (seen_psi_5) (when (or (= ?obj yellow_box_2) (carrying yellow_box_2)) (seen_psi_7)) (when (or (and (objectinroom empty room_1) (not (and (= ?obj empty) (= ?room room_1)))) (and (at_ yellow_box_2) (not (= ?obj yellow_box_2)))) (hold_8)) (increase (total-cost) 1)))
 (:action drop
  :parameters ( ?obj - object_ ?room - room)
  :precondition (and (agentinroom ?room) (carrying ?obj) (not (emptyhands)) (at_ empty))
  :effect (and (not (carrying ?obj)) (at_ ?obj) (not (at_ empty)) (emptyhands) (objectinroom ?obj ?room) (when (or (and (= ?obj grey_box_3) (= ?room room_1)) (objectinroom grey_box_3 room_1)) (hold_0)) (when (and (agentinroom room_1) (not (or (= ?obj purple_box_1) (at_ purple_box_1) (and (= ?obj grey_box_2) (= ?room room_4)) (objectinroom grey_box_2 room_4)))) (not (hold_2))) (when (or (= ?obj purple_box_1) (at_ purple_box_1) (and (= ?obj grey_box_2) (= ?room room_4)) (objectinroom grey_box_2 room_4)) (hold_2)) (when (or (and (= ?obj red_box_1) (= ?room room_2)) (objectinroom red_box_1 room_2)) (seen_psi_5)) (when (and (carrying yellow_box_2) (not (= ?obj yellow_box_2))) (seen_psi_7)) (when (or (and (= ?obj empty) (= ?room room_1)) (objectinroom empty room_1) (= ?obj yellow_box_2) (at_ yellow_box_2)) (hold_8)) (increase (total-cost) 1)))
 (:action toggle
  :parameters ( ?door - door)
  :precondition (and (at_ ?door) (or (and (not (locked ?door)) (= ?door green_door_1)) (and (locked green_door_1) (not (and (locked ?door) (= ?door green_door_1))))))
  :effect (and (when (not (locked ?door)) (locked ?door)) (when (locked ?door) (not (locked ?door))) (when (not (or (and (not (locked ?door)) (= ?door red_door_1)) (and (locked red_door_1) (not (and (locked ?door) (= ?door red_door_1)))))) (hold_3)) (increase (total-cost) 1)))
)
