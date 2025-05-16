(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 green_door_1 purple_door_1 red_door_1 - door
   red_box_1 blue_box_2 purple_box_2 purple_box_1 yellow_box_1 blue_box_1 - box
   purple_ball_2 purple_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom blue_box_1 room_1) (objectinroom purple_box_1 room_2) (objectinroom purple_ball_1 room_2) (objectinroom purple_ball_2 room_2) (objectinroom blue_box_2 room_3) (objectinroom purple_box_2 room_3) (objectinroom red_box_1 room_4) (objectinroom yellow_box_1 room_4) (objectcolor blue_box_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor purple_ball_1 purpletype) (objectcolor purple_ball_2 purpletype) (objectcolor blue_box_2 bluetype) (objectcolor purple_box_2 purpletype) (objectcolor red_box_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (emptyhands) (locked blue_door_1) (locked green_door_1) (locked purple_door_1) (locked red_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v bluetype) (carrying ?v)))))
 (:metric minimize (total-cost))
)
