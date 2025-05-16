(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 black_block_1 black_block_2 yellow_block_1 white_block_1 black_block_3 black_block_4 - block
 )
 (:init (ontable green_block_1) (ontable black_block_1) (ontable black_block_2) (on yellow_block_1 green_block_1) (on white_block_1 black_block_2) (on black_block_3 white_block_1) (on black_block_4 black_block_3) (clear black_block_1) (clear yellow_block_1) (clear black_block_4) (handempty) (= (total-cost) 0))
 (:goal (and (ontable white_block_1)))
 (:constraints (sometime (and (on green_block_1 white_block_1) (holding black_block_1))) (sometime (holding white_block_1)) (sometime-after (holding white_block_1) (or (not (clear black_block_1)) (not (clear black_block_4)))) (sometime (not (on black_block_3 yellow_block_1))) (sometime-after (not (on black_block_3 yellow_block_1)) (or (not (ontable black_block_2)) (holding green_block_1))) (always (not (ontable black_block_3))) (sometime (not (on black_block_4 yellow_block_1))) (sometime-after (not (on black_block_4 yellow_block_1)) (not (clear black_block_2))) (sometime (holding green_block_1)) (sometime (on white_block_1 black_block_1)))
 (:metric minimize (total-cost))
)
