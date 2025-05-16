(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   white_block_3 orange_block_2 - block
 )
 (:init (ontable white_block_1) (ontable white_block_2) (on purple_block_1 white_block_1) (on red_block_1 purple_block_1) (ontable white_block_3) (on orange_block_1 red_block_1) (on orange_block_2 white_block_2) (clear white_block_3) (clear orange_block_1) (clear orange_block_2) (handempty) (hold_0) (hold_2) (= (total-cost) 0))
 (:goal (and (on white_block_2 purple_block_1) (hold_0) (hold_1) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
