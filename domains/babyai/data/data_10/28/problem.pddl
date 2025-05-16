(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 yellow_door_1 yellow_door_2 blue_door_1 - door
   grey_ball_1 purple_ball_1 blue_ball_1 - ball
   green_box_1 yellow_box_2 purple_box_1 yellow_box_1 green_box_2 - box
 )
 (:init (agentinroom room_1) (objectinroom purple_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom yellow_box_2 room_2) (objectinroom grey_ball_1 room_3) (objectinroom green_box_1 room_4) (objectinroom green_box_2 room_4) (objectinroom blue_ball_1 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_box_1 yellowtype) (objectcolor yellow_box_2 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor green_box_1 greentype) (objectcolor green_box_2 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor green_door_1 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked green_door_1) (locked yellow_door_1) (locked yellow_door_2) (locked blue_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 yellow_door_2) (adjacentrooms room_2 room_4 yellow_door_2) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:constraints (sometime (or (objectinroom yellow_box_2 room_3) (not (emptyhands)))) (always (not (agentinroom room_2))) (sometime (not (locked green_door_1))) (sometime-after (not (locked green_door_1)) (at_ grey_ball_1)) (sometime (not (locked yellow_door_2))) (sometime-after (not (locked yellow_door_2)) (or (carrying green_box_1) (carrying purple_ball_1))) (sometime (and (at_ empty) (objectinroom green_box_1 room_1))) (sometime (locked green_door_1)) (sometime-after (locked green_door_1) (or (at_ blue_door_1) (not (emptyhands)))) (sometime (carrying green_box_1)) (sometime (agentinroom room_1)) (sometime-after (agentinroom room_1) (at_ yellow_door_1)) (sometime (objectinroom green_box_1 room_1)) (sometime (not (emptyhands))))
 (:metric minimize (total-cost))
)
