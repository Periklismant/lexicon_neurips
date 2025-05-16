(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   blue_block_1 - block
 )
 (:init (ontable green_block_1) (ontable purple_block_1) (on red_block_1 purple_block_1) (ontable brown_block_1) (on yellow_block_1 brown_block_1) (on blue_block_1 green_block_1) (on orange_block_1 blue_block_1) (clear red_block_1) (clear yellow_block_1) (clear orange_block_1) (handempty) (hold_2) (hold_3) (= (total-cost) 0))
 (:goal (and (on green_block_1 yellow_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_6) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
