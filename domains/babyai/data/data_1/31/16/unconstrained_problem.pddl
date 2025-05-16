(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 green_door_2 purple_door_1 purple_door_2 - door
   blue_ball_1 red_ball_2 red_ball_1 blue_ball_2 purple_ball_1 - ball
   purple_box_1 red_box_1 red_box_2 - box
 )
 (:init (agentinroom room_3) (objectinroom red_ball_1 room_1) (objectinroom red_box_1 room_1) (objectinroom blue_ball_1 room_1) (objectinroom purple_ball_1 room_2) (objectinroom red_box_2 room_2) (objectinroom purple_box_1 room_3) (objectinroom blue_ball_2 room_3) (objectinroom red_ball_2 room_4) (objectcolor red_ball_1 redtype) (objectcolor red_box_1 redtype) (objectcolor blue_ball_1 bluetype) (objectcolor purple_ball_1 purpletype) (objectcolor red_box_2 redtype) (objectcolor purple_box_1 purpletype) (objectcolor blue_ball_2 bluetype) (objectcolor red_ball_2 redtype) (objectcolor green_door_1 greentype) (objectcolor green_door_2 greentype) (objectcolor purple_door_1 purpletype) (objectcolor purple_door_2 purpletype) (emptyhands) (locked green_door_1) (locked green_door_2) (locked purple_door_1) (locked purple_door_2) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 green_door_2) (adjacentrooms room_1 room_3 green_door_2) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 purple_door_2) (adjacentrooms room_3 room_4 purple_door_2) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v)))))
 (:metric minimize (total-cost))
)
