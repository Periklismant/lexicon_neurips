(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 blue_door_1 grey_door_1 purple_door_2 - door
   grey_box_1 - box
   purple_ball_2 blue_ball_1 green_ball_1 grey_ball_2 grey_ball_1 red_ball_1 purple_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom green_ball_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom grey_ball_1 room_2) (objectinroom grey_box_1 room_2) (objectinroom purple_ball_1 room_2) (objectinroom purple_ball_2 room_3) (objectinroom blue_ball_1 room_3) (objectinroom grey_ball_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor red_ball_1 redtype) (objectcolor grey_ball_1 greytype) (objectcolor grey_box_1 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor purple_ball_2 purpletype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_ball_2 greytype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_2 purpletype) (emptyhands) (locked purple_door_1) (locked blue_door_1) (locked grey_door_1) (locked purple_door_2) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 purple_door_2) (adjacentrooms room_3 room_4 purple_door_2) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (agentinroom room_4)) (sometime-after (agentinroom room_4) (agentinroom room_1)) (sometime (not (locked purple_door_2))) (sometime-before (not (locked purple_door_2)) (and (agentinroom room_3) (carrying purple_ball_1))) (sometime (and (not (locked grey_door_1)) (carrying purple_ball_1))) (sometime (agentinroom room_3)) (sometime-before (agentinroom room_3) (or (carrying grey_box_1) (objectinroom grey_ball_2 room_1))) (sometime (and (not (locked grey_door_1)) (carrying blue_ball_1))) (sometime (agentinroom room_1)) (sometime (locked purple_door_2)) (sometime-after (locked purple_door_2) (objectinroom grey_ball_2 room_1)))
 (:metric minimize (total-cost))
)
