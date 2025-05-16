(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   orange_block_1 green_block_1 blue_block_1 red_block_1 black_block_1 orange_block_2 brown_block_1 - block
 )
 (:init (ontable orange_block_1) (on green_block_1 orange_block_1) (ontable blue_block_1) (on red_block_1 blue_block_1) (ontable black_block_1) (on orange_block_2 red_block_1) (on brown_block_1 orange_block_2) (clear green_block_1) (clear black_block_1) (clear brown_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:constraints (sometime (not (on blue_block_1 orange_block_1))) (sometime-after (not (on blue_block_1 orange_block_1)) (on black_block_1 orange_block_2)) (sometime (clear orange_block_1)) (sometime-before (clear orange_block_1) (or (on black_block_1 orange_block_1) (holding black_block_1))) (sometime (not (on orange_block_2 green_block_1))) (sometime-after (not (on orange_block_2 green_block_1)) (or (holding black_block_1) (ontable brown_block_1))) (sometime (not (on blue_block_1 red_block_1))) (sometime-after (not (on blue_block_1 red_block_1)) (or (clear blue_block_1) (clear red_block_1))) (sometime (clear red_block_1)) (sometime (and (ontable brown_block_1) (holding orange_block_2))) (sometime (not (clear blue_block_1))) (sometime-after (not (clear blue_block_1)) (clear orange_block_2)))
 (:metric minimize (total-cost))
)
