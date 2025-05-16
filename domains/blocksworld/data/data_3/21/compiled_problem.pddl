(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   green_block_2 white_block_1 - block
 )
 (:init (ontable black_block_1) (on black_block_2 black_block_1) (on green_block_1 black_block_2) (on green_block_2 green_block_1) (on purple_block_1 green_block_2) (on white_block_1 purple_block_1) (on white_block_2 white_block_1) (clear white_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on black_block_2 green_block_1) (hold_0) (hold_2) (hold_3)))
 (:metric minimize (total-cost))
)
