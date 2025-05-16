(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable yellow_block_1) (ontable black_block_1) (on green_block_1 yellow_block_1) (ontable purple_block_1) (on red_block_1 black_block_1) (on purple_block_2 red_block_1) (ontable black_block_2) (clear green_block_1) (clear purple_block_1) (clear purple_block_2) (clear black_block_2) (handempty) (hold_4) (= (total-cost) 0))
 (:goal (and (on red_block_1 yellow_block_1) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5) (hold_6) (hold_8) (hold_9)))
 (:metric minimize (total-cost))
)
