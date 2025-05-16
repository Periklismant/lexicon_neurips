(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   white_block_2 white_block_3 - block
 )
 (:init (ontable white_block_1) (on white_block_2 white_block_1) (on green_block_1 white_block_2) (on brown_block_1 green_block_1) (ontable yellow_block_1) (ontable orange_block_1) (on white_block_3 orange_block_1) (clear brown_block_1) (clear yellow_block_1) (clear white_block_3) (handempty) (hold_0) (= (total-cost) 0))
 (:goal (and (ontable brown_block_1) (hold_0) (hold_1) (hold_2) (hold_4)))
 (:metric minimize (total-cost))
)
