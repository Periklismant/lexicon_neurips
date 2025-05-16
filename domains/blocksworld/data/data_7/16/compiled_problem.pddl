(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable green_block_1) (ontable grey_block_1) (on grey_block_2 green_block_1) (on orange_block_1 grey_block_1) (on black_block_1 grey_block_2) (ontable black_block_2) (on brown_block_1 orange_block_1) (clear black_block_1) (clear black_block_2) (clear brown_block_1) (handempty) (hold_3) (hold_5) (= (total-cost) 0))
 (:goal (and (holding green_block_1) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7)))
 (:metric minimize (total-cost))
)
