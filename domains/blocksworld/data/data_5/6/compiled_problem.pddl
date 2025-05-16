(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable purple_block_1) (on brown_block_1 purple_block_1) (on yellow_block_1 brown_block_1) (ontable purple_block_2) (ontable black_block_1) (ontable orange_block_1) (on white_block_1 yellow_block_1) (clear purple_block_2) (clear black_block_1) (clear orange_block_1) (clear white_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding orange_block_1) (hold_0) (hold_2) (hold_3) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
