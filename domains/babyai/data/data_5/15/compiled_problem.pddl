(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 yellow_door_2 - door
   yellow_box_1 grey_box_1 - box
   grey_ball_2 grey_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom blue_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom blue_ball_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom purple_box_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom grey_ball_2 room_4) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_1 redtype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor grey_ball_2 greytype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked green_door_1) (locked yellow_door_1) (locked grey_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_2) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
