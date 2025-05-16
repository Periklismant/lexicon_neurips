(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable brown_block_1) (ontable yellow_block_1) (on white_block_1 brown_block_1) (on grey_block_1 yellow_block_1) (on black_block_1 grey_block_1) (ontable red_block_1) (on white_block_2 black_block_1) (clear white_block_1) (clear red_block_1) (clear white_block_2) (handempty) (hold_1) (hold_5) (hold_9) (hold_12) (hold_14) (= (total-cost) 0))
 (:goal (and (holding brown_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14) (hold_15)))
 (:metric minimize (total-cost))
)
