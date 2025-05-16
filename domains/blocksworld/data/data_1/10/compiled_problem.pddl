(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   orange_block_1 yellow_block_1 black_block_1 black_block_2 white_block_1 - block
 )
 (:init (ontable orange_block_1) (on yellow_block_1 orange_block_1) (on black_block_1 yellow_block_1) (ontable black_block_2) (ontable white_block_1) (on red_block_1 white_block_1) (on blue_block_1 black_block_2) (clear black_block_1) (clear red_block_1) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding blue_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
