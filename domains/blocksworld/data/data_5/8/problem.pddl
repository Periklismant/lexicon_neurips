(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   brown_block_1 white_block_1 orange_block_1 red_block_1 blue_block_1 green_block_1 black_block_1 - block
 )
 (:init (ontable brown_block_1) (ontable white_block_1) (on orange_block_1 brown_block_1) (on red_block_1 white_block_1) (on blue_block_1 red_block_1) (on green_block_1 orange_block_1) (on black_block_1 green_block_1) (clear blue_block_1) (clear black_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear red_block_1)))
 (:constraints (sometime (not (on black_block_1 blue_block_1))) (sometime-after (not (on black_block_1 blue_block_1)) (and (clear blue_block_1) (ontable green_block_1))) (sometime (on red_block_1 orange_block_1)) (sometime (not (ontable blue_block_1))) (sometime-after (not (ontable blue_block_1)) (and (on blue_block_1 orange_block_1) (on white_block_1 black_block_1))) (sometime (not (on red_block_1 orange_block_1))) (sometime-after (not (on red_block_1 orange_block_1)) (ontable red_block_1)) (sometime (holding green_block_1)))
 (:metric minimize (total-cost))
)
