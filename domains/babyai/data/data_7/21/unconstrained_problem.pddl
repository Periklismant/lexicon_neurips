(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 blue_door_1 red_door_1 grey_door_1 - door
   red_ball_1 purple_ball_1 purple_ball_2 red_ball_2 grey_ball_1 - ball
   purple_box_1 blue_box_1 green_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom purple_ball_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom purple_ball_2 room_1) (objectinroom purple_box_1 room_2) (objectinroom red_ball_1 room_2) (objectinroom green_box_1 room_4) (objectinroom blue_box_1 room_4) (objectinroom red_ball_2 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor purple_ball_2 purpletype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor green_box_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_2 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor grey_door_1 greytype) (emptyhands) (locked yellow_door_1) (locked blue_door_1) (locked red_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
