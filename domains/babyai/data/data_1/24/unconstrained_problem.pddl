(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 purple_door_1 purple_door_2 yellow_door_1 - door
   yellow_ball_1 blue_ball_1 yellow_ball_2 blue_ball_2 - ball
   red_box_1 grey_box_1 green_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom purple_box_1 room_1) (objectinroom grey_box_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom yellow_ball_1 room_3) (objectinroom blue_ball_2 room_3) (objectinroom green_box_1 room_3) (objectinroom yellow_ball_2 room_4) (objectinroom red_box_1 room_4) (objectcolor purple_box_1 purpletype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_ball_2 bluetype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_2 yellowtype) (objectcolor red_box_1 redtype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor purple_door_2 purpletype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked red_door_1) (locked purple_door_1) (locked purple_door_2) (locked yellow_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (objectinroom ?v room_3) (agentinroom room_3) (at_ ?v)))))
 (:metric minimize (total-cost))
)
