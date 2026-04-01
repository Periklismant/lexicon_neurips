(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 red_door_1 grey_door_2 blue_door_1 - door
   grey_box_1 red_box_2 red_box_1 purple_box_1 red_box_3 yellow_box_1 - box
   green_ball_1 grey_ball_1 - ball
 )
 (:init (agentinroom room_3) (objectinroom red_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom red_box_2 room_2) (objectinroom red_box_3 room_2) (objectinroom green_ball_1 room_2) (objectinroom grey_ball_1 room_2) (objectinroom grey_box_1 room_3) (objectinroom purple_box_1 room_4) (objectcolor red_box_1 redtype) (objectcolor yellow_box_1 yellowtype) (objectcolor red_box_2 redtype) (objectcolor red_box_3 redtype) (objectcolor green_ball_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor grey_box_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor grey_door_1 greytype) (objectcolor red_door_1 redtype) (objectcolor grey_door_2 greytype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked grey_door_1) (locked red_door_1) (locked grey_door_2) (locked blue_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 grey_door_2) (adjacentrooms room_2 room_4 grey_door_2) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (at_ grey_box_1)))
 (:metric minimize (total-cost))
)
