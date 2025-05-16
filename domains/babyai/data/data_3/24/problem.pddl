(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 red_door_1 red_door_2 green_door_1 - door
   yellow_ball_1 grey_ball_1 red_ball_1 - ball
   green_box_1 blue_box_2 grey_box_1 green_box_2 blue_box_1 - box
 )
 (:init (agentinroom room_3) (objectinroom red_ball_1 room_1) (objectinroom grey_box_1 room_1) (objectinroom green_box_1 room_2) (objectinroom grey_ball_1 room_2) (objectinroom green_box_2 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom blue_box_1 room_4) (objectinroom blue_box_2 room_4) (objectcolor red_ball_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor green_box_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor green_box_2 greentype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor blue_box_2 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (objectcolor green_door_1 greentype) (emptyhands) (locked purple_door_1) (locked red_door_1) (locked red_door_2) (locked green_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 red_door_2) (adjacentrooms room_2 room_4 red_door_2) (adjacentrooms room_4 room_3 green_door_1) (adjacentrooms room_3 room_4 green_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (carrying ?v)))))
 (:constraints (sometime (not (emptyhands))) (sometime-before (not (emptyhands)) (at_ green_door_1)) (sometime (at_ green_box_1)) (sometime-after (at_ green_box_1) (or (carrying blue_box_2) (at_ red_ball_1))) (sometime (agentinroom room_1)) (sometime-before (agentinroom room_1) (not (emptyhands))))
 (:metric minimize (total-cost))
)
