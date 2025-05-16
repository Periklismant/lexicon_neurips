(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   purple_block_1 brown_block_1 purple_block_2 - block
 )
 (:init (ontable purple_block_1) (on brown_block_1 purple_block_1) (on yellow_block_1 brown_block_1) (ontable purple_block_2) (ontable black_block_1) (ontable orange_block_1) (on white_block_1 yellow_block_1) (clear purple_block_2) (clear black_block_1) (clear orange_block_1) (clear white_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding orange_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
