(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 green_door_1 yellow_door_1 blue_door_1 - door
   grey_box_1 green_box_1 purple_box_2 yellow_box_1 purple_box_1 - box
   purple_ball_1 red_ball_1 red_ball_2 - ball
 )
 (:init (agentinroom room_3) (objectinroom purple_ball_1 room_1) (objectinroom purple_box_1 room_2) (objectinroom red_ball_1 room_2) (objectinroom purple_box_2 room_2) (objectinroom green_box_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom red_ball_2 room_4) (objectinroom yellow_box_1 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor purple_box_2 purpletype) (objectcolor green_box_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor red_ball_2 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked grey_door_1) (locked green_door_1) (locked yellow_door_1) (locked blue_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v yellowtype) (at_ ?v)))))
 (:metric minimize (total-cost))
)
