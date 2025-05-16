(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   white_block_1 - block
 )
 (:init (ontable yellow_block_1) (ontable purple_block_1) (ontable black_block_1) (on orange_block_1 black_block_1) (on yellow_block_2 yellow_block_1) (on white_block_1 orange_block_1) (on orange_block_2 purple_block_1) (clear yellow_block_2) (clear white_block_1) (clear orange_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding orange_block_2) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
