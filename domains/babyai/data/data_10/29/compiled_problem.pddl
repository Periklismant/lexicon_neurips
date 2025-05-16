(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_box_2 red_box_1 grey_box_1 - box
   red_ball_2 blue_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom red_ball_1 room_1) (objectinroom red_ball_2 room_1) (objectinroom grey_box_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom red_box_1 room_3) (objectinroom grey_box_2 room_3) (objectinroom purple_ball_1 room_4) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor grey_box_1 greytype) (objectcolor green_ball_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor grey_box_2 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked grey_door_1) (locked red_door_1) (locked red_door_2) (locked purple_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 red_door_2) (adjacentrooms room_2 room_4 red_door_2) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_4) (hold_6) (hold_9) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v))) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_9) (hold_10) (hold_11) (hold_12)))
 (:metric minimize (total-cost))
)
