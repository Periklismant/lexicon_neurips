(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 grey_door_1 purple_door_2 - door
   green_box_2 purple_box_1 green_box_1 blue_box_1 - box
   yellow_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom purple_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom green_box_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom blue_box_1 room_3) (objectinroom green_box_2 room_3) (objectinroom yellow_box_2 room_4) (objectinroom green_ball_1 room_4) (objectcolor purple_box_1 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_2 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_2 purpletype) (emptyhands) (locked purple_door_1) (locked yellow_door_1) (locked grey_door_1) (locked purple_door_2) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 purple_door_2) (adjacentrooms room_3 room_4 purple_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v yellowtype) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
