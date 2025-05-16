(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable white_block_1) (on red_block_1 white_block_1) (ontable brown_block_1) (on black_block_1 brown_block_1) (on green_block_1 red_block_1) (on brown_block_2 black_block_1) (ontable black_block_2) (clear green_block_1) (clear brown_block_2) (clear black_block_2) (handempty) (hold_1) (hold_2) (hold_6) (hold_9) (= (total-cost) 0))
 (:goal (and (on brown_block_1 green_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
