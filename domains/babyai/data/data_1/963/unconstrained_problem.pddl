(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 green_door_2 purple_door_1 grey_door_1 - door
   grey_box_1 green_box_1 blue_box_1 - box
   yellow_ball_1 yellow_ball_2 green_ball_1 red_ball_1 blue_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom green_ball_1 room_1) (objectinroom blue_ball_1 room_1) (objectinroom blue_box_1 room_1) (objectinroom red_ball_1 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom green_box_1 room_4) (objectinroom yellow_ball_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_2 yellowtype) (objectcolor green_door_1 greentype) (objectcolor green_door_2 greentype) (objectcolor purple_door_1 purpletype) (objectcolor grey_door_1 greytype) (emptyhands) (locked green_door_1) (locked green_door_2) (locked purple_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 green_door_2) (adjacentrooms room_1 room_3 green_door_2) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
