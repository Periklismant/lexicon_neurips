(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   black_block_1 white_block_1 yellow_block_1 white_block_2 green_block_1 red_block_1 black_block_2 - block
 )
 (:init (ontable black_block_1) (on white_block_1 black_block_1) (ontable yellow_block_1) (on white_block_2 white_block_1) (ontable green_block_1) (on red_block_1 green_block_1) (ontable black_block_2) (clear yellow_block_1) (clear white_block_2) (clear red_block_1) (clear black_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on black_block_2 red_block_1)))
 (:constraints (sometime (not (clear black_block_2))) (sometime-before (not (clear black_block_2)) (not (on red_block_1 green_block_1))) (sometime (not (clear red_block_1))) (sometime-before (not (clear red_block_1)) (and (not (clear yellow_block_1)) (holding white_block_1))) (sometime (not (on red_block_1 green_block_1))) (sometime (not (ontable white_block_1))) (sometime-after (not (ontable white_block_1)) (holding green_block_1)) (sometime (not (ontable black_block_2))) (sometime-after (not (ontable black_block_2)) (not (clear yellow_block_1))) (sometime (not (clear white_block_2))) (sometime (or (holding white_block_2) (ontable white_block_1))) (sometime (not (clear green_block_1))) (sometime-after (not (clear green_block_1)) (on black_block_1 yellow_block_1)) (sometime (not (on white_block_2 green_block_1))) (sometime-after (not (on white_block_2 green_block_1)) (clear green_block_1)) (sometime (not (on black_block_2 white_block_1))) (sometime-after (not (on black_block_2 white_block_1)) (and (on yellow_block_1 white_block_2) (ontable white_block_1))))
 (:metric minimize (total-cost))
)
