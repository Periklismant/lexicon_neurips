(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 yellow_block_1 black_block_1 green_block_2 yellow_block_2 yellow_block_3 grey_block_1 - block
 )
 (:init (ontable green_block_1) (on yellow_block_1 green_block_1) (ontable black_block_1) (on green_block_2 black_block_1) (on yellow_block_2 yellow_block_1) (on yellow_block_3 green_block_2) (ontable grey_block_1) (clear yellow_block_2) (clear yellow_block_3) (clear grey_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear black_block_1)))
 (:constraints (sometime (or (holding grey_block_1) (on grey_block_1 yellow_block_3))) (always (not (ontable yellow_block_3))) (sometime (not (on black_block_1 grey_block_1))) (sometime-after (not (on black_block_1 grey_block_1)) (not (ontable black_block_1))) (sometime (on yellow_block_1 grey_block_1)) (sometime (clear green_block_2)) (sometime-before (clear green_block_2) (or (holding yellow_block_1) (not (on yellow_block_2 yellow_block_1)))) (sometime (and (not (clear grey_block_1)) (ontable yellow_block_2))) (sometime (not (clear green_block_1))) (sometime-after (not (clear green_block_1)) (holding yellow_block_2)))
 (:metric minimize (total-cost))
)
