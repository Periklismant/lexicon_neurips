(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 grey_door_1 blue_door_1 green_door_1 - door
   yellow_ball_1 purple_ball_1 green_ball_1 - ball
   yellow_box_1 red_box_1 purple_box_1 blue_box_1 green_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom purple_ball_1 room_1) (objectinroom green_box_1 room_1) (objectinroom yellow_box_1 room_2) (objectinroom green_ball_1 room_3) (objectinroom red_box_1 room_3) (objectinroom blue_box_1 room_3) (objectinroom purple_box_1 room_4) (objectinroom yellow_ball_1 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor red_box_1 redtype) (objectcolor blue_box_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_ball_1 yellowtype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor green_door_1 greentype) (emptyhands) (locked yellow_door_1) (locked grey_door_1) (locked blue_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (adjacentrooms room_4 room_3 ?d) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
