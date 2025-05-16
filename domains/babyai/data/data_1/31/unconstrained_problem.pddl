(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 blue_door_1 blue_door_2 yellow_door_1 - door
   blue_box_1 purple_box_1 yellow_box_1 - box
   blue_ball_3 red_ball_1 blue_ball_1 grey_ball_1 blue_ball_2 - ball
 )
 (:init (agentinroom room_2) (objectinroom blue_ball_1 room_1) (objectinroom blue_ball_2 room_2) (objectinroom red_ball_1 room_2) (objectinroom yellow_box_1 room_3) (objectinroom blue_box_1 room_3) (objectinroom blue_ball_3 room_3) (objectinroom purple_box_1 room_4) (objectinroom grey_ball_1 room_4) (objectcolor blue_ball_1 bluetype) (objectcolor blue_ball_2 bluetype) (objectcolor red_ball_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor blue_ball_3 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked purple_door_1) (locked blue_door_1) (locked blue_door_2) (locked yellow_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 blue_door_2) (adjacentrooms room_2 room_4 blue_door_2) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
