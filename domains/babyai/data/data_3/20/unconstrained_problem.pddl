(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 yellow_door_1 purple_door_1 red_door_1 - door
   yellow_ball_1 grey_ball_1 red_ball_1 blue_ball_1 - ball
   green_box_1 grey_box_1 green_box_2 red_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom red_box_1 room_1) (objectinroom green_box_1 room_1) (objectinroom grey_box_1 room_2) (objectinroom red_ball_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom green_box_2 room_4) (objectinroom yellow_ball_1 room_4) (objectinroom grey_ball_1 room_4) (objectcolor red_box_1 redtype) (objectcolor green_box_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor blue_ball_1 bluetype) (objectcolor green_box_2 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor grey_door_1 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (emptyhands) (locked grey_door_1) (locked yellow_door_1) (locked purple_door_1) (locked red_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (at_ ?v)))))
 (:metric minimize (total-cost))
)
