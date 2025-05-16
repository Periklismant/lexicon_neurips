(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable orange_block_1) (on yellow_block_1 orange_block_1) (on black_block_1 yellow_block_1) (ontable black_block_2) (ontable white_block_1) (on red_block_1 white_block_1) (on blue_block_1 black_block_2) (clear black_block_1) (clear red_block_1) (clear blue_block_1) (handempty) (hold_5) (hold_9) (hold_11) (= (total-cost) 0))
 (:goal (and (holding blue_block_1) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13)))
 (:metric minimize (total-cost))
)
