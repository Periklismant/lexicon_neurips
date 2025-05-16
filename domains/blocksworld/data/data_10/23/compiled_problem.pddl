(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable blue_block_1) (on grey_block_1 blue_block_1) (on white_block_1 grey_block_1) (ontable white_block_2) (ontable blue_block_2) (ontable yellow_block_1) (ontable brown_block_1) (clear white_block_1) (clear white_block_2) (clear blue_block_2) (clear yellow_block_1) (clear brown_block_1) (handempty) (hold_0) (hold_8) (hold_9) (hold_11) (hold_14) (= (total-cost) 0))
 (:goal (and (holding yellow_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14) (hold_15)))
 (:metric minimize (total-cost))
)
