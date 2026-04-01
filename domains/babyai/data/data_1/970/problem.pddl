(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 purple_door_1 yellow_door_1 yellow_door_2 - door
   blue_ball_2 yellow_ball_2 purple_ball_1 yellow_ball_1 blue_ball_1 - ball
   grey_box_1 red_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_2) (objectinroom grey_box_1 room_1) (objectinroom red_box_1 room_2) (objectinroom yellow_ball_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom purple_box_1 room_3) (objectinroom yellow_ball_2 room_4) (objectinroom blue_ball_2 room_4) (objectinroom purple_ball_1 room_4) (objectcolor grey_box_1 greytype) (objectcolor red_box_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_ball_2 yellowtype) (objectcolor blue_ball_2 bluetype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor purple_door_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked grey_door_1) (locked purple_door_1) (locked yellow_door_1) (locked yellow_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v bluetype) (agentinroom room_4) (objectinroom ?v room_4) (emptyhands) (at_ ?v)))))
 (:constraints (always (locked yellow_door_1)))
 (:metric minimize (total-cost))
)
