(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 green_door_1 blue_door_1 yellow_door_1 - door
   red_ball_2 blue_ball_1 green_ball_1 red_ball_1 red_ball_3 - ball
   purple_box_1 blue_box_2 yellow_box_1 red_box_1 blue_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom purple_box_1 room_1) (objectinroom blue_box_1 room_2) (objectinroom yellow_box_1 room_3) (objectinroom blue_box_2 room_3) (objectinroom blue_ball_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom red_ball_2 room_4) (objectinroom red_ball_3 room_4) (objectinroom red_box_1 room_4) (objectcolor purple_box_1 purpletype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_box_2 bluetype) (objectcolor blue_ball_1 bluetype) (objectcolor green_ball_1 greentype) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor red_ball_3 redtype) (objectcolor red_box_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked purple_door_1) (locked green_door_1) (locked blue_door_1) (locked yellow_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (at_ ?v)))))
 (:constraints (always (locked green_door_1)) (sometime (agentinroom room_1)) (sometime-after (agentinroom room_1) (objectinroom purple_box_1 room_3)))
 (:metric minimize (total-cost))
)
