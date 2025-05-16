(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_3 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_2 - door
   green_ball_1 red_ball_1 - ball
   purple_box_1 blue_box_1 blue_box_2 - box
 )
 (:init (agentinroom room_2) (objectinroom purple_box_1 room_1) (objectinroom blue_box_1 room_1) (objectinroom red_ball_1 room_2) (objectinroom purple_box_2 room_3) (objectinroom green_ball_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom blue_box_2 room_3) (objectinroom red_box_1 room_4) (objectcolor purple_box_1 purpletype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_1 redtype) (objectcolor purple_box_2 purpletype) (objectcolor green_ball_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor blue_box_2 bluetype) (objectcolor red_box_1 redtype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked red_door_2) (locked yellow_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 red_door_2) (adjacentrooms room_2 room_4 red_door_2) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_2) (hold_1) (hold_5) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (adjacentrooms room_1 room_3 ?d) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
