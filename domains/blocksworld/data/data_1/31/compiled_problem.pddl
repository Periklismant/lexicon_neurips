(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   black_block_1 green_block_1 brown_block_1 - block
 )
 (:init (ontable black_block_1) (on green_block_1 black_block_1) (on brown_block_1 green_block_1) (on orange_block_1 brown_block_1) (ontable yellow_block_1) (on purple_block_1 orange_block_1) (on orange_block_2 purple_block_1) (clear yellow_block_1) (clear orange_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on black_block_1 purple_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
