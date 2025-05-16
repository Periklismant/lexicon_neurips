(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 purple_door_1 blue_door_1 grey_door_1 - door
   grey_ball_1 grey_ball_3 yellow_ball_1 purple_ball_1 grey_ball_2 red_ball_1 - ball
   yellow_box_1 blue_box_1 - box
 )
 (:init (agentinroom room_2) (objectinroom yellow_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom grey_ball_2 room_1) (objectinroom blue_box_1 room_3) (objectinroom yellow_ball_1 room_3) (objectinroom grey_ball_3 room_4) (objectinroom purple_ball_1 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor red_ball_1 redtype) (objectcolor grey_ball_1 greytype) (objectcolor grey_ball_2 greytype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_ball_3 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (emptyhands) (locked red_door_1) (locked purple_door_1) (locked blue_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greytype) (adjacentrooms room_3 room_4 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (agentinroom room_4)) (sometime-before (agentinroom room_4) (not (emptyhands))) (always (locked blue_door_1)) (sometime (at_ grey_door_1)) (sometime-before (at_ grey_door_1) (at_ red_ball_1)) (sometime (not (emptyhands))) (sometime (not (locked red_door_1))))
 (:metric minimize (total-cost))
)
