(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable white_block_1) (ontable purple_block_1) (on grey_block_1 white_block_1) (on purple_block_2 grey_block_1) (on orange_block_1 purple_block_1) (on yellow_block_1 purple_block_2) (on blue_block_1 yellow_block_1) (clear orange_block_1) (clear blue_block_1) (handempty) (hold_0) (hold_4) (= (total-cost) 0))
 (:goal (and (clear grey_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
