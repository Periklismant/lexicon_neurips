(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 purple_door_1 green_door_2 green_door_3 - door
   purple_ball_1 blue_ball_1 grey_ball_3 grey_ball_1 grey_ball_2 - ball
   blue_box_1 yellow_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom purple_ball_1 room_1) (objectinroom blue_box_1 room_1) (objectinroom yellow_box_1 room_2) (objectinroom grey_ball_1 room_2) (objectinroom grey_ball_2 room_2) (objectinroom purple_box_1 room_3) (objectinroom grey_ball_3 room_4) (objectinroom blue_ball_1 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor grey_ball_2 greytype) (objectcolor purple_box_1 purpletype) (objectcolor grey_ball_3 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_2 greentype) (objectcolor green_door_3 greentype) (emptyhands) (locked green_door_1) (locked purple_door_1) (locked green_door_2) (locked green_door_3) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 green_door_2) (adjacentrooms room_2 room_4 green_door_2) (adjacentrooms room_4 room_3 green_door_3) (adjacentrooms room_3 room_4 green_door_3) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
