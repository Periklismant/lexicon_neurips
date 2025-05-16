(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_2 - door
   blue_ball_2 red_ball_1 purple_ball_1 - ball
   green_box_1 red_box_1 - box
 )
 (:init (agentinroom room_2) (objectinroom green_box_1 room_1) (objectinroom red_box_1 room_1) (objectinroom purple_ball_1 room_1) (objectinroom blue_ball_1 room_2) (objectinroom blue_ball_2 room_2) (objectinroom purple_ball_2 room_3) (objectinroom red_ball_1 room_3) (objectinroom red_box_2 room_4) (objectcolor green_box_1 greentype) (objectcolor red_box_1 redtype) (objectcolor purple_ball_1 purpletype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_ball_2 bluetype) (objectcolor purple_ball_2 purpletype) (objectcolor red_ball_1 redtype) (objectcolor red_box_2 redtype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_2 purpletype) (emptyhands) (locked purple_door_1) (locked blue_door_1) (locked grey_door_1) (locked purple_door_2) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 purple_door_2) (adjacentrooms room_3 room_4 purple_door_2) (visited room_2) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v purpletype) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
