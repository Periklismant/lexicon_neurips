(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 green_door_2 blue_door_1 red_door_1 - door
   red_ball_2 yellow_ball_1 yellow_ball_3 yellow_ball_2 red_ball_1 green_ball_1 purple_ball_1 - ball
   yellow_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom yellow_ball_1 room_1) (objectinroom red_ball_1 room_2) (objectinroom purple_ball_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom yellow_ball_2 room_3) (objectinroom red_ball_2 room_4) (objectinroom yellow_ball_3 room_4) (objectinroom yellow_box_1 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor red_ball_1 redtype) (objectcolor purple_ball_1 purpletype) (objectcolor green_ball_1 greentype) (objectcolor yellow_ball_2 yellowtype) (objectcolor red_ball_2 redtype) (objectcolor yellow_ball_3 yellowtype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor green_door_2 greentype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (emptyhands) (locked green_door_1) (locked green_door_2) (locked blue_door_1) (locked red_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 green_door_2) (adjacentrooms room_1 room_3 green_door_2) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v yellowtype) (objectinroom ?v room_3) (agentinroom room_3) (at_ ?v)))))
 (:constraints (sometime (not (locked green_door_2))))
 (:metric minimize (total-cost))
)
