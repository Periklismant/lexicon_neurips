(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_2 - door
   green_box_1 blue_box_1 - box
   grey_ball_2 grey_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom grey_ball_1 room_1) (objectinroom green_box_1 room_1) (objectinroom red_box_1 room_2) (objectinroom grey_ball_2 room_2) (objectinroom blue_box_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom green_box_2 room_3) (objectinroom yellow_box_1 room_4) (objectcolor grey_ball_1 greytype) (objectcolor green_box_1 greentype) (objectcolor red_box_1 redtype) (objectcolor grey_ball_2 greytype) (objectcolor blue_box_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor grey_door_2 greytype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (emptyhands) (locked grey_door_1) (locked grey_door_2) (locked green_door_1) (locked red_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 grey_door_2) (adjacentrooms room_1 room_3 grey_door_2) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_4) (hold_0) (hold_3) (hold_11) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greytype) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6) (hold_8) (hold_10) (hold_11) (hold_12)))
 (:metric minimize (total-cost))
)
