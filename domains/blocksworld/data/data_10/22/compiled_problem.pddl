(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable brown_block_1) (ontable brown_block_2) (on green_block_1 brown_block_2) (ontable black_block_1) (on black_block_2 black_block_1) (on black_block_3 brown_block_1) (on grey_block_1 green_block_1) (clear black_block_2) (clear black_block_3) (clear grey_block_1) (handempty) (hold_2) (hold_5) (hold_6) (hold_11) (hold_13) (hold_15) (= (total-cost) 0))
 (:goal (and (holding black_block_3) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_9) (hold_11) (hold_12) (hold_13) (hold_14) (hold_15) (hold_16) (hold_17)))
 (:metric minimize (total-cost))
)
