(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 yellow_door_1 grey_door_1 purple_door_1 - door
   blue_ball_1 red_ball_1 red_ball_2 green_ball_2 green_ball_1 grey_ball_1 - ball
   green_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_3) (objectinroom green_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom red_ball_2 room_2) (objectinroom green_ball_2 room_2) (objectinroom grey_ball_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom green_box_1 room_4) (objectcolor green_ball_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor green_ball_2 greentype) (objectcolor grey_ball_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor green_box_1 greentype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked green_door_1) (locked yellow_door_1) (locked grey_door_1) (locked purple_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
