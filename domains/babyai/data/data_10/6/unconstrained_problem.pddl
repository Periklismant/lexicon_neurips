(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 red_door_1 purple_door_1 green_door_1 - door
   blue_ball_1 yellow_ball_1 red_ball_1 green_ball_1 - ball
   green_box_1 grey_box_1 red_box_2 red_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom red_ball_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom green_ball_1 room_2) (objectinroom grey_box_1 room_2) (objectinroom green_box_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom red_box_1 room_3) (objectinroom red_box_2 room_4) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor green_box_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor red_box_2 redtype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked purple_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
