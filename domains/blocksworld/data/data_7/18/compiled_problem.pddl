(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable orange_block_1) (on green_block_1 orange_block_1) (ontable blue_block_1) (on red_block_1 blue_block_1) (ontable black_block_1) (on orange_block_2 red_block_1) (on brown_block_1 orange_block_2) (clear green_block_1) (clear black_block_1) (clear brown_block_1) (handempty) (hold_0) (hold_4) (hold_6) (hold_10) (= (total-cost) 0))
 (:goal (and (holding green_block_1) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10) (hold_11)))
 (:metric minimize (total-cost))
)
