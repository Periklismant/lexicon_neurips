(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 red_door_1 yellow_door_1 yellow_door_2 - door
   grey_ball_1 blue_ball_1 grey_ball_2 purple_ball_1 - ball
   grey_box_1 purple_box_1 blue_box_1 yellow_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom grey_ball_1 room_1) (objectinroom blue_box_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom purple_box_1 room_3) (objectinroom purple_ball_1 room_4) (objectinroom grey_ball_2 room_4) (objectcolor grey_ball_1 greytype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_ball_2 greytype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked yellow_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_1 room_2 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (always (not (agentinroom room_2))))
 (:metric minimize (total-cost))
)
