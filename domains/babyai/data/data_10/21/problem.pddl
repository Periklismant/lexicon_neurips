(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 yellow_door_1 blue_door_1 grey_door_1 - door
   green_ball_2 green_ball_1 blue_ball_1 - ball
   yellow_box_1 purple_box_1 red_box_1 purple_box_2 grey_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom green_ball_1 room_2) (objectinroom purple_box_1 room_2) (objectinroom red_box_1 room_2) (objectinroom yellow_box_1 room_3) (objectinroom blue_ball_1 room_3) (objectinroom green_ball_2 room_4) (objectinroom grey_box_1 room_4) (objectinroom purple_box_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor red_box_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor green_ball_2 greentype) (objectcolor grey_box_1 greytype) (objectcolor purple_box_2 purpletype) (objectcolor red_door_1 redtype) (objectcolor yellow_door_1 yellowtype) (objectcolor blue_door_1 bluetype) (objectcolor grey_door_1 greytype) (emptyhands) (locked red_door_1) (locked yellow_door_1) (locked blue_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v greentype) (objectinroom ?v room_2) (agentinroom room_2) (at_ ?v)))))
 (:constraints (sometime (not (emptyhands))) (sometime (not (locked red_door_1))) (sometime-before (not (locked red_door_1)) (or (objectinroom grey_box_1 room_2) (carrying green_ball_1))) (sometime (locked red_door_1)) (sometime-after (locked red_door_1) (not (emptyhands))) (sometime (at_ purple_box_2)) (sometime (or (at_ blue_door_1) (carrying grey_box_1))) (sometime (agentinroom room_2)) (sometime-before (agentinroom room_2) (or (not (emptyhands)) (not (locked grey_door_1)))) (sometime (agentinroom room_1)) (sometime-after (agentinroom room_1) (or (carrying blue_ball_1) (not (emptyhands)))) (sometime (or (at_ purple_box_1) (not (emptyhands)))) (sometime (objectinroom green_ball_1 room_4)) (sometime (or (carrying red_box_1) (not (emptyhands)))))
 (:metric minimize (total-cost))
)
