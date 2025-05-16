(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   red_block_1 purple_block_2 - block
 )
 (:init (ontable purple_block_1) (on red_block_1 purple_block_1) (on purple_block_2 red_block_1) (ontable grey_block_1) (ontable purple_block_3) (on brown_block_1 purple_block_3) (on white_block_1 grey_block_1) (clear purple_block_2) (clear brown_block_1) (clear white_block_1) (handempty) (hold_2) (hold_4) (hold_5) (= (total-cost) 0))
 (:goal (and (ontable brown_block_1) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
