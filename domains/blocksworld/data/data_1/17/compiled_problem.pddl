(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   black_block_1 red_block_1 blue_block_1 yellow_block_1 black_block_3 - block
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on blue_block_1 black_block_1) (on black_block_2 red_block_1) (on yellow_block_1 blue_block_1) (ontable black_block_3) (on purple_block_1 yellow_block_1) (clear black_block_2) (clear black_block_3) (clear purple_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear yellow_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
