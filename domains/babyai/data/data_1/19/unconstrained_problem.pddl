(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 blue_door_1 yellow_door_1 yellow_door_2 - door
   green_ball_2 green_ball_1 red_ball_2 green_ball_3 red_ball_1 grey_ball_2 grey_ball_1 - ball
   purple_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom green_ball_1 room_1) (objectinroom green_ball_2 room_1) (objectinroom grey_ball_1 room_1) (objectinroom green_ball_3 room_1) (objectinroom purple_box_1 room_2) (objectinroom red_ball_1 room_3) (objectinroom red_ball_2 room_3) (objectinroom grey_ball_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor green_ball_2 greentype) (objectcolor grey_ball_1 greytype) (objectcolor green_ball_3 greentype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor grey_ball_2 greytype) (objectcolor grey_door_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked grey_door_1) (locked blue_door_1) (locked yellow_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (adjacentrooms room_2 room_4 ?d) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
