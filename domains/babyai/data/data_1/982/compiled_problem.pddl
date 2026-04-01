(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 yellow_door_1 green_door_1 - door
   red_box_1 green_box_1 blue_box_1 - box
   green_ball_2 yellow_ball_2 green_ball_1 yellow_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom red_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom blue_box_1 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom green_box_1 room_3) (objectinroom yellow_ball_2 room_4) (objectinroom green_ball_2 room_4) (objectcolor red_box_1 redtype) (objectcolor grey_ball_1 greytype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_2 yellowtype) (objectcolor green_ball_2 greentype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (emptyhands) (locked grey_door_1) (locked purple_door_1) (locked yellow_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (at_ ?d) (not (locked ?d)))) (hold_0)))
 (:metric minimize (total-cost))
)
