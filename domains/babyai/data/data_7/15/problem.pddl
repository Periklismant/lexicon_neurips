(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 green_door_1 red_door_1 red_door_2 - door
   red_ball_1 green_ball_2 red_ball_2 green_ball_1 - ball
   yellow_box_2 yellow_box_1 blue_box_1 green_box_1 - box
 )
 (:init (agentinroom room_2) (objectinroom green_ball_1 room_1) (objectinroom blue_box_1 room_1) (objectinroom green_box_1 room_2) (objectinroom yellow_box_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom red_ball_2 room_3) (objectinroom green_ball_2 room_4) (objectinroom yellow_box_2 room_4) (objectcolor green_ball_1 greentype) (objectcolor blue_box_1 bluetype) (objectcolor green_box_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor red_ball_1 redtype) (objectcolor red_ball_2 redtype) (objectcolor green_ball_2 greentype) (objectcolor yellow_box_2 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (emptyhands) (locked grey_door_1) (locked green_door_1) (locked red_door_1) (locked red_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 green_door_1) (adjacentrooms room_1 room_3 green_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 red_door_2) (adjacentrooms room_3 room_4 red_door_2) (visited room_2) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d redtype) (adjacentrooms room_3 room_4 ?d) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (agentinroom room_4)) (sometime-before (agentinroom room_4) (carrying yellow_box_1)) (sometime (objectinroom blue_box_1 room_4)) (always (locked red_door_1)) (sometime (at_ empty)) (sometime (locked red_door_2)) (sometime-after (locked red_door_2) (at_ empty)) (sometime (at_ red_door_2)) (sometime-before (at_ red_door_2) (at_ green_box_1)) (sometime (not (locked red_door_2))) (sometime-before (not (locked red_door_2)) (objectinroom red_ball_1 room_1)))
 (:metric minimize (total-cost))
)
