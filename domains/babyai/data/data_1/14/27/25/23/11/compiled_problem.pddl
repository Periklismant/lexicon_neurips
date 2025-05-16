(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 yellow_door_1 green_door_1 - door
   red_box_1 green_box_1 - box
   blue_ball_1 yellow_ball_1 green_ball_1 red_ball_1 purple_ball_2 - ball
 )
 (:init (agentinroom room_3) (objectinroom yellow_ball_1 room_1) (objectinroom green_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom blue_ball_1 room_2) (objectinroom red_box_1 room_2) (objectinroom purple_ball_1 room_2) (objectinroom purple_ball_2 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor red_ball_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor purple_ball_1 purpletype) (objectcolor purple_ball_2 purpletype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor green_door_1 greentype) (emptyhands) (locked red_door_1) (locked yellow_door_1) (locked blue_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greentype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v))) (hold_0)))
 (:metric minimize (total-cost))
)
