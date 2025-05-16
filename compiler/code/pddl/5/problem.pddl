(define (problem minigrid-problem)
 (:domain minigrid-domain)
 (:objects
   room_1 room_2 room_3 room_4 - room
   redtype greentype bluetype yellowtype purpletype greytype - color
   blue_door_1 red_door_1 red_door_2 blue_door_2 - door
   grey_ball_1 yellow_ball_1 - ball
   blue_key_3 red_key_3 blue_key_2 red_key_4 blue_key_1 red_key_1 blue_key_4 red_key_2 - key
 )
 (:init (agentinroom room_4) (objectinroom red_key_1 room_1) (objectinroom blue_key_1 room_1) (objectinroom blue_key_2 room_2) (objectinroom red_key_2 room_2) (objectinroom yellow_ball_1 room_3) (objectinroom blue_key_3 room_3) (objectinroom red_key_3 room_3) (objectinroom red_key_4 room_4) (objectinroom grey_ball_1 room_4) (objectinroom blue_key_4 room_4) (objectcolor red_key_1 redtype) (objectcolor blue_key_1 bluetype) (objectcolor blue_key_2 bluetype) (objectcolor red_key_2 redtype) (objectcolor yellow_ball_1 yellowtype) (objectcolor blue_key_3 bluetype) (objectcolor red_key_3 redtype) (objectcolor red_key_4 redtype) (objectcolor grey_ball_1 greytype) (objectcolor blue_key_4 bluetype) (objectcolor blue_door_1 bluetype) (objectcolor red_door_1 redtype) (objectcolor red_door_2 redtype) (objectcolor blue_door_2 bluetype) (emptyhands) (locked blue_door_1) (locked red_door_1) (locked red_door_2) (locked blue_door_2) (adjacentrooms room_2 room_1 blue_door_1) (adjacentrooms room_1 room_2 blue_door_1) (adjacentrooms room_3 room_1 red_door_1) (adjacentrooms room_1 room_3 red_door_1) (adjacentrooms room_4 room_2 red_door_2) (adjacentrooms room_2 room_4 red_door_2) (adjacentrooms room_4 room_3 blue_door_2) (adjacentrooms room_3 room_4 blue_door_2) (visited room_4) )
 (:goal (and (exists (?v - key)
 (and (objectcolor ?v bluetype) (objectinroom ?v room_1) (agentinroom room_1) (at_ ?v)))))
 (:constraints (sometime (and (objectinroom yellow_ball_1 room_2) (not (emptyhands)))))
)
