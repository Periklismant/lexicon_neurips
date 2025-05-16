(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   brown_block_1 brown_block_2 - block
 )
 (:init (ontable red_block_1) (ontable brown_block_1) (on brown_block_2 red_block_1) (ontable brown_block_3) (on blue_block_1 brown_block_2) (on red_block_2 brown_block_3) (on red_block_3 red_block_2) (clear brown_block_1) (clear blue_block_1) (clear red_block_3) (handempty) (hold_2) (= (total-cost) 0))
 (:goal (and (clear brown_block_2) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6)))
 (:metric minimize (total-cost))
)
