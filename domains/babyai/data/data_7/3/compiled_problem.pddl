(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_3 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 - door
   green_box_2 purple_box_1 grey_box_1 blue_box_2 blue_box_1 yellow_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom green_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom blue_box_1 room_2) (objectinroom grey_ball_1 room_2) (objectinroom green_box_2 room_3) (objectinroom purple_box_1 room_3) (objectinroom grey_box_1 room_4) (objectinroom blue_box_2 room_4) (objectcolor green_box_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor grey_ball_1 greytype) (objectcolor green_box_2 greentype) (objectcolor purple_box_1 purpletype) (objectcolor grey_box_1 greytype) (objectcolor blue_box_2 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor blue_door_1 bluetype) (objectcolor green_door_1 greentype) (emptyhands) (locked purple_door_1) (locked red_door_1) (locked blue_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_4) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (carrying ?v) (agentinroom room_2))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_8)))
 (:metric minimize (total-cost))
)
