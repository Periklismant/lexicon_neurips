(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable red_block_1) (on brown_block_1 red_block_1) (ontable black_block_1) (on blue_block_1 black_block_1) (on black_block_2 blue_block_1) (ontable yellow_block_1) (on green_block_1 yellow_block_1) (clear brown_block_1) (clear black_block_2) (clear green_block_1) (handempty) (hold_1) (hold_5) (= (total-cost) 0))
 (:goal (and (ontable brown_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8)))
 (:metric minimize (total-cost))
)
