(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 grey_door_1 yellow_door_1 purple_door_1 - door
   purple_box_1 grey_box_1 blue_box_1 - box
   blue_ball_1 yellow_ball_2 green_ball_1 red_ball_1 yellow_ball_1 - ball
 )
 (:init (agentinroom room_2) (objectinroom blue_ball_1 room_1) (objectinroom purple_box_1 room_1) (objectinroom red_ball_1 room_1) (objectinroom yellow_ball_1 room_3) (objectinroom blue_box_1 room_3) (objectinroom yellow_ball_2 room_3) (objectinroom grey_box_1 room_3) (objectinroom green_ball_1 room_4) (objectcolor blue_ball_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_ball_2 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor green_ball_1 greentype) (objectcolor red_door_1 redtype) (objectcolor grey_door_1 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor purple_door_1 purpletype) (emptyhands) (locked red_door_1) (locked grey_door_1) (locked yellow_door_1) (locked purple_door_1) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 purple_door_1) (adjacentrooms room_3 room_4 purple_door_1) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v purpletype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v)))))
 (:constraints (sometime (not (emptyhands))) (sometime (not (locked yellow_door_1))) (always (locked red_door_1)) (sometime (agentinroom room_2)) (sometime-after (agentinroom room_2) (and (carrying yellow_ball_2) (objectinroom grey_box_1 room_2))) (sometime (not (locked purple_door_1))) (sometime (objectinroom yellow_ball_1 room_1)))
 (:metric minimize (total-cost))
)
