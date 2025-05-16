(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   red_block_1 blue_block_1 brown_block_2 - block
 )
 (:init (ontable brown_block_1) (ontable red_block_1) (on grey_block_1 red_block_1) (ontable red_block_2) (on blue_block_1 grey_block_1) (on brown_block_2 blue_block_1) (on brown_block_3 brown_block_1) (clear red_block_2) (clear brown_block_2) (clear brown_block_3) (handempty) (hold_0) (= (total-cost) 0))
 (:goal (and (holding brown_block_1) (hold_0) (hold_1)))
 (:metric minimize (total-cost))
)
