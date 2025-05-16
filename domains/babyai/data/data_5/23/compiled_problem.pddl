(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_1 room_3 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 - door
   yellow_ball_2 - ball
   yellow_box_3 red_box_1 yellow_box_1 grey_box_1 yellow_box_2 - box
 )
 (:init (agentinroom room_4) (objectinroom yellow_box_1 room_1) (objectinroom grey_box_1 room_2) (objectinroom yellow_box_2 room_2) (objectinroom yellow_box_3 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom red_box_1 room_4) (objectinroom yellow_ball_2 room_4) (objectinroom green_ball_1 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor yellow_box_2 yellowtype) (objectcolor yellow_box_3 yellowtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor red_box_1 redtype) (objectcolor yellow_ball_2 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (emptyhands) (locked red_door_1) (locked red_door_2) (locked blue_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 red_door_2) (adjacentrooms room_1 room_3 red_door_2) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_4) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v yellowtype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v))) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
