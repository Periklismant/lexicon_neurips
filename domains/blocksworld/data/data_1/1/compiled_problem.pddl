(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   purple_block_1 blue_block_1 grey_block_1 blue_block_2 - block
 )
 (:init (ontable purple_block_1) (ontable blue_block_1) (ontable purple_block_2) (on grey_block_1 purple_block_1) (on blue_block_2 purple_block_2) (on black_block_1 blue_block_2) (on green_block_1 blue_block_1) (clear grey_block_1) (clear black_block_1) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable green_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
