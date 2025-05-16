(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 blue_door_2 blue_door_3 green_door_1 - door
   grey_box_2 grey_box_3 grey_box_1 grey_box_4 purple_box_1 green_box_1 - box
   purple_ball_1 green_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom grey_box_1 room_1) (objectinroom grey_box_2 room_2) (objectinroom grey_box_3 room_2) (objectinroom purple_box_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom grey_box_4 room_3) (objectinroom purple_ball_1 room_4) (objectinroom green_box_1 room_4) (objectcolor grey_box_1 greytype) (objectcolor grey_box_2 greytype) (objectcolor grey_box_3 greytype) (objectcolor purple_box_1 purpletype) (objectcolor green_ball_1 greentype) (objectcolor grey_box_4 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (objectcolor blue_door_3 bluetype) (objectcolor green_door_1 greentype) (emptyhands) (locked blue_door_1) (locked blue_door_2) (locked blue_door_3) (locked green_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 blue_door_2) (adjacentrooms room_1 room_3 blue_door_2) (adjacentrooms room_4 room_2 blue_door_3) (adjacentrooms room_2 room_4 blue_door_3) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v purpletype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:constraints (sometime (at_ green_door_1)) (sometime (agentinroom room_4)) (sometime-before (agentinroom room_4) (or (agentinroom room_1) (carrying purple_ball_1))) (always (locked blue_door_3)) (sometime (at_ purple_ball_1)) (sometime-before (at_ purple_ball_1) (or (not (emptyhands)) (not (locked blue_door_2)))) (sometime (or (carrying purple_ball_1) (not (emptyhands)))) (sometime (and (not (locked green_door_1)) (agentinroom room_1))) (sometime (agentinroom room_2)) (sometime-after (agentinroom room_2) (not (emptyhands))))
 (:metric minimize (total-cost))
)
