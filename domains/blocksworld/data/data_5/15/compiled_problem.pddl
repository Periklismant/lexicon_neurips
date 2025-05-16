(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   blue_block_2 - block
 )
 (:init (ontable white_block_1) (ontable purple_block_1) (on blue_block_1 white_block_1) (on red_block_1 purple_block_1) (ontable grey_block_1) (on white_block_2 blue_block_1) (on blue_block_2 white_block_2) (clear red_block_1) (clear grey_block_1) (clear blue_block_2) (handempty) (hold_0) (hold_2) (hold_4) (= (total-cost) 0))
 (:goal (and (ontable blue_block_2) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_8)))
 (:metric minimize (total-cost))
)
