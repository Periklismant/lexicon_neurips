(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable black_block_1) (on white_block_1 black_block_1) (ontable yellow_block_1) (on white_block_2 white_block_1) (ontable green_block_1) (on red_block_1 green_block_1) (ontable black_block_2) (clear yellow_block_1) (clear white_block_2) (clear red_block_1) (clear black_block_2) (handempty) (hold_5) (hold_8) (hold_11) (hold_13) (hold_15) (= (total-cost) 0))
 (:goal (and (on black_block_2 red_block_1) (hold_0) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14) (hold_15) (hold_16)))
 (:metric minimize (total-cost))
)
