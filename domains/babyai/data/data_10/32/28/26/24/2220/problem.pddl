(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 purple_door_1 purple_door_2 grey_door_1 - door
   blue_box_1 purple_box_1 yellow_box_1 blue_box_2 - box
   green_ball_2 green_ball_1 red_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom grey_ball_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom green_ball_1 room_2) (objectinroom green_ball_2 room_2) (objectinroom blue_box_1 room_3) (objectinroom blue_box_2 room_3) (objectinroom red_ball_1 room_4) (objectinroom purple_box_1 room_4) (objectcolor grey_ball_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor green_ball_2 greentype) (objectcolor blue_box_1 bluetype) (objectcolor blue_box_2 bluetype) (objectcolor red_ball_1 redtype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor purple_door_2 purpletype) (objectcolor grey_door_1 greytype) (emptyhands) (locked yellow_door_1) (locked purple_door_1) (locked purple_door_2) (locked grey_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (locked purple_door_2)) (sometime-after (locked purple_door_2) (not (emptyhands))))
 (:metric minimize (total-cost))
)
