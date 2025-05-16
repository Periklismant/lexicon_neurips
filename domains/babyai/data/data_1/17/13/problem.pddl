(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 grey_door_1 red_door_1 green_door_1 - door
   red_box_1 grey_box_2 grey_box_1 purple_box_1 blue_box_1 red_box_2 - box
   green_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom grey_ball_1 room_1) (objectinroom red_box_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom grey_box_1 room_2) (objectinroom red_box_2 room_2) (objectinroom blue_box_1 room_3) (objectinroom purple_box_1 room_3) (objectinroom grey_box_2 room_4) (objectcolor grey_ball_1 greytype) (objectcolor red_box_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor red_box_2 redtype) (objectcolor blue_box_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor grey_box_2 greytype) (objectcolor purple_door_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor red_door_1 redtype) (objectcolor green_door_1 greentype) (emptyhands) (locked purple_door_1) (locked grey_door_1) (locked red_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greytype) (at_ ?v)))))
 (:constraints (always (not (agentinroom room_4))))
 (:metric minimize (total-cost))
)
