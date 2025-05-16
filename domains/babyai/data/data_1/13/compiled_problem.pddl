(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 green_door_1 - door
   red_box_1 blue_box_2 yellow_box_1 green_box_1 - box
   blue_ball_1 yellow_ball_1 purple_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom purple_ball_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom blue_box_1 room_3) (objectinroom blue_ball_1 room_3) (objectinroom yellow_box_1 room_3) (objectinroom green_box_1 room_4) (objectinroom blue_box_2 room_4) (objectinroom red_box_1 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor blue_box_2 bluetype) (objectcolor red_box_1 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked yellow_door_1) (locked grey_door_1) (locked green_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_3) (hold_0) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
