(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 blue_door_1 red_door_1 grey_door_1 - door
   grey_box_2 blue_box_1 - box
   blue_ball_2 - ball
 )
 (:init (agentinroom room_3) (objectinroom purple_box_1 room_1) (objectinroom green_box_1 room_2) (objectinroom grey_box_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom grey_box_2 room_3) (objectinroom blue_ball_2 room_3) (objectinroom blue_box_1 room_3) (objectinroom grey_box_3 room_4) (objectcolor purple_box_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_box_2 greytype) (objectcolor blue_ball_2 bluetype) (objectcolor blue_box_1 bluetype) (objectcolor grey_box_3 greytype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor grey_door_1 greytype) (emptyhands) (locked purple_door_1) (locked blue_door_1) (locked red_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v bluetype) (at_ ?v))) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
