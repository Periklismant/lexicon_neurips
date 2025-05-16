(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 blue_door_1 blue_door_2 purple_door_1 - door
   red_ball_1 yellow_ball_1 red_ball_2 purple_ball_1 - ball
   grey_box_1 yellow_box_1 blue_box_1 green_box_1 - box
 )
 (:init (agentinroom room_2) (objectinroom red_ball_1 room_1) (objectinroom red_ball_2 room_1) (objectinroom yellow_box_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom grey_box_1 room_2) (objectinroom purple_ball_1 room_3) (objectinroom green_box_1 room_3) (objectinroom blue_box_1 room_4) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked red_door_1) (locked blue_door_1) (locked blue_door_2) (locked purple_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 blue_door_2) (adjacentrooms room_2 room_4 blue_door_2) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d purpletype) (adjacentrooms room_3 room_4 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (at_ blue_door_2)) (sometime-before (at_ blue_door_2) (carrying grey_box_1)) (always (locked blue_door_2)) (sometime (agentinroom room_4)) (sometime-before (agentinroom room_4) (or (objectinroom yellow_ball_1 room_4) (objectinroom red_ball_1 room_2))) (sometime (and (objectinroom purple_ball_1 room_1) (objectinroom yellow_ball_1 room_3))) (sometime (at_ purple_door_1)) (sometime-before (at_ purple_door_1) (or (agentinroom room_1) (carrying yellow_box_1))) (sometime (not (locked blue_door_1))) (sometime (objectinroom red_ball_2 room_3)))
 (:metric minimize (total-cost))
)
