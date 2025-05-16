(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 purple_door_1 yellow_door_1 blue_door_1 - door
   yellow_ball_1 green_ball_2 green_ball_1 red_ball_1 yellow_ball_2 - ball
   purple_box_2 green_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom green_ball_1 room_2) (objectinroom red_ball_1 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom green_ball_2 room_3) (objectinroom yellow_ball_2 room_3) (objectinroom purple_box_1 room_3) (objectinroom green_box_1 room_3) (objectinroom purple_box_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_2 greentype) (objectcolor yellow_ball_2 yellowtype) (objectcolor purple_box_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor purple_box_2 purpletype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked green_door_1) (locked purple_door_1) (locked yellow_door_1) (locked blue_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
