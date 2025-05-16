(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable yellow_block_1) (ontable black_block_1) (ontable grey_block_1) (on grey_block_2 grey_block_1) (on white_block_1 yellow_block_1) (ontable yellow_block_2) (ontable blue_block_1) (clear black_block_1) (clear grey_block_2) (clear white_block_1) (clear yellow_block_2) (clear blue_block_1) (handempty) (hold_6) (hold_11) (hold_13) (= (total-cost) 0))
 (:goal (and (on blue_block_1 yellow_block_2) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6) (hold_7) (hold_8) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14)))
 (:metric minimize (total-cost))
)
