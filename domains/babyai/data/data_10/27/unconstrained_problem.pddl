(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 yellow_door_2 green_door_1 grey_door_1 - door
   blue_box_1 red_box_1 red_box_2 yellow_box_1 grey_box_1 - box
   grey_ball_1 green_ball_1 blue_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom red_box_1 room_1) (objectinroom grey_box_1 room_1) (objectinroom red_box_2 room_1) (objectinroom grey_ball_1 room_3) (objectinroom blue_ball_1 room_3) (objectinroom yellow_box_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom blue_box_1 room_4) (objectcolor red_box_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor red_box_2 redtype) (objectcolor grey_ball_1 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_ball_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_door_1 yellowtype) (objectcolor yellow_door_2 yellowtype) (objectcolor green_door_1 greentype) (objectcolor grey_door_1 greytype) (emptyhands) (locked yellow_door_1) (locked yellow_door_2) (locked green_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 yellow_door_2) (adjacentrooms room_1 room_3 yellow_door_2) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v bluetype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:metric minimize (total-cost))
)
