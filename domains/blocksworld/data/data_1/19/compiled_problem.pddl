(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   yellow_block_1 blue_block_1 brown_block_1 grey_block_1 green_block_1 white_block_1 - block
 )
 (:init (ontable yellow_block_1) (ontable blue_block_1) (ontable purple_block_1) (on brown_block_1 purple_block_1) (on grey_block_1 brown_block_1) (on green_block_1 blue_block_1) (on white_block_1 grey_block_1) (clear yellow_block_1) (clear green_block_1) (clear white_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on green_block_1 purple_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
