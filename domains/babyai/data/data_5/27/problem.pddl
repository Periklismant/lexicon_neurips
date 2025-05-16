(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 red_door_1 purple_door_1 blue_door_2 - door
   yellow_box_3 red_box_1 yellow_box_1 yellow_box_2 - box
   grey_ball_2 grey_ball_3 grey_ball_1 blue_ball_1 - ball
 )
 (:init (agentinroom room_4) (objectinroom grey_ball_1 room_1) (objectinroom grey_ball_2 room_1) (objectinroom red_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom grey_ball_3 room_3) (objectinroom blue_ball_1 room_3) (objectinroom yellow_box_2 room_3) (objectinroom yellow_box_3 room_4) (objectcolor grey_ball_1 greytype) (objectcolor grey_ball_2 greytype) (objectcolor red_box_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_3 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_box_2 yellowtype) (objectcolor yellow_box_3 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_2 bluetype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked purple_door_1) (locked blue_door_2) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 blue_door_2) (adjacentrooms room_3 room_4 blue_door_2) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_1 room_2 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (always (not (agentinroom room_2))) (sometime (carrying red_box_1)) (always (locked purple_door_1)) (sometime (and (at_ red_door_1) (carrying grey_ball_1))) (sometime (and (objectinroom grey_ball_2 room_4) (at_ yellow_box_2))))
 (:metric minimize (total-cost))
)
