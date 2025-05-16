(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 blue_door_1 purple_door_1 blue_door_2 - door
   red_box_1 purple_box_2 purple_box_1 yellow_box_1 - box
   red_ball_1 grey_ball_2 grey_ball_1 purple_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom grey_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom purple_box_2 room_2) (objectinroom purple_ball_1 room_3) (objectinroom red_box_1 room_4) (objectinroom grey_ball_2 room_4) (objectinroom yellow_box_1 room_4) (objectcolor grey_ball_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor purple_box_2 purpletype) (objectcolor purple_ball_1 purpletype) (objectcolor red_box_1 redtype) (objectcolor grey_ball_2 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor blue_door_2 bluetype) (emptyhands) (locked grey_door_1) (locked blue_door_1) (locked purple_door_1) (locked blue_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 blue_door_2) (adjacentrooms room_3 room_4 blue_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v purpletype) (objectinroom ?v room_3) (agentinroom room_3) (at_ ?v)))))
 (:constraints (sometime (objectinroom grey_ball_2 room_1)))
 (:metric minimize (total-cost))
)
