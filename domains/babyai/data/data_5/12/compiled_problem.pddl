(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 - door
   grey_ball_2 blue_ball_1 grey_ball_1 blue_ball_2 - ball
   yellow_box_1 grey_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom green_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom grey_ball_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom blue_ball_2 room_3) (objectinroom grey_ball_2 room_3) (objectinroom grey_box_1 room_3) (objectinroom green_box_2 room_4) (objectcolor green_box_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_ball_2 bluetype) (objectcolor grey_ball_2 greytype) (objectcolor grey_box_1 greytype) (objectcolor green_box_2 greentype) (objectcolor purple_door_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor red_door_1 redtype) (objectcolor purple_door_2 purpletype) (emptyhands) (locked purple_door_1) (locked yellow_door_1) (locked red_door_1) (locked purple_door_2) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 purple_door_2) (adjacentrooms room_3 room_4 purple_door_2) (visited room_4) (hold_0) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_8)))
 (:metric minimize (total-cost))
)
