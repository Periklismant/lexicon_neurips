(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   grey_block_1 brown_block_1 purple_block_1 yellow_block_1 grey_block_2 yellow_block_2 purple_block_2 - block
 )
 (:init (ontable grey_block_1) (on brown_block_1 grey_block_1) (ontable purple_block_1) (on yellow_block_1 purple_block_1) (on grey_block_2 brown_block_1) (on yellow_block_2 yellow_block_1) (ontable purple_block_2) (clear grey_block_2) (clear yellow_block_2) (clear purple_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (on yellow_block_1 brown_block_1)))
 (:constraints (sometime (and (on purple_block_1 brown_block_1) (on grey_block_2 grey_block_1))) (always (not (ontable yellow_block_2))) (sometime (holding yellow_block_1)) (sometime-before (holding yellow_block_1) (or (not (ontable purple_block_2)) (holding purple_block_2))) (sometime (not (clear brown_block_1))) (sometime-after (not (clear brown_block_1)) (or (clear brown_block_1) (holding grey_block_2))) (sometime (not (ontable brown_block_1))) (sometime-after (not (ontable brown_block_1)) (not (clear purple_block_1))))
 (:metric minimize (total-cost))
)
