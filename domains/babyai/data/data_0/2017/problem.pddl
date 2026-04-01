(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 grey_door_1 red_door_1 grey_door_2 - door
   grey_box_1 blue_box_1 green_box_1 red_box_1 yellow_box_1 purple_box_1 - box
   blue_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom blue_box_1 room_1) (objectinroom purple_box_1 room_2) (objectinroom green_box_1 room_2) (objectinroom red_box_1 room_2) (objectinroom grey_ball_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom yellow_box_1 room_4) (objectcolor blue_box_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor green_box_1 greentype) (objectcolor red_box_1 redtype) (objectcolor grey_ball_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor grey_door_1 greytype) (objectcolor red_door_1 redtype) (objectcolor grey_door_2 greytype) (emptyhands) (locked green_door_1) (locked grey_door_1) (locked red_door_1) (locked grey_door_2) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 grey_door_2) (adjacentrooms room_3 room_4 grey_door_2) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v yellowtype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:metric minimize (total-cost))
)
