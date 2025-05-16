(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 - door
   blue_box_1 yellow_box_2 - box
   red_ball_2 - ball
 )
 (:init (agentinroom room_4) (objectinroom blue_box_1 room_1) (objectinroom green_box_1 room_1) (objectinroom yellow_box_1 room_2) (objectinroom red_box_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom red_ball_2 room_3) (objectinroom yellow_box_2 room_4) (objectcolor blue_box_1 bluetype) (objectcolor green_box_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor red_box_1 redtype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor yellow_box_2 yellowtype) (objectcolor yellow_door_1 yellowtype) (objectcolor red_door_1 redtype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (emptyhands) (locked yellow_door_1) (locked red_door_1) (locked grey_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_4) (hold_1) (hold_11) (hold_12) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v redtype) (objectinroom ?v room_2) (agentinroom room_2) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_5) (hold_6) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14)))
 (:metric minimize (total-cost))
)
