(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 blue_door_1 green_door_1 - door
   blue_ball_1 green_ball_1 - ball
   grey_box_1 yellow_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom green_box_1 room_1) (objectinroom grey_box_1 room_1) (objectinroom blue_ball_1 room_2) (objectinroom blue_ball_2 room_2) (objectinroom yellow_box_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom purple_box_1 room_4) (objectinroom red_ball_1 room_4) (objectcolor green_box_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_ball_2 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor green_door_1 greentype) (emptyhands) (locked purple_door_1) (locked grey_door_1) (locked blue_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greytype) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8)))
 (:metric minimize (total-cost))
)
