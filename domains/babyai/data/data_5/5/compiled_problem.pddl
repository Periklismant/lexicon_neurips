(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 red_door_1 - door
   red_box_1 yellow_box_1 red_box_2 grey_box_1 - box
   green_ball_1 blue_ball_1 blue_ball_2 yellow_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom red_box_1 room_1) (objectinroom grey_box_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom yellow_ball_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom red_box_2 room_4) (objectinroom blue_ball_2 room_4) (objectinroom green_ball_1 room_4) (objectcolor red_box_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor red_box_2 redtype) (objectcolor blue_ball_2 bluetype) (objectcolor green_ball_1 greentype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked green_door_1) (locked yellow_door_1) (locked red_door_1) (locked purple_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (adjacentrooms room_3 room_1 ?d) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1) (hold_3)))
 (:metric minimize (total-cost))
)
