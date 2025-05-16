(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   white_block_1 black_block_2 - block
 )
 (:init (ontable purple_block_1) (ontable white_block_1) (ontable grey_block_1) (ontable brown_block_1) (ontable black_block_1) (on black_block_2 black_block_1) (on purple_block_2 purple_block_1) (clear white_block_1) (clear grey_block_1) (clear brown_block_1) (clear black_block_2) (clear purple_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding purple_block_1) (hold_0) (hold_2)))
 (:metric minimize (total-cost))
)
