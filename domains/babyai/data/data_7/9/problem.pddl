(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 red_door_1 purple_door_1 blue_door_1 - door
   green_box_2 grey_box_1 yellow_box_2 green_box_1 yellow_box_1 - box
   blue_ball_1 blue_ball_2 yellow_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom yellow_box_1 room_1) (objectinroom green_box_1 room_2) (objectinroom yellow_ball_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom blue_ball_2 room_3) (objectinroom green_box_2 room_4) (objectinroom yellow_box_2 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_2 bluetype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_2 yellowtype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked green_door_1) (locked red_door_1) (locked purple_door_1) (locked blue_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greytype) (objectinroom ?v room_3) (agentinroom room_3) (at_ ?v)))))
 (:constraints (sometime (or (not (locked purple_door_1)) (at_ purple_door_1))) (sometime (and (not (emptyhands)) (carrying yellow_box_1))) (sometime (at_ blue_ball_1)) (sometime (locked red_door_1)) (sometime-after (locked red_door_1) (not (emptyhands))) (sometime (agentinroom room_1)) (sometime-before (agentinroom room_1) (and (carrying yellow_ball_1) (at_ yellow_box_2))) (sometime (not (locked red_door_1))) (sometime-before (not (locked red_door_1)) (and (agentinroom room_4) (objectinroom green_box_1 room_4))) (sometime (agentinroom room_2)) (sometime-after (agentinroom room_2) (not (locked blue_door_1))))
 (:metric minimize (total-cost))
)
