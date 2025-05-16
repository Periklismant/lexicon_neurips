(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 - door
   yellow_ball_1 grey_ball_1 green_ball_1 - ball
   purple_box_1 purple_box_2 purple_box_3 green_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom purple_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom purple_box_2 room_3) (objectinroom green_box_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom purple_box_3 room_3) (objectcolor purple_ball_1 purpletype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor purple_box_2 purpletype) (objectcolor green_box_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor purple_box_3 purpletype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (emptyhands) (locked red_door_1) (locked red_door_2) (locked yellow_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 red_door_2) (adjacentrooms room_1 room_3 red_door_2) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (adjacentrooms room_2 room_1 ?d) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1) (hold_3)))
 (:metric minimize (total-cost))
)
