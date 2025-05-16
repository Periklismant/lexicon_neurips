(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 purple_door_1 purple_door_2 purple_door_3 - door
   yellow_box_1 yellow_box_2 - box
   red_ball_1 blue_ball_1 yellow_ball_1 red_ball_2 grey_ball_1 grey_ball_2 - ball
 )
 (:init (agentinroom room_1) (objectinroom grey_ball_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom blue_ball_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom grey_ball_2 room_2) (objectinroom yellow_box_2 room_3) (objectinroom red_ball_2 room_4) (objectcolor grey_ball_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor red_ball_1 redtype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_ball_2 greytype) (objectcolor yellow_box_2 yellowtype) (objectcolor red_ball_2 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor purple_door_2 purpletype) (objectcolor purple_door_3 purpletype) (emptyhands) (locked yellow_door_1) (locked purple_door_1) (locked purple_door_2) (locked purple_door_3) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 purple_door_2) (adjacentrooms room_2 room_4 purple_door_2) (adjacentrooms room_4 room_3 purple_door_3) (adjacentrooms room_3 room_4 purple_door_3) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (at_ ?v)))))
 (:constraints (sometime (agentinroom room_2)))
 (:metric minimize (total-cost))
)
