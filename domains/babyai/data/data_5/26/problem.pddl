(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 green_door_1 blue_door_1 yellow_door_1 - door
   blue_box_2 red_box_1 blue_box_3 blue_box_1 - box
   yellow_ball_1 red_ball_1 grey_ball_1 green_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom grey_ball_1 room_1) (objectinroom green_ball_1 room_1) (objectinroom blue_box_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom red_box_1 room_2) (objectinroom blue_box_2 room_2) (objectinroom blue_box_3 room_3) (objectinroom red_ball_1 room_4) (objectcolor grey_ball_1 greytype) (objectcolor green_ball_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor red_box_1 redtype) (objectcolor blue_box_2 bluetype) (objectcolor blue_box_3 bluetype) (objectcolor red_ball_1 redtype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked grey_door_1) (locked green_door_1) (locked blue_door_1) (locked yellow_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_4 room_2 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (not (locked green_door_1))) (always (not (agentinroom room_2))) (sometime (not (locked blue_door_1))) (sometime-before (not (locked blue_door_1)) (or (at_ red_ball_1) (agentinroom room_3))) (always (locked grey_door_1)) (sometime (not (emptyhands))))
 (:metric minimize (total-cost))
)
