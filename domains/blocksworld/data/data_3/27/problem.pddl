(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   orange_block_1 white_block_1 red_block_1 orange_block_2 black_block_1 green_block_1 red_block_2 - block
 )
 (:init (ontable orange_block_1) (ontable white_block_1) (on red_block_1 orange_block_1) (on orange_block_2 white_block_1) (on black_block_1 red_block_1) (on green_block_1 orange_block_2) (ontable red_block_2) (clear black_block_1) (clear green_block_1) (clear red_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on orange_block_2 black_block_1)))
 (:constraints (sometime (not (ontable black_block_1))) (sometime-after (not (ontable black_block_1)) (clear red_block_1)) (sometime (clear white_block_1)) (sometime-before (clear white_block_1) (clear orange_block_1)) (sometime (holding orange_block_1)))
 (:metric minimize (total-cost))
)
