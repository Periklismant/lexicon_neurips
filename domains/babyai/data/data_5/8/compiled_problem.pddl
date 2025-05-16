(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_2 - door
   red_box_1 green_box_1 grey_box_1 blue_box_1 - box
   green_ball_1 grey_ball_1 grey_ball_2 red_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom grey_ball_1 room_2) (objectinroom green_box_1 room_3) (objectinroom blue_box_1 room_3) (objectinroom red_box_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom grey_box_1 room_4) (objectinroom red_ball_1 room_4) (objectinroom grey_ball_2 room_4) (objectcolor grey_ball_1 greytype) (objectcolor green_box_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor grey_ball_2 greytype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor purple_door_2 purpletype) (objectcolor grey_door_1 greytype) (emptyhands) (locked purple_door_1) (locked green_door_1) (locked purple_door_2) (locked grey_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v bluetype) (at_ ?v))) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
