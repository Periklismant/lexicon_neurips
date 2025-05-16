(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 red_door_1 yellow_door_2 green_door_1 - door
   purple_box_1 yellow_box_1 - box
   yellow_ball_1 green_ball_2 purple_ball_1 grey_ball_1 purple_ball_2 green_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom purple_ball_1 room_1) (objectinroom purple_box_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom green_ball_2 room_2) (objectinroom grey_ball_1 room_3) (objectinroom purple_ball_2 room_3) (objectinroom yellow_box_1 room_4) (objectinroom yellow_ball_1 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor purple_box_1 purpletype) (objectcolor green_ball_1 greentype) (objectcolor green_ball_2 greentype) (objectcolor grey_ball_1 greytype) (objectcolor purple_ball_2 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor yellow_door_1 yellowtype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_2 yellowtype) (objectcolor green_door_1 greentype) (emptyhands) (locked yellow_door_1) (locked red_door_1) (locked yellow_door_2) (locked green_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 yellow_door_2) (adjacentrooms room_2 room_4 yellow_door_2) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v purpletype) (at_ ?v)))))
 (:metric minimize (total-cost))
)
