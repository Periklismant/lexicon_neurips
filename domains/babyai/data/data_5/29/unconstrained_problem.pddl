(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 grey_door_2 grey_door_3 red_door_1 - door
   yellow_ball_1 purple_ball_1 grey_ball_1 purple_ball_2 - ball
   yellow_box_1 grey_box_1 grey_box_2 blue_box_1 - box
 )
 (:init (agentinroom room_3) (objectinroom purple_ball_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom grey_box_2 room_3) (objectinroom purple_ball_2 room_3) (objectinroom blue_box_1 room_4) (objectinroom yellow_box_1 room_4) (objectcolor purple_ball_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor yellow_ball_1 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor grey_box_2 greytype) (objectcolor purple_ball_2 purpletype) (objectcolor blue_box_1 bluetype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor grey_door_2 greytype) (objectcolor grey_door_3 greytype) (objectcolor red_door_1 redtype) (emptyhands) (locked grey_door_1) (locked grey_door_2) (locked grey_door_3) (locked red_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 grey_door_2) (adjacentrooms room_1 room_3 grey_door_2) (adjacentrooms room_4 room_2 grey_door_3) (adjacentrooms room_2 room_4 grey_door_3) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greytype) (carrying ?v)))))
 (:metric minimize (total-cost))
)
