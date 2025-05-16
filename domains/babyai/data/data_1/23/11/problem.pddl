(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 grey_door_1 red_door_1 yellow_door_1 - door
   blue_ball_1 yellow_ball_1 blue_ball_2 - ball
   purple_box_1 red_box_1 blue_box_1 green_box_1 green_box_2 - box
 )
 (:init (agentinroom room_4) (objectinroom green_box_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom yellow_ball_1 room_3) (objectinroom blue_box_1 room_3) (objectinroom blue_ball_2 room_3) (objectinroom red_box_1 room_4) (objectinroom green_box_2 room_4) (objectcolor green_box_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor blue_ball_2 bluetype) (objectcolor red_box_1 redtype) (objectcolor green_box_2 greentype) (objectcolor green_door_1 greentype) (objectcolor grey_door_1 greytype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked green_door_1) (locked grey_door_1) (locked red_door_1) (locked yellow_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (adjacentrooms room_1 room_2 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (always (not (agentinroom room_2))))
 (:metric minimize (total-cost))
)
