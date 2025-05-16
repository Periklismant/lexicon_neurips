(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 green_door_1 purple_door_1 grey_door_1 - door
   green_box_1 blue_box_1 red_box_1 - box
   grey_ball_2 grey_ball_3 grey_ball_1 red_ball_1 purple_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom grey_ball_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom blue_box_1 room_2) (objectinroom red_box_1 room_3) (objectinroom green_box_1 room_3) (objectinroom grey_ball_2 room_3) (objectinroom purple_ball_1 room_3) (objectinroom grey_ball_3 room_4) (objectcolor grey_ball_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor blue_box_1 bluetype) (objectcolor red_box_1 redtype) (objectcolor green_box_1 greentype) (objectcolor grey_ball_2 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_ball_3 greytype) (objectcolor red_door_1 redtype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor grey_door_1 greytype) (emptyhands) (locked red_door_1) (locked green_door_1) (locked purple_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:constraints (sometime (and (objectinroom blue_box_1 room_4) (agentinroom room_1))) (sometime (not (locked purple_door_1))) (sometime-before (not (locked purple_door_1)) (or (carrying purple_ball_1) (at_ purple_ball_1))) (sometime (agentinroom room_4)) (sometime-before (agentinroom room_4) (and (carrying grey_ball_1) (not (locked green_door_1)))) (sometime (locked purple_door_1)) (sometime-after (locked purple_door_1) (carrying grey_ball_3)) (sometime (agentinroom room_2)) (sometime-after (agentinroom room_2) (at_ purple_ball_1)) (sometime (not (emptyhands))) (sometime (or (not (locked grey_door_1)) (at_ purple_ball_1))) (sometime (at_ grey_ball_3)) (sometime-before (at_ grey_ball_3) (not (emptyhands))))
 (:metric minimize (total-cost))
)
