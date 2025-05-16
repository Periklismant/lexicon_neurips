(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on blue_block_1 black_block_1) (on black_block_2 red_block_1) (on yellow_block_1 blue_block_1) (ontable black_block_3) (on purple_block_1 yellow_block_1) (clear black_block_2) (clear black_block_3) (clear purple_block_1) (handempty) (hold_6) (hold_9) (= (total-cost) 0))
 (:goal (and (clear yellow_block_1) (hold_0) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10)))
 (:metric minimize (total-cost))
)
