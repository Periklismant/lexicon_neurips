(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   red_block_1 black_block_1 brown_block_1 orange_block_1 green_block_1 black_block_2 yellow_block_1 - block
 )
 (:init (ontable red_block_1) (ontable black_block_1) (on brown_block_1 red_block_1) (on orange_block_1 black_block_1) (on green_block_1 brown_block_1) (on black_block_2 orange_block_1) (ontable yellow_block_1) (clear green_block_1) (clear black_block_2) (clear yellow_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on brown_block_1 orange_block_1)))
 (:constraints (always (not (ontable black_block_2))) (sometime (not (clear black_block_1))) (sometime-after (not (clear black_block_1)) (or (not (clear brown_block_1)) (holding red_block_1))) (sometime (clear orange_block_1)) (sometime-before (clear orange_block_1) (or (not (clear yellow_block_1)) (ontable orange_block_1))))
 (:metric minimize (total-cost))
)
