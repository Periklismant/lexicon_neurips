(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 purple_door_1 green_door_1 green_door_2 - door
   blue_box_2 blue_box_1 - box
   yellow_ball_1 red_ball_1 yellow_ball_2 purple_ball_1 yellow_ball_3 yellow_ball_4 - ball
 )
 (:init (agentinroom room_2) (objectinroom blue_box_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom yellow_ball_2 room_3) (objectinroom purple_ball_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom yellow_ball_3 room_4) (objectinroom yellow_ball_4 room_4) (objectinroom blue_box_2 room_4) (objectcolor blue_box_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor yellow_ball_2 yellowtype) (objectcolor purple_ball_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_3 yellowtype) (objectcolor yellow_ball_4 yellowtype) (objectcolor blue_box_2 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_1 greentype) (objectcolor green_door_2 greentype) (emptyhands) (locked yellow_door_1) (locked purple_door_1) (locked green_door_1) (locked green_door_2) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 green_door_2) (adjacentrooms room_3 room_4 green_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v yellowtype) (carrying ?v)))))
 (:constraints (sometime (not (emptyhands))) (sometime-after (not (emptyhands)) (or (agentinroom room_4) (not (locked yellow_door_1)))) (sometime (agentinroom room_4)) (sometime (or (objectinroom empty room_1) (carrying purple_ball_1))) (sometime (not (locked yellow_door_1))) (sometime (emptyhands)) (sometime-after (emptyhands) (or (agentinroom room_4) (objectinroom purple_ball_1 room_4))))
 (:metric minimize (total-cost))
)
