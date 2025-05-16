(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 green_door_1 purple_door_2 blue_door_1 - door
   blue_ball_1 green_ball_1 grey_ball_1 blue_ball_2 purple_ball_1 - ball
   grey_box_1 blue_box_1 green_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom grey_box_1 room_1) (objectinroom blue_ball_1 room_2) (objectinroom blue_ball_2 room_2) (objectinroom blue_box_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom green_box_1 room_3) (objectinroom purple_ball_1 room_4) (objectinroom grey_ball_1 room_4) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_ball_2 bluetype) (objectcolor blue_box_1 bluetype) (objectcolor green_ball_1 greentype) (objectcolor green_box_1 greentype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor purple_door_2 purpletype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked purple_door_1) (locked green_door_1) (locked purple_door_2) (locked blue_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (locked blue_door_1)) (sometime-after (locked blue_door_1) (not (emptyhands))))
 (:metric minimize (total-cost))
)
