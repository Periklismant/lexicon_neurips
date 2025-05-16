(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 purple_door_1 red_door_1 purple_door_2 - door
   yellow_box_1 grey_box_1 - box
   blue_ball_1 grey_ball_1 green_ball_1 red_ball_1 grey_ball_2 blue_ball_2 - ball
 )
 (:init (agentinroom room_1) (objectinroom green_ball_1 room_1) (objectinroom blue_ball_1 room_2) (objectinroom grey_ball_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom grey_ball_2 room_3) (objectinroom grey_box_1 room_3) (objectinroom blue_ball_2 room_4) (objectinroom yellow_box_1 room_4) (objectcolor green_ball_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_ball_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor grey_ball_2 greytype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_2 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor purple_door_2 purpletype) (emptyhands) (locked blue_door_1) (locked purple_door_1) (locked red_door_1) (locked purple_door_2) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 purple_door_2) (adjacentrooms room_3 room_4 purple_door_2) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
