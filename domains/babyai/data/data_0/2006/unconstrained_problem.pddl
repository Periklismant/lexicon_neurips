(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 grey_door_2 yellow_door_1 green_door_1 - door
   grey_box_1 red_box_3 red_box_2 red_box_1 purple_box_1 - box
   purple_ball_1 blue_ball_1 red_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom blue_ball_1 room_1) (objectinroom red_box_1 room_1) (objectinroom purple_box_1 room_2) (objectinroom red_ball_1 room_2) (objectinroom red_box_2 room_2) (objectinroom red_box_3 room_2) (objectinroom purple_ball_1 room_4) (objectinroom grey_box_1 room_4) (objectcolor blue_ball_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor red_box_2 redtype) (objectcolor red_box_3 redtype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_box_1 greytype) (objectcolor grey_door_1 greytype) (objectcolor grey_door_2 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (emptyhands) (locked grey_door_1) (locked grey_door_2) (locked yellow_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 grey_door_2) (adjacentrooms room_1 room_3 grey_door_2) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
