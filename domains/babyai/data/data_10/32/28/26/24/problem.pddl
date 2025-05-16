(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 blue_door_2 yellow_door_1 purple_door_1 - door
   grey_box_1 purple_box_1 purple_box_2 - box
   yellow_ball_1 green_ball_1 red_ball_2 red_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom grey_box_1 room_2) (objectinroom purple_box_1 room_2) (objectinroom grey_ball_1 room_2) (objectinroom red_ball_1 room_2) (objectinroom yellow_ball_1 room_2) (objectinroom red_ball_2 room_4) (objectinroom purple_box_2 room_4) (objectinroom green_ball_1 room_4) (objectcolor grey_box_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor red_ball_2 redtype) (objectcolor purple_box_2 purpletype) (objectcolor green_ball_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked blue_door_1) (locked blue_door_2) (locked yellow_door_1) (locked purple_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 blue_door_2) (adjacentrooms room_1 room_3 blue_door_2) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (adjacentrooms room_4 room_2 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (at_ blue_door_1)) (sometime-before (at_ blue_door_1) (not (emptyhands))))
 (:metric minimize (total-cost))
)
