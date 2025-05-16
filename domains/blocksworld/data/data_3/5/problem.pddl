(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 red_block_1 brown_block_1 yellow_block_1 grey_block_1 blue_block_1 brown_block_2 - block
 )
 (:init (ontable white_block_1) (on red_block_1 white_block_1) (ontable brown_block_1) (ontable yellow_block_1) (ontable grey_block_1) (on blue_block_1 yellow_block_1) (on brown_block_2 blue_block_1) (clear red_block_1) (clear brown_block_1) (clear grey_block_1) (clear brown_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding red_block_1)))
 (:constraints (sometime (not (on grey_block_1 blue_block_1))) (sometime-after (not (on grey_block_1 blue_block_1)) (on yellow_block_1 blue_block_1)) (sometime (not (clear grey_block_1))) (sometime (not (clear red_block_1))) (sometime-before (not (clear red_block_1)) (or (on white_block_1 blue_block_1) (clear yellow_block_1))))
 (:metric minimize (total-cost))
)
