(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 purple_door_1 - door
   red_ball_1 purple_ball_1 grey_ball_1 - ball
   yellow_box_1 yellow_box_2 - box
 )
 (:init (agentinroom room_2) (objectinroom red_ball_1 room_1) (objectinroom grey_ball_1 room_2) (objectinroom red_ball_2 room_2) (objectinroom red_ball_3 room_2) (objectinroom red_ball_4 room_2) (objectinroom yellow_box_1 room_3) (objectinroom purple_ball_1 room_3) (objectinroom yellow_box_2 room_4) (objectcolor red_ball_1 redtype) (objectcolor grey_ball_1 greytype) (objectcolor red_ball_2 redtype) (objectcolor red_ball_3 redtype) (objectcolor red_ball_4 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_box_2 yellowtype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor grey_door_1 greytype) (emptyhands) (locked yellow_door_1) (locked purple_door_1) (locked red_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_2) (hold_0) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greytype) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
