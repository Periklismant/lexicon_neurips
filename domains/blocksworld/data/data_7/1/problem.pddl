(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   black_block_1 red_block_1 black_block_2 orange_block_1 green_block_1 brown_block_1 green_block_2 - block
 )
 (:init (ontable black_block_1) (ontable red_block_1) (on black_block_2 red_block_1) (ontable orange_block_1) (on green_block_1 black_block_2) (on brown_block_1 orange_block_1) (on green_block_2 brown_block_1) (clear black_block_1) (clear green_block_1) (clear green_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (clear red_block_1)))
 (:constraints (sometime (holding black_block_2)) (sometime-before (holding black_block_2) (or (not (clear green_block_2)) (holding orange_block_1))) (sometime (or (on black_block_2 green_block_2) (not (ontable red_block_1)))) (always (not (ontable green_block_1))) (sometime (or (not (ontable orange_block_1)) (on green_block_1 red_block_1))) (sometime (and (on black_block_2 black_block_1) (ontable green_block_2))) (sometime (holding red_block_1)) (sometime (not (clear orange_block_1))) (sometime-after (not (clear orange_block_1)) (or (not (clear black_block_1)) (not (clear green_block_2)))))
 (:metric minimize (total-cost))
)
