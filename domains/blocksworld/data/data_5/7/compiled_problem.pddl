(define (problem liftedtcore_blocksworld-problem)
 (:domain liftedtcore_blocksworld-domain)
 (:objects
 )
 (:init (ontable red_block_1) (ontable orange_block_1) (ontable red_block_2) (on black_block_1 orange_block_1) (on white_block_1 red_block_1) (on grey_block_1 black_block_1) (on yellow_block_1 grey_block_1) (clear red_block_2) (clear white_block_1) (clear yellow_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding red_block_2) (hold_0) (hold_1) (hold_3) (hold_4) (hold_5)))
 (:metric minimize (total-cost))
)
