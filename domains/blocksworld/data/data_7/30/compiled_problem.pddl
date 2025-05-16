(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   grey_block_1 - block
 )
 (:init (ontable grey_block_1) (ontable white_block_1) (on purple_block_1 white_block_1) (on white_block_2 purple_block_1) (ontable red_block_1) (on yellow_block_1 red_block_1) (on blue_block_1 yellow_block_1) (clear grey_block_1) (clear white_block_2) (clear blue_block_1) (handempty) (hold_4) (hold_5) (hold_6) (hold_7) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
