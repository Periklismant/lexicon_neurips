(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 grey_door_1 yellow_door_1 - door
   purple_box_1 yellow_box_1 red_box_2 purple_box_2 - box
   purple_ball_1 blue_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom red_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom purple_ball_1 room_3) (objectinroom red_box_2 room_3) (objectinroom yellow_box_1 room_3) (objectinroom purple_box_2 room_4) (objectinroom blue_ball_1 room_4) (objectcolor red_box_1 redtype) (objectcolor grey_ball_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor purple_ball_1 purpletype) (objectcolor red_box_2 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor purple_box_2 purpletype) (objectcolor blue_ball_1 bluetype) (objectcolor green_door_1 greentype) (objectcolor grey_door_1 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked green_door_1) (locked grey_door_1) (locked yellow_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_4) (hold_2) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v redtype) (agentinroom room_3) (objectinroom ?v room_3) (emptyhands) (at_ ?v))) (hold_0) (hold_2) (hold_3)))
 (:metric minimize (total-cost))
)
