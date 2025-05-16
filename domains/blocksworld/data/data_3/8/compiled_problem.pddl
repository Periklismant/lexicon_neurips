(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   purple_block_3 - block
 )
 (:init (ontable green_block_1) (ontable white_block_1) (on purple_block_1 green_block_1) (on blue_block_1 white_block_1) (ontable red_block_1) (on purple_block_2 purple_block_1) (on purple_block_3 red_block_1) (clear blue_block_1) (clear purple_block_2) (clear purple_block_3) (handempty) (hold_2) (= (total-cost) 0))
 (:goal (and (on red_block_1 purple_block_3) (hold_0) (hold_1) (hold_2) (hold_3)))
 (:metric minimize (total-cost))
)
