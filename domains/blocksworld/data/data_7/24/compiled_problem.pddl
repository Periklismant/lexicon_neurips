(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable grey_block_1) (ontable brown_block_1) (on yellow_block_1 brown_block_1) (on white_block_1 yellow_block_1) (ontable green_block_1) (on orange_block_1 grey_block_1) (on blue_block_1 orange_block_1) (clear white_block_1) (clear green_block_1) (clear blue_block_1) (handempty) (hold_0) (hold_2) (hold_7) (hold_9) (= (total-cost) 0))
 (:goal (and (holding green_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
