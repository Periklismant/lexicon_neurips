(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 - door
   grey_ball_1 - ball
   yellow_box_1 blue_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom yellow_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom red_box_1 room_2) (objectinroom yellow_box_2 room_2) (objectinroom yellow_box_3 room_3) (objectinroom grey_box_1 room_4) (objectinroom blue_box_1 room_4) (objectinroom red_ball_1 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor red_box_1 redtype) (objectcolor yellow_box_2 yellowtype) (objectcolor yellow_box_3 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_1 redtype) (objectcolor red_door_1 redtype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_2 redtype) (objectcolor red_door_3 redtype) (emptyhands) (locked red_door_1) (locked blue_door_1) (locked red_door_2) (locked red_door_3) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 red_door_2) (adjacentrooms room_2 room_4 red_door_2) (adjacentrooms room_4 room_3 red_door_3) (adjacentrooms room_3 room_4 red_door_3) (visited room_4) (hold_0) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v yellowtype) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10)))
 (:metric minimize (total-cost))
)
