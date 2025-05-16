(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 grey_door_1 purple_door_1 green_door_1 - door
   green_box_1 blue_box_1 green_box_2 yellow_box_1 grey_box_1 yellow_box_2 - box
   red_ball_1 yellow_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom grey_box_1 room_1) (objectinroom green_box_1 room_1) (objectinroom red_ball_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom green_box_2 room_3) (objectinroom yellow_box_2 room_3) (objectinroom blue_box_1 room_3) (objectcolor grey_box_1 greytype) (objectcolor green_box_1 greentype) (objectcolor red_ball_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_2 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (emptyhands) (locked red_door_1) (locked grey_door_1) (locked purple_door_1) (locked green_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (adjacentrooms room_2 room_1 ?d) (at_ ?d) (not (locked ?d))))))
 (:metric minimize (total-cost))
)
