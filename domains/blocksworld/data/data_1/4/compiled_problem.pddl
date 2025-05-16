(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   green_block_1 brown_block_1 grey_block_1 white_block_1 brown_block_2 - block
 )
 (:init (ontable green_block_1) (on brown_block_1 green_block_1) (on grey_block_1 brown_block_1) (ontable green_block_2) (on white_block_1 green_block_2) (on brown_block_2 white_block_1) (on green_block_3 brown_block_2) (clear grey_block_1) (clear green_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (ontable brown_block_2) (hold_0)))
 (:metric minimize (total-cost))
)
