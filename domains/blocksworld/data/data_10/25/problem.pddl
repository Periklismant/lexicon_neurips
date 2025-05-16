(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 grey_block_1 grey_block_2 orange_block_1 black_block_1 black_block_2 brown_block_1 - block
 )
 (:init (ontable green_block_1) (ontable grey_block_1) (on grey_block_2 green_block_1) (on orange_block_1 grey_block_1) (on black_block_1 grey_block_2) (ontable black_block_2) (on brown_block_1 orange_block_1) (clear black_block_1) (clear black_block_2) (clear brown_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:constraints (sometime (and (holding orange_block_1) (not (clear black_block_2)))) (sometime (not (clear black_block_1))) (sometime-before (not (clear black_block_1)) (or (ontable brown_block_1) (not (ontable grey_block_1)))) (always (not (ontable black_block_1))) (sometime (on grey_block_2 green_block_1)) (sometime-after (on grey_block_2 green_block_1) (on grey_block_2 black_block_2)) (always (not (ontable grey_block_2))) (sometime (not (on grey_block_2 orange_block_1))) (sometime-after (not (on grey_block_2 orange_block_1)) (on brown_block_1 grey_block_2)) (sometime (or (ontable brown_block_1) (holding grey_block_1))) (sometime (and (not (clear brown_block_1)) (on orange_block_1 black_block_2))) (sometime (clear green_block_1)) (sometime-before (clear green_block_1) (or (clear orange_block_1) (ontable brown_block_1))) (sometime (clear grey_block_1)))
 (:metric minimize (total-cost))
)
