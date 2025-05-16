(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 red_door_1 green_door_2 grey_door_1 - door
   grey_ball_1 green_ball_2 green_ball_1 yellow_ball_1 - ball
   yellow_box_1 purple_box_1 grey_box_2 grey_box_1 - box
 )
 (:init (agentinroom room_3) (objectinroom grey_box_1 room_1) (objectinroom yellow_ball_1 room_1) (objectinroom green_ball_1 room_2) (objectinroom purple_box_1 room_2) (objectinroom grey_box_2 room_3) (objectinroom yellow_box_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom green_ball_2 room_3) (objectcolor grey_box_1 greytype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor grey_box_2 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor green_ball_2 greentype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (objectcolor green_door_2 greentype) (objectcolor grey_door_1 greytype) (emptyhands) (locked green_door_1) (locked red_door_1) (locked green_door_2) (locked grey_door_1) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 green_door_2) (adjacentrooms room_2 room_4 green_door_2) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greytype) (at_ ?v)))))
 (:constraints (sometime (and (not (locked green_door_1)) (carrying grey_ball_1))) (sometime (or (not (locked grey_door_1)) (not (locked green_door_2)))) (sometime (and (carrying green_ball_2) (at_ green_ball_1))) (sometime (and (carrying green_ball_1) (not (locked red_door_1)))) (sometime (agentinroom room_4)) (sometime (not (locked green_door_1))) (sometime (and (not (emptyhands)) (objectinroom yellow_ball_1 room_4))) (sometime (and (carrying purple_box_1) (not (locked red_door_1)))) (sometime (objectinroom grey_box_1 room_3)) (sometime (objectinroom green_ball_1 room_1)))
 (:metric minimize (total-cost))
)
