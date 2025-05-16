(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 purple_door_1 green_door_2 yellow_door_1 - door
   purple_box_1 yellow_box_1 green_box_1 blue_box_1 yellow_box_2 - box
   green_ball_1 red_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom yellow_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom yellow_box_2 room_2) (objectinroom purple_box_1 room_2) (objectinroom green_box_1 room_2) (objectinroom green_ball_1 room_3) (objectinroom blue_box_1 room_4) (objectinroom red_ball_1 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor yellow_box_2 yellowtype) (objectcolor purple_box_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor green_ball_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_1 redtype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_2 greentype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked green_door_1) (locked purple_door_1) (locked green_door_2) (locked yellow_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 green_door_2) (adjacentrooms room_2 room_4 green_door_2) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greentype) (objectinroom ?v room_3) (agentinroom room_3) (at_ ?v)))))
 (:constraints (sometime (and (agentinroom room_1) (at_ yellow_box_1))))
 (:metric minimize (total-cost))
)
