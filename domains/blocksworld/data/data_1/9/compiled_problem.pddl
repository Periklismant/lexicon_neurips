(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   green_block_1 purple_block_1 purple_block_2 yellow_block_1 - block
 )
 (:init (ontable green_block_1) (ontable blue_block_1) (ontable purple_block_1) (on orange_block_1 green_block_1) (on purple_block_2 purple_block_1) (on yellow_block_1 blue_block_1) (ontable blue_block_2) (clear orange_block_1) (clear purple_block_2) (clear yellow_block_1) (clear blue_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on purple_block_1 yellow_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
