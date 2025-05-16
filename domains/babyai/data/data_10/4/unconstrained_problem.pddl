(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 yellow_door_2 red_door_1 green_door_1 - door
   blue_ball_1 yellow_ball_1 green_ball_1 - ball
   blue_box_2 blue_box_3 purple_box_1 grey_box_1 blue_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom blue_box_1 room_1) (objectinroom blue_box_2 room_1) (objectinroom purple_box_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom blue_box_3 room_3) (objectinroom blue_ball_1 room_4) (objectinroom grey_box_1 room_4) (objectcolor blue_box_1 bluetype) (objectcolor blue_box_2 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor green_ball_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_3 bluetype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (objectcolor red_door_1 redtype) (objectcolor green_door_1 greentype) (emptyhands) (locked yellow_door_1) (locked yellow_door_2) (locked red_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 yellow_door_2) (adjacentrooms room_1 room_3 yellow_door_2) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v bluetype) (at_ ?v)))))
 (:metric minimize (total-cost))
)
