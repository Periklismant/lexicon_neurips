(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 blue_door_2 yellow_door_1 purple_door_1 - door
   yellow_ball_1 red_ball_2 green_ball_1 red_ball_1 - ball
   blue_box_1 red_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_2) (objectinroom red_box_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom purple_ball_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom red_ball_1 room_3) (objectinroom blue_box_1 room_3) (objectinroom red_ball_2 room_4) (objectinroom purple_box_1 room_4) (objectcolor red_box_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor purple_ball_1 purpletype) (objectcolor green_ball_1 greentype) (objectcolor red_ball_1 redtype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_2 redtype) (objectcolor purple_box_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked blue_door_1) (locked blue_door_2) (locked yellow_door_1) (locked purple_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 blue_door_2) (adjacentrooms room_1 room_3 blue_door_2) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_2 room_1 ?d) (at_ ?d) (not (locked ?d)))) (hold_0)))
 (:metric minimize (total-cost))
)
