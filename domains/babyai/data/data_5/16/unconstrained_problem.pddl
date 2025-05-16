(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 green_door_1 blue_door_1 blue_door_2 - door
   blue_box_2 yellow_box_1 grey_box_1 blue_box_1 yellow_box_2 - box
   yellow_ball_1 purple_ball_1 purple_ball_2 - ball
 )
 (:init (agentinroom room_4) (objectinroom yellow_ball_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom grey_box_1 room_1) (objectinroom blue_box_1 room_1) (objectinroom purple_ball_1 room_2) (objectinroom yellow_box_2 room_2) (objectinroom blue_box_2 room_2) (objectinroom purple_ball_2 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor blue_box_1 bluetype) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_box_2 yellowtype) (objectcolor blue_box_2 bluetype) (objectcolor purple_ball_2 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (emptyhands) (locked yellow_door_1) (locked green_door_1) (locked blue_door_1) (locked blue_door_2) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 blue_door_2) (adjacentrooms room_3 room_4 blue_door_2) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
