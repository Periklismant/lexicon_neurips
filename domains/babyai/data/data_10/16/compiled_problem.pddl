(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 - door
   yellow_ball_1 blue_ball_1 - ball
   red_box_1 purple_box_2 blue_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom blue_box_1 room_1) (objectinroom red_box_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom purple_ball_1 room_3) (objectinroom blue_ball_1 room_3) (objectinroom yellow_ball_1 room_3) (objectinroom green_ball_1 room_4) (objectinroom purple_box_2 room_4) (objectcolor blue_box_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor purple_box_1 purpletype) (objectcolor purple_ball_1 purpletype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor purple_box_2 purpletype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (emptyhands) (locked purple_door_1) (locked green_door_1) (locked yellow_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_4) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greytype) (adjacentrooms room_3 room_4 ?d) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
