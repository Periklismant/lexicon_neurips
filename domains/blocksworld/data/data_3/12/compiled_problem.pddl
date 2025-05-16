(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   grey_block_1 red_block_1 - block
 )
 (:init (ontable blue_block_1) (on black_block_1 blue_block_1) (on grey_block_1 black_block_1) (ontable yellow_block_1) (on grey_block_2 grey_block_1) (on brown_block_1 yellow_block_1) (ontable red_block_1) (clear grey_block_2) (clear brown_block_1) (clear red_block_1) (handempty) (hold_0) (= (total-cost) 0))
 (:goal (and (holding grey_block_1) (hold_0) (hold_1) (hold_2)))
 (:metric minimize (total-cost))
)
