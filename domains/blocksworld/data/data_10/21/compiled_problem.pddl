(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable green_block_1) (on yellow_block_1 green_block_1) (ontable black_block_1) (on green_block_2 black_block_1) (on yellow_block_2 yellow_block_1) (on yellow_block_3 green_block_2) (ontable grey_block_1) (clear yellow_block_2) (clear yellow_block_3) (clear grey_block_1) (handempty) (hold_1) (hold_7) (= (total-cost) 0))
 (:goal (and (clear black_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
