(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   purple_block_1 red_block_1 purple_block_2 white_block_1 - block
 )
 (:init (ontable purple_block_1) (on red_block_1 purple_block_1) (on purple_block_2 red_block_1) (ontable grey_block_1) (ontable purple_block_3) (on brown_block_1 purple_block_3) (on white_block_1 grey_block_1) (clear purple_block_2) (clear brown_block_1) (clear white_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable brown_block_1) (hold_0)))
 (:metric minimize (total-cost))
)
