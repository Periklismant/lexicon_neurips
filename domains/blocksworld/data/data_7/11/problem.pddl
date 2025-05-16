(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 black_block_1 grey_block_1 grey_block_2 white_block_1 yellow_block_2 blue_block_1 - block
 )
 (:init (ontable yellow_block_1) (ontable black_block_1) (ontable grey_block_1) (on grey_block_2 grey_block_1) (on white_block_1 yellow_block_1) (ontable yellow_block_2) (ontable blue_block_1) (clear black_block_1) (clear grey_block_2) (clear white_block_1) (clear yellow_block_2) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on blue_block_1 yellow_block_2)))
 (:constraints (sometime (and (holding grey_block_1) (on blue_block_1 black_block_1))) (sometime (clear grey_block_1)) (sometime (or (on grey_block_1 white_block_1) (clear yellow_block_1))) (sometime (and (not (ontable yellow_block_1)) (not (clear black_block_1)))) (sometime (not (ontable blue_block_1))) (sometime-before (not (ontable blue_block_1)) (not (clear yellow_block_2))) (sometime (clear yellow_block_2)) (sometime-after (clear yellow_block_2) (or (on blue_block_1 black_block_1) (ontable grey_block_2))) (sometime (holding blue_block_1)) (sometime-before (holding blue_block_1) (on grey_block_2 blue_block_1)))
 (:metric minimize (total-cost))
)
