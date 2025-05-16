(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 yellow_door_1 grey_door_1 blue_door_2 - door
   green_box_1 red_box_1 yellow_box_1 green_box_2 - box
   yellow_ball_1 grey_ball_1 purple_ball_1 blue_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom grey_ball_1 room_2) (objectinroom yellow_box_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom green_box_1 room_3) (objectinroom red_box_1 room_3) (objectinroom yellow_ball_1 room_4) (objectinroom green_box_2 room_4) (objectinroom purple_ball_1 room_4) (objectcolor grey_ball_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_ball_1 bluetype) (objectcolor green_box_1 greentype) (objectcolor red_box_1 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_box_2 greentype) (objectcolor purple_ball_1 purpletype) (objectcolor blue_door_1 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor blue_door_2 bluetype) (emptyhands) (locked blue_door_1) (locked yellow_door_1) (locked grey_door_1) (locked blue_door_2) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 grey_door_1) (adjacentrooms room_2 room_4 grey_door_1) (adjacentrooms room_4 room_3 blue_door_2) (adjacentrooms room_3 room_4 blue_door_2) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v yellowtype) (carrying ?v)))))
 (:metric minimize (total-cost))
)
