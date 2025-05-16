(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 grey_door_2 green_door_1 red_door_1 - door
   red_box_1 yellow_box_1 green_box_1 grey_box_1 blue_box_1 green_box_2 - box
   grey_ball_1 grey_ball_2 - ball
 )
 (:init (agentinroom room_4) (objectinroom grey_ball_1 room_1) (objectinroom green_box_1 room_1) (objectinroom red_box_1 room_2) (objectinroom grey_ball_2 room_2) (objectinroom blue_box_1 room_3) (objectinroom grey_box_1 room_3) (objectinroom green_box_2 room_3) (objectinroom yellow_box_1 room_4) (objectcolor grey_ball_1 greytype) (objectcolor green_box_1 greentype) (objectcolor red_box_1 redtype) (objectcolor grey_ball_2 greytype) (objectcolor blue_box_1 bluetype) (objectcolor grey_box_1 greytype) (objectcolor green_box_2 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor grey_door_2 greytype) (objectcolor green_door_1 greentype) (objectcolor red_door_1 redtype) (emptyhands) (locked grey_door_1) (locked grey_door_2) (locked green_door_1) (locked red_door_1) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 grey_door_2) (adjacentrooms room_1 room_3 grey_door_2) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 red_door_1) (adjacentrooms room_3 room_4 red_door_1) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greytype) (at_ ?d) (not (locked ?d))))))
 (:constraints (sometime (agentinroom room_4)) (sometime-after (agentinroom room_4) (and (not (emptyhands)) (agentinroom room_1))) (sometime (not (locked green_door_1))) (sometime-after (not (locked green_door_1)) (and (carrying yellow_box_1) (not (locked red_door_1)))) (sometime (at_ green_door_1)) (sometime-before (at_ green_door_1) (or (carrying green_box_2) (carrying red_box_1))) (sometime (agentinroom room_2)) (sometime-before (agentinroom room_2) (and (carrying grey_ball_1) (not (emptyhands)))) (sometime (at_ grey_door_1)) (sometime-before (at_ grey_door_1) (objectinroom yellow_box_1 room_3)))
 (:metric minimize (total-cost))
)
