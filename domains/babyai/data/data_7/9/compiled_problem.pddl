(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_3 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 - door
   green_box_2 grey_box_1 - box
   blue_ball_2 - ball
 )
 (:init (agentinroom room_2) (objectinroom yellow_box_1 room_1) (objectinroom green_box_1 room_2) (objectinroom yellow_ball_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom blue_ball_2 room_3) (objectinroom green_box_2 room_4) (objectinroom yellow_box_2 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_2 bluetype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_2 yellowtype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked green_door_1) (locked red_door_1) (locked purple_door_1) (locked blue_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_2) (hold_3) (hold_9) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greytype) (objectinroom ?v room_3) (agentinroom room_3) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_7) (hold_9) (hold_10)))
 (:metric minimize (total-cost))
)
