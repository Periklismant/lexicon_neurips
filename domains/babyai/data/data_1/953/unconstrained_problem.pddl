(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 purple_door_2 red_door_1 yellow_door_1 - door
   green_box_2 grey_box_1 green_box_3 purple_box_1 green_box_1 yellow_box_1 - box
   red_ball_1 yellow_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom yellow_ball_1 room_1) (objectinroom green_box_1 room_1) (objectinroom green_box_2 room_2) (objectinroom green_box_3 room_2) (objectinroom red_ball_1 room_2) (objectinroom yellow_box_1 room_3) (objectinroom grey_box_1 room_4) (objectinroom purple_box_1 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor green_box_2 greentype) (objectcolor green_box_3 greentype) (objectcolor red_ball_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor purple_door_1 purpletype) (objectcolor purple_door_2 purpletype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked purple_door_1) (locked purple_door_2) (locked red_door_1) (locked yellow_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 purple_door_2) (adjacentrooms room_1 room_3 purple_door_2) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (at_ ?v)))))
 (:metric minimize (total-cost))
)
