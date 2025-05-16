(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   brown_block_1 white_block_1 orange_block_1 red_block_1 blue_block_1 green_block_1 black_block_1 - block
 )
 (:init (ontable brown_block_1) (ontable white_block_1) (on orange_block_1 brown_block_1) (on red_block_1 white_block_1) (on blue_block_1 red_block_1) (on green_block_1 orange_block_1) (on black_block_1 green_block_1) (clear blue_block_1) (clear black_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear red_block_1)))
 (:metric minimize (total-cost))
)
