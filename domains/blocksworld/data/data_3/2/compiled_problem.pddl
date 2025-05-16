(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   black_block_1 brown_block_1 - block
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on black_block_2 red_block_1) (ontable orange_block_1) (on green_block_1 black_block_2) (on brown_block_1 orange_block_1) (on green_block_2 brown_block_1) (clear black_block_1) (clear green_block_1) (clear green_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (clear red_block_1) (hold_0) (hold_2)))
 (:metric minimize (total-cost))
)
