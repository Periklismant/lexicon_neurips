(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   blue_block_2 red_block_1 grey_block_1 - block
 )
 (:init (ontable blue_block_1) (ontable black_block_1) (on blue_block_2 blue_block_1) (on red_block_1 blue_block_2) (ontable grey_block_1) (on purple_block_1 red_block_1) (on green_block_1 grey_block_1) (clear black_block_1) (clear purple_block_1) (clear green_block_1) (handempty) (hold_1) (= (total-cost) 0))
 (:goal (and (on blue_block_1 purple_block_1) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
