(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 red_door_1 - door
   blue_ball_1 red_ball_1 green_ball_2 green_ball_1 purple_ball_1 - ball
   grey_box_1 red_box_1 red_box_2 - box
 )
 (:init (agentinroom room_2) (objectinroom green_ball_1 room_1) (objectinroom red_box_1 room_1) (objectinroom purple_ball_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom green_ball_2 room_3) (objectinroom red_ball_1 room_4) (objectinroom grey_box_1 room_4) (objectinroom red_box_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor red_box_1 redtype) (objectcolor purple_ball_1 purpletype) (objectcolor blue_ball_1 bluetype) (objectcolor green_ball_2 greentype) (objectcolor red_ball_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor red_box_2 redtype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor blue_door_2 bluetype) (objectcolor green_door_1 greentype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked blue_door_2) (locked green_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 blue_door_2) (adjacentrooms room_2 room_4 blue_door_2) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_4 room_2 ?d) (at_ ?d) (not (locked ?d)))) (hold_0)))
 (:metric minimize (total-cost))
)
