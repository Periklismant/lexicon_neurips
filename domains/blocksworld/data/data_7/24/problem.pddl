(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   grey_block_1 brown_block_1 yellow_block_1 white_block_1 green_block_1 orange_block_1 blue_block_1 - block
 )
 (:init (ontable grey_block_1) (ontable brown_block_1) (on yellow_block_1 brown_block_1) (on white_block_1 yellow_block_1) (ontable green_block_1) (on orange_block_1 grey_block_1) (on blue_block_1 orange_block_1) (clear white_block_1) (clear green_block_1) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:constraints (sometime (not (clear grey_block_1))) (sometime-after (not (clear grey_block_1)) (on green_block_1 orange_block_1)) (sometime (not (ontable blue_block_1))) (sometime-after (not (ontable blue_block_1)) (or (on green_block_1 orange_block_1) (not (ontable brown_block_1)))) (sometime (not (ontable green_block_1))) (sometime-before (not (ontable green_block_1)) (or (ontable blue_block_1) (clear grey_block_1))) (sometime (holding orange_block_1)) (sometime (not (on grey_block_1 orange_block_1))) (sometime-after (not (on grey_block_1 orange_block_1)) (or (clear yellow_block_1) (clear grey_block_1))) (sometime (not (on brown_block_1 grey_block_1))) (sometime-after (not (on brown_block_1 grey_block_1)) (not (ontable brown_block_1))) (sometime (not (clear white_block_1))))
 (:metric minimize (total-cost))
)
