(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 yellow_door_1 grey_door_2 yellow_door_2 - door
   grey_box_1 red_box_1 grey_box_2 - box
   red_ball_1 green_ball_1 green_ball_3 yellow_ball_1 green_ball_2 - ball
 )
 (:init (agentinroom room_3) (objectinroom green_ball_1 room_1) (objectinroom grey_box_1 room_1) (objectinroom grey_box_2 room_1) (objectinroom yellow_ball_1 room_2) (objectinroom green_ball_2 room_3) (objectinroom red_box_1 room_3) (objectinroom green_ball_3 room_3) (objectinroom red_ball_1 room_4) (objectcolor green_ball_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor grey_box_2 greytype) (objectcolor yellow_ball_1 yellowtype) (objectcolor green_ball_2 greentype) (objectcolor red_box_1 redtype) (objectcolor green_ball_3 greentype) (objectcolor red_ball_1 redtype) (objectcolor grey_door_1 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_2 greytype) (objectcolor yellow_door_2 yellowtype) (emptyhands) (locked grey_door_1) (locked yellow_door_1) (locked grey_door_2) (locked yellow_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 grey_door_2) (adjacentrooms room_2 room_4 grey_door_2) (adjacentrooms room_4 room_3 yellow_door_2) (adjacentrooms room_3 room_4 yellow_door_2) (visited room_3) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d yellowtype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (locked yellow_door_1)) (sometime-after (locked yellow_door_1) (at_ green_ball_2)))
 (:metric minimize (total-cost))
)
