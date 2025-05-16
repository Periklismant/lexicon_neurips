(define (problem liftedtcore_minigrid-problem)
 (:domain liftedtcore_minigrid-domain)
 (:objects
   room_3 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 yellow_door_1 grey_door_2 - door
   grey_box_1 grey_box_2 blue_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom grey_box_1 room_1) (objectinroom yellow_box_1 room_2) (objectinroom blue_box_1 room_3) (objectinroom purple_box_1 room_3) (objectinroom blue_box_2 room_3) (objectinroom purple_ball_1 room_3) (objectinroom grey_ball_1 room_4) (objectinroom grey_box_2 room_4) (objectcolor grey_box_1 greytype) (objectcolor yellow_box_1 yellowtype) (objectcolor blue_box_1 bluetype) (objectcolor purple_box_1 purpletype) (objectcolor blue_box_2 bluetype) (objectcolor purple_ball_1 purpletype) (objectcolor grey_ball_1 greytype) (objectcolor grey_box_2 greytype) (objectcolor grey_door_1 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor grey_door_2 greytype) (emptyhands) (locked grey_door_1) (locked yellow_door_1) (locked green_door_1) (locked grey_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 grey_door_2) (adjacentrooms room_3 room_4 grey_door_2) (visited room_4) (hold_4) (= (total-cost) 0))
 (:goal (and (exists (?d - door)
 (and (objectcolor ?d greentype) (adjacentrooms room_4 room_2 ?d) (at_ ?d) (not (locked ?d)))) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8)))
 (:metric minimize (total-cost))
)
