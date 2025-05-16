(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   green_door_1 purple_door_1 green_door_2 green_door_3 - door
   grey_ball_1 grey_ball_2 purple_ball_1 red_ball_1 - ball
   green_box_2 green_box_1 yellow_box_1 purple_box_1 - box
 )
 (:init (agentinroom room_1) (objectinroom green_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom green_box_2 room_1) (objectinroom purple_ball_1 room_3) (objectinroom purple_box_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom grey_ball_2 room_3) (objectinroom yellow_box_1 room_4) (objectcolor green_box_1 greentype) (objectcolor grey_ball_1 greytype) (objectcolor green_box_2 greentype) (objectcolor purple_ball_1 purpletype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor grey_ball_2 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor purple_door_1 purpletype) (objectcolor green_door_2 greentype) (objectcolor green_door_3 greentype) (emptyhands) (locked green_door_1) (locked purple_door_1) (locked green_door_2) (locked green_door_3) (adjacentrooms room_2 room_1 green_door_1) (adjacentrooms room_1 room_2 green_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 green_door_2) (adjacentrooms room_2 room_4 green_door_2) (adjacentrooms room_4 room_3 green_door_3) (adjacentrooms room_3 room_4 green_door_3) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (not (locked green_door_1))) (sometime-before (not (locked green_door_1)) (carrying green_box_1)) (sometime (locked green_door_1)) (sometime-after (locked green_door_1) (carrying green_box_1)))
 (:metric minimize (total-cost))
)
