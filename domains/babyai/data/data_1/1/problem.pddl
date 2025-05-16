(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   purple_door_1 grey_door_1 blue_door_1 yellow_door_1 - door
   blue_box_1 grey_box_1 green_box_1 grey_box_2 purple_box_1 green_box_2 purple_box_2 - box
   blue_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom blue_box_1 room_1) (objectinroom green_box_1 room_2) (objectinroom blue_ball_1 room_2) (objectinroom purple_box_1 room_2) (objectinroom green_box_2 room_3) (objectinroom grey_box_1 room_3) (objectinroom grey_box_2 room_3) (objectinroom purple_box_2 room_4) (objectcolor blue_box_1 bluetype) (objectcolor green_box_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor green_box_2 greentype) (objectcolor grey_box_1 greytype) (objectcolor grey_box_2 greytype) (objectcolor purple_box_2 purpletype) (objectcolor purple_door_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor yellow_door_1 yellowtype) (emptyhands) (locked purple_door_1) (locked grey_door_1) (locked blue_door_1) (locked yellow_door_1) (adjacentrooms room_2 room_1 purple_door_1) (adjacentrooms room_1 room_2 purple_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 blue_door_1) (adjacentrooms room_2 room_4 blue_door_1) (adjacentrooms room_4 room_3 yellow_door_1) (adjacentrooms room_3 room_4 yellow_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v purpletype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:constraints (sometime (and (carrying blue_ball_1) (not (emptyhands)))))
 (:metric minimize (total-cost))
)
