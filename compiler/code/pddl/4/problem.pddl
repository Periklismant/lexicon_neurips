(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
(:objects
   green_block_1 brown_block_1 blue_block_1 orange_block_1 blue_block_2 black_block_1 black_block_2 black_block_3 
   green_block_2 green_block_3 green_block_4 green_block_5 green_block_6 green_block_7 green_block_8 green_block_9 green_block_10
   brown_block_2 brown_block_3 brown_block_4 brown_block_5 brown_block_6 brown_block_7 brown_block_8 brown_block_9 brown_block_10
   blue_block_3 blue_block_4 blue_block_5 blue_block_6 blue_block_7 blue_block_8 blue_block_9 blue_block_10 blue_block_11
   orange_block_2 orange_block_3 orange_block_4 orange_block_5 orange_block_6 orange_block_7 orange_block_8 orange_block_9 orange_block_10
   black_block_4 black_block_5 black_block_6 black_block_7 black_block_8 black_block_9 black_block_10 black_block_11 black_block_12
   red_block_1 red_block_2 red_block_3 red_block_4 red_block_5 red_block_6 red_block_7 red_block_8 red_block_9 red_block_10
   yellow_block_1 yellow_block_2 yellow_block_3 yellow_block_4 yellow_block_5 yellow_block_6 yellow_block_7 yellow_block_8 yellow_block_9 yellow_block_10
   - block
)
 (:init (ontable green_block_1) (ontable brown_block_1) (ontable blue_block_1) (on orange_block_1 blue_block_1) (ontable blue_block_2) (on black_block_1 orange_block_1) (on black_block_2 blue_block_2) (on black_block_3 black_block_2) (clear green_block_1) (clear brown_block_1) (clear black_block_1) (clear black_block_3) (handempty))
 (:goal (exists (?x - block) (and (on blue_block_2 ?x) (on ?x brown_block_1)))) 
 (:constraints (sometime (exists (?y - block) (on brown_block_1 ?y))))
)
