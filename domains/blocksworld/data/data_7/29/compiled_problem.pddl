(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   yellow_block_1 - block
 )
 (:init (ontable yellow_block_1) (on purple_block_1 yellow_block_1) (ontable white_block_1) (on black_block_1 white_block_1) (ontable grey_block_1) (on blue_block_1 black_block_1) (ontable blue_block_2) (clear purple_block_1) (clear grey_block_1) (clear blue_block_1) (clear blue_block_2) (handempty) (hold_4) (= (total-cost) 0))
 (:goal (and (holding grey_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7)))
 (:metric minimize (total-cost))
)
