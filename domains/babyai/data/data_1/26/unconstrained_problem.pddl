(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 red_door_1 blue_door_1 grey_door_1 - door
   green_ball_1 blue_ball_1 blue_ball_3 grey_ball_1 blue_ball_2 - ball
   green_box_2 grey_box_1 green_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom blue_ball_1 room_1) (objectinroom green_box_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom blue_ball_2 room_3) (objectinroom green_box_2 room_3) (objectinroom grey_ball_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom blue_ball_3 room_3) (objectcolor blue_ball_1 bluetype) (objectcolor green_box_1 greentype) (objectcolor green_ball_1 greentype) (objectcolor blue_ball_2 bluetype) (objectcolor green_box_2 greentype) (objectcolor grey_ball_1 greytype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_3 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (emptyhands) (locked purple_door_1) (locked red_door_1) (locked blue_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greytype) (at_ ?v)))))
 (:metric minimize (total-cost))
)
