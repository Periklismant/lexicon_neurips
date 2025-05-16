(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 black_block_1 black_block_2 yellow_block_1 white_block_1 black_block_3 black_block_4 - block
 )
 (:init (ontable green_block_1) (ontable black_block_1) (ontable black_block_2) (on yellow_block_1 green_block_1) (on white_block_1 black_block_2) (on black_block_3 white_block_1) (on black_block_4 black_block_3) (clear black_block_1) (clear yellow_block_1) (clear black_block_4) (handempty) (= (total-cost) 0))
 (:goal (and (ontable white_block_1)))
 (:constraints (sometime (and (on green_block_1 white_block_1) (holding black_block_1))))
 (:metric minimize (total-cost))
)
