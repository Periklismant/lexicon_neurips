(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 green_door_2 - door
   grey_box_1 green_box_1 - box
   green_ball_1 yellow_ball_1 grey_ball_1 red_ball_1 red_ball_2 purple_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom red_ball_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom grey_box_1 room_2) (objectinroom purple_ball_1 room_2) (objectinroom red_ball_2 room_2) (objectinroom green_box_1 room_2) (objectinroom green_ball_1 room_4) (objectinroom grey_ball_1 room_4) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor red_ball_2 redtype) (objectcolor green_box_1 greentype) (objectcolor green_ball_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor green_door_1 greentype) (objectcolor green_door_2 greentype) (objectcolor green_door_3 greentype) (objectcolor red_door_1 redtype) (emptyhands) (locked green_door_1) (locked green_door_2) (locked green_door_3) (locked red_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 green_door_2) (adjacentrooms room_1 room_3 green_door_2) (adjacentrooms room_4 room_2 green_door_3) (adjacentrooms room_2 room_4 green_door_3) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (at_ ?v))) (hold_0)))
 (:metric minimize (total-cost))
)
