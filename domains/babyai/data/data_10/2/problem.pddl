(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 blue_door_2 blue_door_3 green_door_1 - door
   blue_ball_1 yellow_ball_2 yellow_ball_1 purple_ball_1 - ball
   green_box_1 grey_box_2 grey_box_1 yellow_box_1 - box
 )
 (:init (agentinroom room_2) (objectinroom yellow_ball_1 room_2) (objectinroom grey_box_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom grey_box_2 room_2) (objectinroom yellow_ball_2 room_3) (objectinroom green_box_1 room_3) (objectinroom purple_ball_1 room_4) (objectinroom blue_ball_1 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_box_2 greytype) (objectcolor yellow_ball_2 yellowtype) (objectcolor green_box_1 greentype) (objectcolor purple_ball_1 purpletype) (objectcolor blue_ball_1 bluetype) (objectcolor blue_door_1 bluetype) (objectcolor blue_door_2 bluetype) (objectcolor blue_door_3 bluetype) (objectcolor green_door_1 greentype) (emptyhands) (locked blue_door_1) (locked blue_door_2) (locked blue_door_3) (locked green_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 blue_door_2) (adjacentrooms room_1 room_3 blue_door_2) (adjacentrooms room_4 room_2 blue_door_3) (adjacentrooms room_2 room_4 blue_door_3) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v yellowtype) (at_ ?v)))))
 (:constraints (sometime (not (emptyhands))) (sometime (at_ blue_door_3)) (sometime (and (agentinroom room_3) (objectinroom yellow_box_1 room_3))) (sometime (or (at_ purple_ball_1) (objectinroom green_box_1 room_4))) (sometime (agentinroom room_1)) (sometime (and (at_ green_box_1) (not (locked green_door_1)))) (sometime (or (objectinroom empty room_1) (objectinroom grey_box_1 room_3))) (sometime (not (locked blue_door_1))) (sometime (objectinroom green_box_1 room_2)))
 (:metric minimize (total-cost))
)
