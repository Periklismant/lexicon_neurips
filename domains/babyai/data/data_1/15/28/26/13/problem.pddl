(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 yellow_door_1 blue_door_2 purple_door_1 - door
   red_box_1 grey_box_1 yellow_box_1 red_box_2 - box
   blue_ball_1 green_ball_1 grey_ball_1 blue_ball_2 - ball
 )
 (:init (agentinroom room_2) (objectinroom green_ball_1 room_1) (objectinroom red_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom blue_ball_1 room_1) (objectinroom blue_ball_2 room_2) (objectinroom yellow_box_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom red_box_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor red_box_1 redtype) (objectcolor grey_ball_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_ball_2 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor red_box_2 redtype) (objectcolor blue_door_1 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_2 bluetype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked blue_door_1) (locked yellow_door_1) (locked blue_door_2) (locked purple_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 blue_door_2) (adjacentrooms room_2 room_4 blue_door_2) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (locked blue_door_1)) (sometime-after (locked blue_door_1) (or (agentinroom room_4) (agentinroom room_3))))
 (:metric minimize (total-cost))
)
