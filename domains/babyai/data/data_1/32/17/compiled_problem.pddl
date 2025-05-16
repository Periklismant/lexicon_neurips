(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 green_door_1 purple_door_2 - door
   grey_ball_1 blue_ball_1 grey_ball_2 purple_ball_1 - ball
   grey_box_1 purple_box_1 yellow_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom grey_ball_1 room_1) (objectinroom grey_box_1 room_1) (objectinroom purple_ball_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom grey_ball_2 room_2) (objectinroom blue_ball_1 room_3) (objectinroom purple_box_1 room_4) (objectinroom yellow_box_2 room_4) (objectcolor grey_ball_1 greytype) (objectcolor grey_box_1 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_2 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_box_2 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor purple_door_2 purpletype) (objectcolor grey_door_1 greytype) (emptyhands) (locked purple_door_1) (locked green_door_1) (locked purple_door_2) (locked grey_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (at_ ?v))) (hold_0)))
 (:metric minimize (total-cost))
)
