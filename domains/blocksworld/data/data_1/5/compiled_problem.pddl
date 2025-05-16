(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   red_block_1 yellow_block_1 purple_block_1 grey_block_1 green_block_1 - block
 )
 (:init (ontable red_block_1) (ontable yellow_block_1) (ontable yellow_block_2) (on purple_block_1 red_block_1) (ontable grey_block_1) (ontable red_block_2) (on green_block_1 red_block_2) (clear yellow_block_1) (clear yellow_block_2) (clear purple_block_1) (clear grey_block_1) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding yellow_block_2) (hold_0)))
 (:metric minimize (total-cost))
)
