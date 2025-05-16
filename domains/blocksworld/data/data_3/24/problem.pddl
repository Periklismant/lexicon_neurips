(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   purple_block_1 green_block_1 blue_block_1 purple_block_2 brown_block_1 white_block_1 yellow_block_1 - block
 )
 (:init (ontable purple_block_1) (on green_block_1 purple_block_1) (on blue_block_1 green_block_1) (ontable purple_block_2) (on brown_block_1 blue_block_1) (on white_block_1 brown_block_1) (on yellow_block_1 white_block_1) (clear purple_block_2) (clear yellow_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear brown_block_1)))
 (:constraints (sometime (holding white_block_1)) (sometime-before (holding white_block_1) (holding purple_block_2)) (sometime (holding purple_block_1)) (always (not (ontable yellow_block_1))))
 (:metric minimize (total-cost))
)
