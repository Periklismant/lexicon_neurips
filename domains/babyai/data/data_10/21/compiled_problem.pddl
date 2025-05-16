(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_3 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 - door
   green_ball_2 - ball
   yellow_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom green_ball_1 room_2) (objectinroom purple_box_1 room_2) (objectinroom red_box_1 room_2) (objectinroom yellow_box_1 room_3) (objectinroom blue_ball_1 room_3) (objectinroom green_ball_2 room_4) (objectinroom grey_box_1 room_4) (objectinroom purple_box_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor red_box_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor green_ball_2 greentype) (objectcolor grey_box_1 greytype) (objectcolor purple_box_2 purpletype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (emptyhands) (locked red_door_1) (locked yellow_door_1) (locked blue_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_1) (hold_3) (hold_9) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greentype) (objectinroom ?v room_2) (agentinroom room_2) (at_ ?v))) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13)))
 (:metric minimize (total-cost))
)
