(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable blue_block_1) (on black_block_1 blue_block_1) (on grey_block_1 black_block_1) (ontable yellow_block_1) (on grey_block_2 grey_block_1) (on brown_block_1 yellow_block_1) (ontable red_block_1) (clear grey_block_2) (clear brown_block_1) (clear red_block_1) (handempty) (hold_0) (hold_4) (hold_6) (hold_9) (= (total-cost) 0))
 (:goal (and (holding grey_block_1) (hold_0) (hold_1) (hold_2) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9) (hold_10)))
 (:metric minimize (total-cost))
)
