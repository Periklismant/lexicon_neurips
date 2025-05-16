(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 room_3 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 purple_door_1 - door
   red_box_1 blue_box_1 - box
   blue_ball_3 blue_ball_1 blue_ball_2 - ball
 )
 (:init (agentinroom room_1) (objectinroom blue_ball_1 room_1) (objectinroom red_box_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom blue_ball_2 room_3) (objectinroom green_ball_2 room_3) (objectinroom blue_ball_3 room_3) (objectinroom blue_box_1 room_4) (objectcolor blue_ball_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_ball_2 bluetype) (objectcolor green_ball_2 greentype) (objectcolor blue_ball_3 bluetype) (objectcolor blue_box_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor grey_door_1 greytype) (emptyhands) (locked red_door_1) (locked green_door_1) (locked purple_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_1) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greytype) (adjacentrooms room_4 room_3 ?d) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
