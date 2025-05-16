(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 yellow_door_2 - door
   grey_box_1 yellow_box_1 - box
   green_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom grey_box_1 room_1) (objectinroom red_box_1 room_1) (objectinroom green_ball_1 room_2) (objectinroom grey_box_2 room_2) (objectinroom yellow_box_1 room_2) (objectinroom yellow_box_2 room_3) (objectinroom grey_box_3 room_3) (objectinroom purple_box_1 room_4) (objectcolor grey_box_1 greytype) (objectcolor red_box_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor grey_box_2 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor yellow_box_2 yellowtype) (objectcolor grey_box_3 greytype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked yellow_door_1) (locked green_door_1) (locked red_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_1) (hold_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greytype) (objectinroom ?v room_3) (agentinroom room_3) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6) (hold_8)))
 (:metric minimize (total-cost))
)
