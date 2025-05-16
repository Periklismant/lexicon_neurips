(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable orange_block_1) (ontable brown_block_1) (ontable green_block_1) (on purple_block_1 orange_block_1) (on red_block_1 brown_block_1) (on grey_block_1 green_block_1) (ontable green_block_2) (clear purple_block_1) (clear red_block_1) (clear grey_block_1) (clear green_block_2) (handempty) (hold_7) (hold_10) (hold_12) (= (total-cost) 0))
 (:goal (and (on green_block_2 orange_block_1) (hold_0) (hold_2) (hold_4) (hold_6) (hold_7) (hold_8) (hold_10) (hold_11) (hold_12) (hold_13)))
 (:metric minimize (total-cost))
)
