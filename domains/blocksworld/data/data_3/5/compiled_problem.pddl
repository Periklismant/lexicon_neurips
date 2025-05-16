(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   brown_block_1 brown_block_2 - block
 )
 (:init (ontable white_block_1) (on red_block_1 white_block_1) (ontable brown_block_1) (ontable yellow_block_1) (ontable grey_block_1) (on blue_block_1 yellow_block_1) (on brown_block_2 blue_block_1) (clear red_block_1) (clear brown_block_1) (clear grey_block_1) (clear brown_block_2) (handempty) (hold_0) (= (total-cost) 0))
 (:goal (and (holding red_block_1) (hold_0) (hold_1) (hold_2) (hold_3)))
 (:metric minimize (total-cost))
)
