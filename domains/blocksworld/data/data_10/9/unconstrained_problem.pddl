(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 red_block_1 brown_block_1 black_block_1 green_block_1 brown_block_2 black_block_2 - block
 )
 (:init (ontable white_block_1) (on red_block_1 white_block_1) (ontable brown_block_1) (on black_block_1 brown_block_1) (on green_block_1 red_block_1) (on brown_block_2 black_block_1) (ontable black_block_2) (clear green_block_1) (clear brown_block_2) (clear black_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on brown_block_1 green_block_1)))
 (:metric minimize (total-cost))
)
