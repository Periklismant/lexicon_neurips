(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   green_block_1 - block
 )
 (:init (ontable yellow_block_1) (ontable brown_block_1) (on brown_block_2 yellow_block_1) (on purple_block_1 brown_block_1) (on black_block_1 purple_block_1) (ontable orange_block_1) (on green_block_1 black_block_1) (clear brown_block_2) (clear orange_block_1) (clear green_block_1) (handempty) (hold_6) (hold_7) (= (total-cost) 0))
 (:goal (and (on brown_block_1 orange_block_1) (hold_0) (hold_1) (hold_3) (hold_5) (hold_6) (hold_7)))
 (:metric minimize (total-cost))
)
