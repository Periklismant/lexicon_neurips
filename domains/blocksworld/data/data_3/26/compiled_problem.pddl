(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   brown_block_2 green_block_1 - block
 )
 (:init (ontable red_block_1) (on brown_block_1 red_block_1) (on brown_block_2 brown_block_1) (ontable brown_block_3) (on purple_block_1 brown_block_3) (ontable red_block_2) (on green_block_1 red_block_2) (clear brown_block_2) (clear purple_block_1) (clear green_block_1) (handempty) (hold_3) (= (total-cost) 0))
 (:goal (and (clear brown_block_3) (hold_0) (hold_2) (hold_3) (hold_4)))
 (:metric minimize (total-cost))
)
