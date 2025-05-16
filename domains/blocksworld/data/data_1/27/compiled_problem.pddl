(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   yellow_block_1 grey_block_2 white_block_1 yellow_block_2 - block
 )
 (:init (ontable yellow_block_1) (ontable black_block_1) (ontable grey_block_1) (on grey_block_2 grey_block_1) (on white_block_1 yellow_block_1) (ontable yellow_block_2) (ontable blue_block_1) (clear black_block_1) (clear grey_block_2) (clear white_block_1) (clear yellow_block_2) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on blue_block_1 yellow_block_2) (hold_0)))
 (:metric minimize (total-cost))
)
