(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 grey_door_1 - door
   grey_box_1 grey_box_2 - box
   yellow_ball_1 green_ball_2 green_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom grey_box_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom green_ball_1 room_2) (objectinroom purple_box_1 room_2) (objectinroom grey_box_2 room_3) (objectinroom yellow_box_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom green_ball_2 room_3) (objectcolor grey_box_1 greytype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor grey_box_2 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor green_ball_2 greentype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (objectcolor green_door_2 greentype) (objectcolor grey_door_1 greytype) (emptyhands) (locked green_door_1) (locked red_door_1) (locked green_door_2) (locked grey_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 green_door_2) (adjacentrooms room_2 room_4 green_door_2) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
