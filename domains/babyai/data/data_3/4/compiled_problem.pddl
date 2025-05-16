(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 blue_door_1 - door
   purple_ball_3 purple_ball_1 purple_ball_2 yellow_ball_2 - ball
   yellow_box_1 green_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom yellow_ball_1 room_1) (objectinroom yellow_ball_2 room_1) (objectinroom purple_ball_1 room_1) (objectinroom yellow_box_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom purple_ball_2 room_4) (objectinroom green_box_1 room_4) (objectinroom purple_ball_3 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor yellow_ball_2 yellowtype) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor purple_ball_2 purpletype) (objectcolor green_box_1 greentype) (objectcolor purple_ball_3 purpletype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked purple_door_1) (locked blue_door_1) (locked green_door_1) (locked yellow_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v purpletype) (carrying ?v))) (hold_0) (hold_1) (hold_3)))
 (:metric minimize (total-cost))
)
