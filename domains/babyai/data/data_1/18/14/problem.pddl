(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 grey_door_1 green_door_1 yellow_door_1 - door
   blue_box_1 purple_box_1 purple_box_2 - box
   red_ball_1 red_ball_2 blue_ball_1 grey_ball_1 blue_ball_2 - ball
 )
 (:init (agentinroom room_4) (objectinroom red_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom red_ball_2 room_2) (objectinroom blue_ball_1 room_2) (objectinroom blue_box_1 room_4) (objectinroom purple_box_2 room_4) (objectinroom blue_ball_2 room_4) (objectcolor red_ball_1 redtype) (objectcolor purple_box_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor red_ball_2 redtype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_box_1 bluetype) (objectcolor purple_box_2 purpletype) (objectcolor blue_ball_2 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked purple_door_1) (locked grey_door_1) (locked green_door_1) (locked yellow_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v bluetype) (objectinroom ?v room_2) (agentinroom room_2) (at_ ?v)))))
 (:constraints (sometime (agentinroom room_1)))
 (:metric minimize (total-cost))
)
