(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 yellow_door_1 grey_door_1 green_door_2 - door
   purple_ball_2 grey_ball_2 grey_ball_1 red_ball_1 purple_ball_1 - ball
   purple_box_1 blue_box_1 yellow_box_1 - box
 )
 (:init (agentinroom room_3) (objectinroom yellow_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom purple_box_1 room_3) (objectinroom grey_ball_2 room_3) (objectinroom purple_ball_1 room_3) (objectinroom purple_ball_2 room_4) (objectinroom blue_box_1 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor purple_box_1 purpletype) (objectcolor grey_ball_2 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor purple_ball_2 purpletype) (objectcolor blue_box_1 bluetype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor green_door_2 greentype) (emptyhands) (locked green_door_1) (locked yellow_door_1) (locked grey_door_1) (locked green_door_2) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 green_door_2) (adjacentrooms room_3 room_4 green_door_2) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v)))))
 (:metric minimize (total-cost))
)
