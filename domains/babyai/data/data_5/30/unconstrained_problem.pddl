(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 red_door_1 purple_door_1 blue_door_2 - door
   yellow_ball_1 grey_ball_2 grey_ball_3 grey_ball_1 green_ball_1 - ball
   red_box_1 yellow_box_1 green_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom red_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom grey_ball_1 room_2) (objectinroom grey_ball_2 room_2) (objectinroom grey_ball_3 room_3) (objectinroom green_box_1 room_4) (objectinroom yellow_ball_1 room_4) (objectinroom green_ball_1 room_4) (objectcolor red_box_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor grey_ball_2 greytype) (objectcolor grey_ball_3 greytype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_2 bluetype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked purple_door_1) (locked blue_door_2) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 blue_door_2) (adjacentrooms room_3 room_4 blue_door_2) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (objectinroom ?v room_2) (agentinroom room_2) (at_ ?v)))))
 (:metric minimize (total-cost))
)
