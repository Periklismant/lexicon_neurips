(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 grey_door_1 green_door_1 purple_door_1 - door
   yellow_ball_1 blue_ball_1 green_ball_1 red_ball_1 yellow_ball_2 - ball
   yellow_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_3) (objectinroom red_ball_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom yellow_ball_2 room_2) (objectinroom blue_ball_1 room_2) (objectinroom yellow_box_1 room_3) (objectinroom green_ball_2 room_4) (objectcolor red_ball_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_ball_1 yellowtype) (objectcolor yellow_ball_2 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_ball_2 greentype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked blue_door_1) (locked grey_door_1) (locked green_door_1) (locked purple_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greentype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v))) (hold_0)))
 (:metric minimize (total-cost))
)
