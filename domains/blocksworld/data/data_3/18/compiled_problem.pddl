(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   purple_block_1 brown_block_1 - block
 )
 (:init (ontable purple_block_1) (ontable black_block_1) (on purple_block_2 black_block_1) (on grey_block_1 purple_block_1) (on brown_block_1 grey_block_1) (on brown_block_2 brown_block_1) (on grey_block_2 brown_block_2) (clear purple_block_2) (clear grey_block_2) (handempty) (hold_0) (hold_3) (= (total-cost) 0))
 (:goal (and (clear black_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
