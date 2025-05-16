(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   yellow_door_1 grey_door_1 red_door_1 blue_door_1 - door
   purple_box_1 yellow_box_1 green_box_2 red_box_1 grey_box_1 green_box_1 - box
   red_ball_1 green_ball_1 - ball
 )
 (:init (agentinroom room_1) (objectinroom red_box_1 room_2) (objectinroom green_box_1 room_2) (objectinroom grey_box_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom red_ball_1 room_3) (objectinroom green_ball_1 room_3) (objectinroom yellow_box_1 room_3) (objectinroom green_box_2 room_4) (objectcolor red_box_1 redtype) (objectcolor green_box_1 greentype) (objectcolor grey_box_1 greytype) (objectcolor purple_box_1 purpletype) (objectcolor red_ball_1 redtype) (objectcolor green_ball_1 greentype) (objectcolor yellow_box_1 yellowtype) (objectcolor green_box_2 greentype) (objectcolor yellow_door_1 yellowtype) (objectcolor grey_door_1 greytype) (objectcolor red_door_1 redtype) (objectcolor blue_door_1 bluetype) (emptyhands) (locked yellow_door_1) (locked grey_door_1) (locked red_door_1) (locked blue_door_1) (adjacentrooms room_2 room_1 yellow_door_1) (adjacentrooms room_1 room_2 yellow_door_1) (adjacentrooms room_3 room_1 grey_door_1) (adjacentrooms room_1 room_3 grey_door_1) (adjacentrooms room_4 room_2 red_door_1) (adjacentrooms room_2 room_4 red_door_1) (adjacentrooms room_4 room_3 blue_door_1) (adjacentrooms room_3 room_4 blue_door_1) (visited room_1) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v greentype) (at_ ?v)))))
 (:constraints (always (locked yellow_door_1)) (sometime (or (objectinroom purple_box_1 room_2) (not (emptyhands)))) (sometime (agentinroom room_2)) (sometime-before (agentinroom room_2) (or (objectinroom red_box_1 room_4) (not (emptyhands)))))
 (:metric minimize (total-cost))
)
