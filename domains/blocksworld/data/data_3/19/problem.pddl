(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   blue_block_1 grey_block_1 white_block_1 white_block_2 blue_block_2 yellow_block_1 brown_block_1 - block
 )
 (:init (ontable blue_block_1) (on grey_block_1 blue_block_1) (on white_block_1 grey_block_1) (ontable white_block_2) (ontable blue_block_2) (ontable yellow_block_1) (ontable brown_block_1) (clear white_block_1) (clear white_block_2) (clear blue_block_2) (clear yellow_block_1) (clear brown_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding yellow_block_1)))
 (:constraints (sometime (not (on yellow_block_1 blue_block_2))) (sometime-after (not (on yellow_block_1 blue_block_2)) (not (ontable white_block_2))) (sometime (holding blue_block_1)) (sometime (not (clear yellow_block_1))) (sometime-before (not (clear yellow_block_1)) (or (on grey_block_1 blue_block_2) (holding blue_block_2))))
 (:metric minimize (total-cost))
)
