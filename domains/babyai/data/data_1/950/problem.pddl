(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 purple_door_1 red_door_1 red_door_2 - door
   blue_ball_2 red_ball_1 purple_ball_1 grey_ball_1 yellow_ball_1 blue_ball_1 - ball
   green_box_1 blue_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom blue_ball_1 room_1) (objectinroom purple_ball_1 room_2) (objectinroom green_box_1 room_2) (objectinroom yellow_ball_1 room_2) (objectinroom blue_ball_2 room_3) (objectinroom grey_ball_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom blue_box_1 room_4) (objectcolor blue_ball_1 bluetype) (objectcolor purple_ball_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_ball_2 bluetype) (objectcolor grey_ball_1 greytype) (objectcolor red_ball_1 redtype) (objectcolor blue_box_1 bluetype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (emptyhands) (locked grey_door_1) (locked purple_door_1) (locked red_door_1) (locked red_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 red_door_2) (adjacentrooms room_3 room_4 red_door_2) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v yellowtype) (objectinroom ?v room_2) (agentinroom room_2) (at_ ?v)))))
 (:constraints (sometime (or (carrying yellow_ball_1) (at_ purple_ball_1))))
 (:metric minimize (total-cost))
)
