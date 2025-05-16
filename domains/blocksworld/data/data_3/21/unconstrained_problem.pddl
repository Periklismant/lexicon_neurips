(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   black_block_1 black_block_2 green_block_1 green_block_2 purple_block_1 white_block_1 white_block_2 - block
 )
 (:init (ontable black_block_1) (on black_block_2 black_block_1) (on green_block_1 black_block_2) (on green_block_2 green_block_1) (on purple_block_1 green_block_2) (on white_block_1 purple_block_1) (on white_block_2 white_block_1) (clear white_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on black_block_2 green_block_1)))
 (:metric minimize (total-cost))
)
