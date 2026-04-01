(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 green_door_1 blue_door_1 grey_door_1 - door
   green_box_2 purple_box_1 green_box_1 purple_box_2 blue_box_1 yellow_box_1 - box
   red_ball_1 yellow_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom green_box_1 room_1) (objectinroom blue_box_1 room_2) (objectinroom yellow_ball_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom yellow_box_1 room_4) (objectinroom red_ball_1 room_4) (objectinroom purple_box_2 room_4) (objectinroom green_box_2 room_4) (objectcolor green_box_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor red_ball_1 redtype) (objectcolor purple_box_2 purpletype) (objectcolor green_box_2 greentype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (emptyhands) (locked purple_door_1) (locked green_door_1) (locked blue_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greytype) (adjacentrooms room_4 room_3 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (at_ grey_door_1)) (sometime-before (at_ grey_door_1) (or (at_ blue_box_1) (objectinroom yellow_box_1 room_1))))
 (:metric minimize (total-cost))
)
