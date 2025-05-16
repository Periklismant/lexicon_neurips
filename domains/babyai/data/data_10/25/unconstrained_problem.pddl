(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 yellow_door_1 yellow_door_2 purple_door_1 - door
   grey_ball_1 purple_ball_1 red_ball_1 red_ball_2 - ball
   green_box_2 green_box_1 yellow_box_1 blue_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom red_ball_1 room_1) (objectinroom red_ball_2 room_1) (objectinroom green_box_1 room_1) (objectinroom green_box_2 room_2) (objectinroom yellow_box_1 room_2) (objectinroom blue_box_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom purple_ball_1 room_4) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor green_box_1 greentype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor grey_ball_1 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked green_door_1) (locked yellow_door_1) (locked yellow_door_2) (locked purple_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 yellow_door_2) (adjacentrooms room_2 room_4 yellow_door_2) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v)))))
 (:metric minimize (total-cost))
)
