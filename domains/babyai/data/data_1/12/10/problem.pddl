(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 yellow_door_1 green_door_1 yellow_door_2 - door
   blue_ball_1 yellow_ball_1 red_ball_1 blue_ball_2 - ball
   grey_box_1 purple_box_1 red_box_1 blue_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom yellow_ball_1 room_1) (objectinroom red_box_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom blue_box_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom blue_ball_1 room_4) (objectinroom red_ball_1 room_4) (objectinroom blue_ball_2 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor red_box_1 redtype) (objectcolor purple_box_1 purpletype) (objectcolor blue_box_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor red_ball_1 redtype) (objectcolor blue_ball_2 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked purple_door_1) (locked yellow_door_1) (locked green_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (not (locked yellow_door_2))) (sometime-before (not (locked yellow_door_2)) (carrying purple_box_1)))
 (:metric minimize (total-cost))
)
