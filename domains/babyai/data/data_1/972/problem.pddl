(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 grey_door_1 green_door_1 grey_door_2 - door
   blue_box_2 red_box_1 green_box_1 blue_box_1 - box
   purple_ball_2 green_ball_1 purple_ball_1 yellow_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom green_box_1 room_1) (objectinroom purple_ball_1 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom blue_box_1 room_3) (objectinroom blue_box_2 room_3) (objectinroom green_ball_1 room_4) (objectinroom red_box_1 room_4) (objectinroom purple_ball_2 room_4) (objectcolor green_box_1 greentype) (objectcolor purple_ball_1 purpletype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor blue_box_2 bluetype) (objectcolor green_ball_1 greentype) (objectcolor red_box_1 redtype) (objectcolor purple_ball_2 purpletype) (objectcolor red_door_1 redtype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor grey_door_2 greytype) (emptyhands) (locked red_door_1) (locked grey_door_1) (locked green_door_1) (locked grey_door_2) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 grey_door_2) (adjacentrooms room_3 room_4 grey_door_2) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (adjacentrooms room_1 room_2 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (not (locked red_door_1))) (sometime-before (not (locked red_door_1)) (or (carrying blue_box_1) (objectinroom red_box_1 room_3))))
 (:metric minimize (total-cost))
)
