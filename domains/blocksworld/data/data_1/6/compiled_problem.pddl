(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   brown_block_1 blue_block_1 red_block_1 white_block_1 - block
 )
 (:init (ontable brown_block_1) (on grey_block_1 brown_block_1) (ontable brown_block_2) (on blue_block_1 grey_block_1) (ontable red_block_1) (on orange_block_1 brown_block_2) (ontable white_block_1) (clear blue_block_1) (clear red_block_1) (clear orange_block_1) (clear white_block_1) (handempty) (hold_1) (= (total-cost) 0))
 (:goal (and (holding brown_block_2) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
