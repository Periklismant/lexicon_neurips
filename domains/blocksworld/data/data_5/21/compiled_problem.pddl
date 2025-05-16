(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable grey_block_1) (on brown_block_1 grey_block_1) (ontable purple_block_1) (on yellow_block_1 purple_block_1) (on grey_block_2 brown_block_1) (on yellow_block_2 yellow_block_1) (ontable purple_block_2) (clear grey_block_2) (clear yellow_block_2) (clear purple_block_2) (handempty) (hold_3) (hold_5) (hold_6) (= (total-cost) 0))
 (:goal (and (on yellow_block_1 brown_block_1) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
