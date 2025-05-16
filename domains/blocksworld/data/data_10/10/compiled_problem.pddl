(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable green_block_1) (on red_block_1 green_block_1) (ontable red_block_2) (on yellow_block_1 red_block_2) (ontable green_block_2) (ontable yellow_block_2) (on blue_block_1 yellow_block_2) (clear red_block_1) (clear yellow_block_1) (clear green_block_2) (clear blue_block_1) (handempty) (hold_5) (hold_12) (= (total-cost) 0))
 (:goal (and (holding green_block_1) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6) (hold_8) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14)))
 (:metric minimize (total-cost))
)
