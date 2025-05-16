(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   blue_block_1 - block
 )
 (:init (ontable blue_block_1) (ontable black_block_1) (ontable blue_block_2) (on blue_block_3 black_block_1) (ontable white_block_1) (on white_block_2 blue_block_2) (ontable brown_block_1) (clear blue_block_1) (clear blue_block_3) (clear white_block_1) (clear white_block_2) (clear brown_block_1) (handempty) (hold_1) (hold_7) (hold_10) (hold_13) (= (total-cost) 0))
 (:goal (and (holding white_block_1) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11) (hold_12) (hold_13) (hold_14)))
 (:metric minimize (total-cost))
)
