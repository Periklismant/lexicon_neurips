(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 purple_door_1 red_door_2 - door
   yellow_ball_1 red_ball_2 purple_ball_1 - ball
   yellow_box_1 grey_box_1 blue_box_2 - box
 )
 (:init (agentinroom room_2) (objectinroom grey_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom blue_box_1 room_3) (objectinroom red_ball_2 room_3) (objectinroom purple_ball_1 room_4) (objectinroom blue_box_2 room_4) (objectinroom yellow_box_1 room_4) (objectcolor grey_box_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_2 redtype) (objectcolor purple_ball_1 purpletype) (objectcolor blue_box_2 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor red_door_1 redtype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_2 redtype) (emptyhands) (locked red_door_1) (locked green_door_1) (locked purple_door_1) (locked red_door_2) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 red_door_2) (adjacentrooms room_3 room_4 red_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (adjacentrooms room_3 room_1 ?d) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1) (hold_3)))
 (:metric minimize (total-cost))
)
