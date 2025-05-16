(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   white_block_1 purple_block_1 grey_block_1 purple_block_2 orange_block_1 yellow_block_1 blue_block_1 - block
 )
 (:init (ontable white_block_1) (ontable purple_block_1) (on grey_block_1 white_block_1) (on purple_block_2 grey_block_1) (on orange_block_1 purple_block_1) (on yellow_block_1 purple_block_2) (on blue_block_1 yellow_block_1) (clear orange_block_1) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (clear grey_block_1)))
 (:constraints (sometime (not (ontable grey_block_1))) (sometime-after (not (ontable grey_block_1)) (or (not (clear blue_block_1)) (clear purple_block_2))) (sometime (and (holding purple_block_1) (on white_block_1 purple_block_2))) (always (not (ontable yellow_block_1))) (sometime (on orange_block_1 blue_block_1)) (always (not (ontable blue_block_1))) (sometime (not (clear white_block_1))) (sometime-after (not (clear white_block_1)) (ontable purple_block_2)) (sometime (or (ontable purple_block_2) (holding purple_block_1))))
 (:metric minimize (total-cost))
)
