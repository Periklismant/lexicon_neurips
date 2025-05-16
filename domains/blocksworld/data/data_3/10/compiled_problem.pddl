(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable green_block_1) (ontable black_block_1) (ontable black_block_2) (on yellow_block_1 green_block_1) (on white_block_1 black_block_2) (on black_block_3 white_block_1) (on black_block_4 black_block_3) (clear black_block_1) (clear yellow_block_1) (clear black_block_4) (handempty) (hold_2) (hold_3) (= (total-cost) 0))
 (:goal (and (ontable white_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
