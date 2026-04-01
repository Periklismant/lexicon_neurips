(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 green_door_1 yellow_door_1 yellow_door_2 - door
   blue_box_2 blue_box_1 - box
   green_ball_2 green_ball_1 grey_ball_1 green_ball_3 red_ball_1 blue_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom red_ball_1 room_1) (objectinroom blue_ball_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom green_ball_2 room_2) (objectinroom green_ball_3 room_2) (objectinroom grey_ball_1 room_3) (objectinroom blue_box_1 room_4) (objectinroom blue_box_2 room_4) (objectcolor red_ball_1 redtype) (objectcolor blue_ball_1 bluetype) (objectcolor green_ball_1 greentype) (objectcolor green_ball_2 greentype) (objectcolor green_ball_3 greentype) (objectcolor grey_ball_1 greytype) (objectcolor blue_box_1 bluetype) (objectcolor blue_box_2 bluetype) (objectcolor red_door_1 redtype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked red_door_1) (locked green_door_1) (locked yellow_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (adjacentrooms room_2 room_1 ?d) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
