(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 purple_door_1 green_door_1 green_door_2 - door
   grey_ball_1 purple_ball_1 green_ball_1 - ball
   yellow_box_1 purple_box_1 red_box_1 blue_box_1 grey_box_1 - box
 )
 (:init (agentinroom room_3) (objectinroom red_box_1 room_1) (objectinroom blue_box_1 room_1) (objectinroom purple_ball_1 room_1) (objectinroom yellow_box_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom grey_box_1 room_4) (objectinroom green_ball_1 room_4) (objectcolor red_box_1 redtype) (objectcolor blue_box_1 bluetype) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor purple_box_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor grey_box_1 greytype) (objectcolor green_ball_1 greentype) (objectcolor blue_door_1 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor green_door_2 greentype) (emptyhands) (locked blue_door_1) (locked purple_door_1) (locked green_door_1) (locked green_door_2) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 green_door_2) (adjacentrooms room_3 room_4 green_door_2) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_1 room_2 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (always (locked purple_door_1)) (sometime (not (locked green_door_1))) (sometime (agentinroom room_1)) (sometime-before (agentinroom room_1) (or (agentinroom room_4) (at_ green_door_1))) (sometime (at_ purple_door_1)) (sometime-before (at_ purple_door_1) (or (carrying grey_box_1) (objectinroom yellow_box_1 room_4))) (sometime (at_ blue_door_1)) (sometime-before (at_ blue_door_1) (objectinroom purple_box_1 room_4)) (sometime (or (agentinroom room_2) (not (emptyhands)))) (sometime (objectinroom blue_box_1 room_3)) (sometime (not (locked blue_door_1))) (sometime-before (not (locked blue_door_1)) (or (carrying purple_box_1) (objectinroom purple_ball_1 room_3))) (sometime (or (at_ yellow_box_1) (not (locked green_door_2)))) (sometime (and (objectinroom grey_ball_1 room_4) (not (locked green_door_1)))))
 (:metric minimize (total-cost))
)
