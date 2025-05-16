(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 purple_door_1 blue_door_1 grey_door_2 - door
   red_box_1 blue_box_2 blue_box_1 green_box_1 - box
   green_ball_1 red_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom red_ball_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom blue_box_1 room_2) (objectinroom red_box_1 room_2) (objectinroom blue_box_2 room_3) (objectinroom grey_box_1 room_3) (objectinroom green_box_1 room_4) (objectinroom grey_ball_1 room_4) (objectcolor red_ball_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor blue_box_2 bluetype) (objectcolor grey_box_1 greytype) (objectcolor green_box_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_2 greytype) (emptyhands) (locked grey_door_1) (locked purple_door_1) (locked blue_door_1) (locked grey_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 grey_door_2) (adjacentrooms room_3 room_4 grey_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (carrying ?v))) (hold_0)))
 (:metric minimize (total-cost))
)
