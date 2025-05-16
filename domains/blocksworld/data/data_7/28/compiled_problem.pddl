(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable orange_block_1) (ontable black_block_1) (ontable white_block_1) (ontable purple_block_1) (on white_block_2 orange_block_1) (ontable grey_block_1) (on yellow_block_1 grey_block_1) (clear black_block_1) (clear white_block_1) (clear purple_block_1) (clear white_block_2) (clear yellow_block_1) (handempty) (hold_4) (hold_9) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_9) (hold_10)))
 (:metric minimize (total-cost))
)
