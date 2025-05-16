(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable orange_block_1) (ontable white_block_1) (on red_block_1 orange_block_1) (on orange_block_2 white_block_1) (on black_block_1 red_block_1) (on green_block_1 orange_block_2) (ontable red_block_2) (clear black_block_1) (clear green_block_1) (clear red_block_2) (handempty) (hold_0) (hold_9) (hold_10) (= (total-cost) 0))
 (:goal (and (on orange_block_2 black_block_1) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13)))
 (:metric minimize (total-cost))
)
