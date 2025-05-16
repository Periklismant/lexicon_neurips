(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 red_door_1 yellow_door_1 green_door_1 - door
   green_box_1 grey_box_1 yellow_box_1 green_box_2 red_box_1 - box
   grey_ball_1 yellow_ball_1 green_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom yellow_ball_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom red_box_1 room_2) (objectinroom grey_box_1 room_2) (objectinroom green_box_1 room_3) (objectinroom green_box_2 room_3) (objectinroom yellow_box_1 room_4) (objectinroom grey_ball_1 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor red_box_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor green_box_1 greentype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked yellow_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (at_ ?v)))))
 (:metric minimize (total-cost))
)
