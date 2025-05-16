(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   yellow_block_1 grey_block_1 black_block_1 white_block_2 - block
 )
 (:init (ontable brown_block_1) (ontable yellow_block_1) (on white_block_1 brown_block_1) (on grey_block_1 yellow_block_1) (on black_block_1 grey_block_1) (ontable red_block_1) (on white_block_2 black_block_1) (clear white_block_1) (clear red_block_1) (clear white_block_2) (handempty) (hold_1) (= (total-cost) 0))
 (:goal (and (holding brown_block_1) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
