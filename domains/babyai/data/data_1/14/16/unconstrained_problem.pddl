(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 blue_door_1 purple_door_2 purple_door_3 - door
   red_box_1 purple_box_1 yellow_box_1 green_box_1 green_box_2 - box
   yellow_ball_1 yellow_ball_2 red_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom red_box_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom green_box_1 room_1) (objectinroom green_box_2 room_1) (objectinroom yellow_box_1 room_1) (objectinroom red_ball_1 room_2) (objectinroom yellow_ball_2 room_3) (objectinroom purple_box_1 room_4) (objectcolor red_box_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_2 yellowtype) (objectcolor purple_box_1 purpletype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor purple_door_2 purpletype) (objectcolor purple_door_3 purpletype) (emptyhands) (locked purple_door_1) (locked blue_door_1) (locked purple_door_2) (locked purple_door_3) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 purple_door_3) (adjacentrooms room_3 room_4 purple_door_3) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_3 room_1 ?d) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
