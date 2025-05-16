(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   red_door_1 blue_door_1 red_door_2 red_door_3 - door
   grey_ball_1 red_ball_1 - ball
   yellow_box_3 yellow_box_1 red_box_1 yellow_box_2 blue_box_1 grey_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom yellow_box_1 room_1) (objectinroom grey_ball_1 room_1) (objectinroom red_box_1 room_2) (objectinroom yellow_box_2 room_2) (objectinroom yellow_box_3 room_3) (objectinroom grey_box_1 room_4) (objectinroom blue_box_1 room_4) (objectinroom red_ball_1 room_4) (objectcolor yellow_box_1 yellowtype) (objectcolor grey_ball_1 greytype) (objectcolor red_box_1 redtype) (objectcolor yellow_box_2 yellowtype) (objectcolor yellow_box_3 yellowtype) (objectcolor grey_box_1 greytype) (objectcolor blue_box_1 bluetype) (objectcolor red_ball_1 redtype) (objectcolor red_door_1 redtype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_2 redtype) (objectcolor red_door_3 redtype) (emptyhands) (locked red_door_1) (locked blue_door_1) (locked red_door_2) (locked red_door_3) (adjacentrooms room_2 room_1 red_door_1) (adjacentrooms room_1 room_2 red_door_1) (adjacentrooms room_3 room_1 blue_door_1) (adjacentrooms room_1 room_3 blue_door_1) (adjacentrooms room_4 room_2 red_door_2) (adjacentrooms room_2 room_4 red_door_2) (adjacentrooms room_4 room_3 red_door_3) (adjacentrooms room_3 room_4 red_door_3) (visited room_4) (= (total-cost) 0))
 (:goal (and (exists (?v - box)
 (and (objectcolor ?v yellowtype) (at_ ?v)))))
 (:constraints (always (locked red_door_2)) (sometime (agentinroom room_4)) (sometime-after (agentinroom room_4) (or (carrying grey_box_1) (not (locked red_door_3)))) (sometime (agentinroom room_2)) (sometime-before (agentinroom room_2) (at_ red_door_3)) (sometime (objectinroom grey_box_1 room_1)) (sometime (or (objectinroom grey_box_1 room_1) (at_ blue_door_1))) (sometime (or (at_ red_ball_1) (not (emptyhands)))) (sometime (at_ red_box_1)) (sometime (carrying yellow_box_3)) (sometime (and (at_ grey_box_1) (not (emptyhands)))) (sometime (objectinroom yellow_box_2 room_3)))
 (:metric minimize (total-cost))
)
