(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable grey_block_1) (ontable grey_block_2) (on white_block_1 grey_block_1) (on blue_block_1 white_block_1) (on purple_block_1 blue_block_1) (ontable orange_block_1) (on red_block_1 grey_block_2) (clear purple_block_1) (clear orange_block_1) (clear red_block_1) (handempty) (hold_6) (hold_7) (= (total-cost) 0))
 (:goal (and (on orange_block_1 blue_block_1) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_12)))
 (:metric minimize (total-cost))
)
