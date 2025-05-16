(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 green_door_1 red_door_1 green_door_2 - door
   purple_box_1 red_box_1 grey_box_1 grey_box_2 - box
   yellow_ball_1 red_ball_1 blue_ball_1 green_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom purple_box_1 room_1) (objectinroom red_box_1 room_1) (objectinroom grey_box_1 room_2) (objectinroom green_ball_1 room_2) (objectinroom blue_ball_1 room_3) (objectinroom yellow_ball_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom grey_box_2 room_4) (objectcolor purple_box_1 purpletype) (objectcolor red_box_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor green_ball_1 greentype) (objectcolor blue_ball_1 bluetype) (objectcolor yellow_ball_1 yellowtype) (objectcolor red_ball_1 redtype) (objectcolor grey_box_2 greytype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (objectcolor green_door_2 greentype) (emptyhands) (locked grey_door_1) (locked green_door_1) (locked red_door_1) (locked green_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 green_door_2) (adjacentrooms room_3 room_4 green_door_2) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (not (locked grey_door_1))) (sometime-after (not (locked grey_door_1)) (or (carrying green_ball_1) (at_ red_box_1))) (always (not (agentinroom room_2))) (sometime (not (emptyhands))))
 (:metric minimize (total-cost))
)
