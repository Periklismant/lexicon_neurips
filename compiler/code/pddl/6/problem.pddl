(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   grey_door_1 yellow_door_1 green_door_1 grey_door_2 - door
   grey_key_2 grey_key_3 yellow_key_1 grey_key_4 green_key_1 green_key_2 grey_key_1 yellow_key_2 - key
   blue_ball_1 - ball
   purple_box_1 - box
 )
 (:init (agentinroom room_4) (objectinroom yellow_key_1 room_1) (objectinroom grey_key_1 room_1) (objectinroom grey_key_2 room_2) (objectinroom green_key_1 room_2) (objectinroom purple_box_1 room_3) (objectinroom yellow_key_2 room_3) (objectinroom grey_key_3 room_3) (objectinroom blue_ball_1 room_4) (objectinroom green_key_2 room_4) (objectinroom grey_key_4 room_4) (objectcolor yellow_key_1 yellowtype) (objectcolor grey_key_1 greytype) (objectcolor grey_key_2 greytype) (objectcolor green_key_1 greentype) (objectcolor purple_box_1 purpletype) (objectcolor yellow_key_2 yellowtype) (objectcolor grey_key_3 greytype) (objectcolor blue_ball_1 bluetype) (objectcolor green_key_2 greentype) (objectcolor grey_key_4 greytype) (objectcolor grey_door_1 greytype) (objectcolor yellow_door_1 yellowtype) (objectcolor green_door_1 greentype) (objectcolor grey_door_2 greytype) (emptyhands) (locked grey_door_1) (locked yellow_door_1) (locked green_door_1) (locked grey_door_2) (adjacentrooms room_2 room_1 grey_door_1) (adjacentrooms room_1 room_2 grey_door_1) (adjacentrooms room_3 room_1 yellow_door_1) (adjacentrooms room_1 room_3 yellow_door_1) (adjacentrooms room_4 room_2 green_door_1) (adjacentrooms room_2 room_4 green_door_1) (adjacentrooms room_4 room_3 grey_door_2) (adjacentrooms room_3 room_4 grey_door_2) (visited room_4) )
 (:goal (and (exists (?v - key)
 (and (objectcolor ?v yellowtype) (at_ ?v)))))
 (:constraints (sometime (and (not (emptyhands)) (at_ green_door_1))))
)
