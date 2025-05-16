(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 red_door_1 purple_door_2 yellow_door_1 - door
   green_ball_2 red_ball_1 yellow_ball_1 grey_ball_1 blue_ball_1 blue_ball_2 green_ball_1 - ball
   purple_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom blue_ball_1 room_1) (objectinroom purple_box_1 room_2) (objectinroom green_ball_1 room_3) (objectinroom green_ball_2 room_3) (objectinroom grey_ball_1 room_3) (objectinroom blue_ball_2 room_3) (objectinroom red_ball_1 room_4) (objectinroom yellow_ball_1 room_4) (objectcolor blue_ball_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor green_ball_1 greentype) (objectcolor green_ball_2 greentype) (objectcolor grey_ball_1 greytype) (objectcolor blue_ball_2 bluetype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor purple_door_2 purpletype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked purple_door_1) (locked red_door_1) (locked purple_door_2) (locked yellow_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:metric minimize (total-cost))
)
