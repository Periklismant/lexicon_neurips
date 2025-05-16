(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 brown_block_1 black_block_1 blue_block_1 black_block_2 yellow_block_1 green_block_1 - block
 )
 (:init (ontable red_block_1) (on brown_block_1 red_block_1) (ontable black_block_1) (on blue_block_1 black_block_1) (on black_block_2 blue_block_1) (ontable yellow_block_1) (on green_block_1 yellow_block_1) (clear brown_block_1) (clear black_block_2) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable brown_block_1)))
 (:constraints (sometime (not (clear black_block_2))) (sometime (not (on black_block_1 brown_block_1))) (sometime-after (not (on black_block_1 brown_block_1)) (or (not (ontable red_block_1)) (not (clear brown_block_1)))) (sometime (holding blue_block_1)) (sometime (and (on yellow_block_1 black_block_1) (clear yellow_block_1))) (sometime (not (ontable green_block_1))) (sometime-after (not (ontable green_block_1)) (or (clear yellow_block_1) (not (clear green_block_1)))) (sometime (and (not (ontable black_block_1)) (ontable green_block_1))) (sometime (on yellow_block_1 black_block_1)) (sometime (not (clear brown_block_1))) (sometime-before (not (clear brown_block_1)) (or (holding green_block_1) (holding yellow_block_1))) (sometime (not (on brown_block_1 blue_block_1))) (sometime-after (not (on brown_block_1 blue_block_1)) (or (on yellow_block_1 red_block_1) (holding blue_block_1))) (sometime (not (on black_block_2 yellow_block_1))) (sometime-after (not (on black_block_2 yellow_block_1)) (not (ontable yellow_block_1))))
 (:metric minimize (total-cost))
)
