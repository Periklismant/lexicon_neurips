(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 red_door_1 purple_door_1 red_door_2 - door
   grey_ball_1 green_ball_2 green_ball_1 yellow_ball_1 yellow_ball_2 blue_ball_1 - ball
   red_box_1 grey_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom yellow_ball_1 room_1) (objectinroom red_box_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom blue_ball_1 room_3) (objectinroom grey_ball_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom green_ball_2 room_4) (objectinroom yellow_ball_2 room_4) (objectcolor yellow_ball_1 yellowtype) (objectcolor red_box_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_ball_1 greytype) (objectcolor green_ball_1 greentype) (objectcolor green_ball_2 greentype) (objectcolor yellow_ball_2 yellowtype) (objectcolor yellow_door_1 yellowtype) (objectcolor red_door_1 redtype) (objectcolor purple_door_1 purpletype) (objectcolor red_door_2 redtype) (emptyhands) (locked yellow_door_1) (locked red_door_1) (locked purple_door_1) (locked red_door_2) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 purple_door_1) (adjacentrooms room_2 room_4 purple_door_1) (adjacentrooms room_4 room_3 red_door_2) (adjacentrooms room_3 room_4 red_door_2) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v yellowtype) (at_ ?v)))))
 (:constraints (sometime (and (at_ green_ball_2) (agentinroom room_2))) (sometime (not (emptyhands))) (sometime (or (carrying green_ball_2) (carrying grey_box_1))) (sometime (at_ red_door_2)) (sometime (and (not (locked yellow_door_1)) (at_ grey_ball_1))) (sometime (or (carrying grey_box_1) (not (locked purple_door_1)))) (sometime (at_ grey_ball_1)) (sometime (or (agentinroom room_3) (not (locked yellow_door_1)))) (sometime (carrying grey_ball_1)) (sometime (or (carrying grey_box_1) (agentinroom room_4))))
 (:metric minimize (total-cost))
)
