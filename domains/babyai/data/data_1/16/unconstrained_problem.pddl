(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 purple_door_1 purple_door_2 blue_door_1 - door
   yellow_ball_1 blue_ball_1 grey_ball_1 green_ball_1 - ball
   yellow_box_1 red_box_1 grey_box_1 yellow_box_2 - box
 )
 (:init (agentinroom room_3) (objectinroom yellow_box_1 room_1) (objectinroom blue_ball_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom grey_ball_1 room_2) (objectinroom red_box_1 room_2) (objectinroom green_ball_1 room_3) (objectinroom yellow_box_2 room_3) (objectinroom grey_box_1 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor red_box_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor yellow_box_2 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor purple_door_2 purpletype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked green_door_1) (locked purple_door_1) (locked purple_door_2) (locked blue_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
