(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 purple_door_1 yellow_door_1 grey_door_1 - door
   yellow_box_1 red_box_2 green_box_2 red_box_1 grey_box_1 green_box_1 - box
   red_ball_1 green_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom green_box_1 room_1) (objectinroom yellow_box_1 room_1) (objectinroom green_box_2 room_1) (objectinroom red_box_1 room_2) (objectinroom green_ball_1 room_3) (objectinroom red_box_2 room_3) (objectinroom red_ball_1 room_4) (objectinroom grey_box_1 room_4) (objectcolor green_box_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_box_2 greentype) (objectcolor red_box_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor red_box_2 redtype) (objectcolor red_ball_1 redtype) (objectcolor grey_box_1 greytype) (objectcolor blue_door_1 bluetype) (objectcolor purple_door_1 purpletype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (emptyhands) (locked blue_door_1) (locked purple_door_1) (locked yellow_door_1) (locked grey_door_1) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 purple_door_1) (adjacentrooms room_1 room_3 purple_door_1) (adjacentrooms room_4 room_2 yellow_door_1) (adjacentrooms room_2 room_4 yellow_door_1) (adjacentrooms room_4 room_3 grey_door_1) (adjacentrooms room_3 room_4 grey_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - ball)
 (and (objectcolor ?v redtype) (objectinroom ?v room_4) (agentinroom room_4) (at_ ?v)))))
 (:constraints (sometime (or (not (locked grey_door_1)) (carrying green_ball_1))) (sometime (or (at_ empty) (carrying red_box_2))) (sometime (at_ blue_door_1)) (sometime-after (at_ blue_door_1) (or (not (locked purple_door_1)) (not (emptyhands)))))
 (:metric minimize (total-cost))
)
