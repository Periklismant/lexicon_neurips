(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable blue_block_1) (ontable black_block_1) (on blue_block_2 blue_block_1) (on red_block_1 blue_block_2) (ontable grey_block_1) (on purple_block_1 red_block_1) (on green_block_1 grey_block_1) (clear black_block_1) (clear purple_block_1) (clear green_block_1) (handempty) (hold_1) (hold_6) (hold_7) (= (total-cost) 0))
 (:goal (and (on blue_block_1 purple_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_11)))
 (:metric minimize (total-cost))
)
