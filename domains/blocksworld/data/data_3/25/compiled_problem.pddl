(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   red_block_1 - block
 )
 (:init (ontable orange_block_1) (on green_block_1 orange_block_1) (ontable blue_block_1) (on red_block_1 blue_block_1) (ontable black_block_1) (on orange_block_2 red_block_1) (on brown_block_1 orange_block_2) (clear green_block_1) (clear black_block_1) (clear brown_block_1) (handempty) (hold_0) (hold_4) (= (total-cost) 0))
 (:goal (and (holding green_block_1) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
