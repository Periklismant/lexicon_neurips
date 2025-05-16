(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 green_door_1 yellow_door_2 - door
   yellow_ball_1 blue_ball_1 - ball
   purple_box_1 green_box_1 green_box_2 blue_box_1 purple_box_2 - box
 )
 (:init (agentinroom room_2) (objectinroom green_box_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom purple_box_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom green_box_2 room_3) (objectinroom yellow_ball_2 room_3) (objectinroom purple_box_2 room_4) (objectinroom blue_box_1 room_4) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor purple_box_1 purpletype) (objectcolor blue_ball_1 bluetype) (objectcolor green_box_2 greentype) (objectcolor yellow_ball_2 yellowtype) (objectcolor purple_box_2 purpletype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked yellow_door_1) (locked purple_door_1) (locked green_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v bluetype) (at_ ?v))) (hold_0)))
 (:metric minimize (total-cost))
)
