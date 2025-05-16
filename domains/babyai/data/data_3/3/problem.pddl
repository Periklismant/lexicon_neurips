(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 blue_door_1 yellow_door_2 yellow_door_3 - door
   yellow_box_1 grey_box_1 yellow_box_2 - box
   yellow_ball_1 purple_ball_1 grey_ball_1 green_ball_1 grey_ball_2 - ball
 )
 (:init (agentinroom room_2) (objectinroom grey_ball_1 room_1) (objectinroom yellow_box_1 room_2) (objectinroom grey_ball_2 room_2) (objectinroom purple_ball_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom yellow_ball_1 room_4) (objectinroom yellow_box_2 room_4) (objectcolor grey_ball_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_2 greytype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_box_1 greytype) (objectcolor green_ball_1 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor yellow_box_2 yellowtype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor yellow_door_2 yellowtype) (objectcolor yellow_door_3 yellowtype) (emptyhands) (locked yellow_door_1) (locked blue_door_1) (locked yellow_door_2) (locked yellow_door_3) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 yellow_door_2) (adjacentrooms room_2 room_4 yellow_door_2) (adjacentrooms room_4 room_3 yellow_door_3) (adjacentrooms room_3 room_4 yellow_door_3) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d bluetype) (adjacentrooms room_1 room_3 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (locked blue_door_1)) (sometime-after (locked blue_door_1) (at_ grey_ball_2)) (sometime (not (emptyhands))) (always (not (agentinroom room_1))))
 (:metric minimize (total-cost))
)
