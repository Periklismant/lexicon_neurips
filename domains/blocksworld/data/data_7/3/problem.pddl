(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   black_block_1 red_block_1 blue_block_1 black_block_2 yellow_block_1 black_block_3 purple_block_1 - block
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on blue_block_1 black_block_1) (on black_block_2 red_block_1) (on yellow_block_1 blue_block_1) (ontable black_block_3) (on purple_block_1 yellow_block_1) (clear black_block_2) (clear black_block_3) (clear purple_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear yellow_block_1)))
 (:constraints (sometime (holding purple_block_1)) (sometime-before (holding purple_block_1) (ontable black_block_2)) (sometime (not (clear purple_block_1))) (sometime-before (not (clear purple_block_1)) (or (holding purple_block_1) (not (clear black_block_2)))) (sometime (or (holding yellow_block_1) (ontable blue_block_1))) (sometime (or (not (ontable black_block_1)) (on blue_block_1 black_block_2))) (sometime (not (ontable purple_block_1))) (sometime-after (not (ontable purple_block_1)) (or (holding black_block_2) (clear red_block_1))) (sometime (holding red_block_1)) (sometime (not (ontable yellow_block_1))) (sometime-after (not (ontable yellow_block_1)) (or (clear red_block_1) (on black_block_3 red_block_1))))
 (:metric minimize (total-cost))
)
