(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   orange_block_1 yellow_block_1 black_block_1 black_block_2 white_block_1 red_block_1 blue_block_1 - block
 )
 (:init (ontable orange_block_1) (on yellow_block_1 orange_block_1) (on black_block_1 yellow_block_1) (ontable black_block_2) (ontable white_block_1) (on red_block_1 white_block_1) (on blue_block_1 black_block_2) (clear black_block_1) (clear red_block_1) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding blue_block_1)))
 (:constraints (sometime (not (clear blue_block_1))) (sometime-before (not (clear blue_block_1)) (ontable red_block_1)) (sometime (clear yellow_block_1)) (sometime (on red_block_1 orange_block_1)) (sometime (ontable yellow_block_1)) (sometime (not (on blue_block_1 white_block_1))) (sometime-after (not (on blue_block_1 white_block_1)) (clear yellow_block_1)) (sometime (ontable red_block_1)) (sometime (or (on black_block_2 red_block_1) (not (clear black_block_1)))) (sometime (not (ontable black_block_1))) (sometime-after (not (ontable black_block_1)) (on white_block_1 blue_block_1)) (sometime (not (clear yellow_block_1))) (sometime-after (not (clear yellow_block_1)) (holding black_block_1)) (sometime (and (holding yellow_block_1) (not (clear red_block_1)))))
 (:metric minimize (total-cost))
)
