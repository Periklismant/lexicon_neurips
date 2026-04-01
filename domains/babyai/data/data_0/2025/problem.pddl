(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 purple_door_1 red_door_1 yellow_door_2 - door
   grey_box_1 yellow_box_1 yellow_box_2 purple_box_1 - box
   purple_ball_1 blue_ball_1 green_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom blue_ball_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom grey_box_1 room_1) (objectinroom purple_ball_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom yellow_box_2 room_2) (objectinroom purple_box_1 room_4) (objectcolor blue_ball_1 bluetype) (objectcolor green_ball_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor grey_box_1 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor yellow_box_2 yellowtype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked yellow_door_1) (locked purple_door_1) (locked red_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
