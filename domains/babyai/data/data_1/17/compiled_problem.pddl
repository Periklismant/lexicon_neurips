(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 grey_door_2 red_door_2 - door
   purple_ball_1 grey_ball_1 green_ball_1 grey_ball_2 - ball
   yellow_box_1 green_box_1 green_box_2 - box
 )
 (:init (agentinroom room_4) (objectinroom green_box_1 room_1) (objectinroom green_box_2 room_1) (objectinroom green_ball_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom grey_ball_1 room_2) (objectinroom grey_ball_2 room_3) (objectinroom blue_ball_1 room_3) (objectinroom purple_ball_1 room_3) (objectcolor green_box_1 greentype) (objectcolor green_box_2 greentype) (objectcolor green_ball_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor grey_ball_2 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor grey_door_2 greytype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (emptyhands) (locked grey_door_1) (locked grey_door_2) (locked red_door_1) (locked red_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 grey_door_2) (adjacentrooms room_1 room_3 grey_door_2) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 red_door_2) (adjacentrooms room_3 room_4 red_door_2) (visited room_4) (hold_0) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
