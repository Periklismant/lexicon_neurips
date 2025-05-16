(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable white_block_1) (ontable white_block_2) (on yellow_block_1 white_block_1) (ontable orange_block_1) (on green_block_1 white_block_2) (ontable orange_block_2) (ontable red_block_1) (clear yellow_block_1) (clear orange_block_1) (clear green_block_1) (clear orange_block_2) (clear red_block_1) (handempty) (hold_1) (hold_2) (hold_5) (hold_8) (hold_12) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_12) (hold_13) (hold_14) (hold_15)))
 (:metric minimize (total-cost))
)
