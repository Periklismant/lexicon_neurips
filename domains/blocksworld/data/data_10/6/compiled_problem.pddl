(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable purple_block_1) (ontable green_block_1) (ontable purple_block_2) (on red_block_1 purple_block_2) (on green_block_2 green_block_1) (on red_block_2 purple_block_1) (on orange_block_1 red_block_2) (clear red_block_1) (clear green_block_2) (clear orange_block_1) (handempty) (hold_2) (hold_7) (hold_10) (hold_12) (hold_14) (= (total-cost) 0))
 (:goal (and (ontable red_block_2) (hold_0) (hold_2) (hold_3) (hold_4) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14) (hold_15)))
 (:metric minimize (total-cost))
)
