(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_2 green_door_1 red_door_1 - door
   purple_box_1 yellow_box_1 purple_box_2 grey_box_1 red_box_1 - box
   green_ball_1 blue_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom red_box_1 room_1) (objectinroom blue_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom purple_box_2 room_2) (objectinroom yellow_box_1 room_3) (objectinroom green_box_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom grey_box_1 room_4) (objectcolor red_box_1 redtype) (objectcolor blue_ball_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor purple_box_2 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor green_ball_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (emptyhands) (locked blue_door_1) (locked blue_door_2) (locked green_door_1) (locked red_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 blue_door_2) (adjacentrooms room_1 room_3 blue_door_2) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_1) (hold_0) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
