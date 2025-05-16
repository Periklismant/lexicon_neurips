(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   red_block_1 white_block_1 grey_block_1 brown_block_1 blue_block_1 orange_block_1 - block
 )
 (:init (ontable red_block_1) (ontable white_block_1) (on grey_block_1 red_block_1) (on brown_block_1 grey_block_1) (on blue_block_1 white_block_1) (ontable orange_block_1) (ontable orange_block_2) (clear brown_block_1) (clear blue_block_1) (clear orange_block_1) (clear orange_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (clear white_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
