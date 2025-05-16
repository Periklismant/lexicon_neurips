(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   purple_block_1 black_block_1 purple_block_2 grey_block_1 brown_block_1 brown_block_2 grey_block_2 - block
 )
 (:init (ontable purple_block_1) (ontable black_block_1) (on purple_block_2 black_block_1) (on grey_block_1 purple_block_1) (on brown_block_1 grey_block_1) (on brown_block_2 brown_block_1) (on grey_block_2 brown_block_2) (clear purple_block_2) (clear grey_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (clear black_block_1)))
 (:constraints (sometime (not (clear grey_block_1))) (sometime-after (not (clear grey_block_1)) (on grey_block_2 black_block_1)) (sometime (on brown_block_2 purple_block_2)) (sometime (not (clear brown_block_2))) (sometime-after (not (clear brown_block_2)) (ontable grey_block_2)) (sometime (holding purple_block_2)) (sometime-before (holding purple_block_2) (holding brown_block_1)) (sometime (not (clear purple_block_2))) (sometime-before (not (clear purple_block_2)) (on brown_block_1 brown_block_2)))
 (:metric minimize (total-cost))
)
