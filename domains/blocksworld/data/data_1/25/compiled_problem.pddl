(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   yellow_block_1 yellow_block_2 purple_block_2 - block
 )
 (:init (ontable grey_block_1) (on brown_block_1 grey_block_1) (ontable purple_block_1) (on yellow_block_1 purple_block_1) (on grey_block_2 brown_block_1) (on yellow_block_2 yellow_block_1) (ontable purple_block_2) (clear grey_block_2) (clear yellow_block_2) (clear purple_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on yellow_block_1 brown_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
