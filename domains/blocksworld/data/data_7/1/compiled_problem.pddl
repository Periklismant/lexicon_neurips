(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
   brown_block_1 - block
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on black_block_2 red_block_1) (ontable orange_block_1) (on green_block_1 black_block_2) (on brown_block_1 orange_block_1) (on green_block_2 brown_block_1) (clear black_block_1) (clear green_block_1) (clear green_block_2) (handempty) (hold_6) (= (total-cost) 0))
 (:goal (and (clear red_block_1) (hold_0) (hold_2) (hold_3) (hold_4) (hold_5) (hold_6) (hold_7)))
 (:metric minimize (total-cost))
)
