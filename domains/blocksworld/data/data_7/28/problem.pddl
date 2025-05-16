(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   orange_block_1 black_block_1 white_block_1 purple_block_1 white_block_2 grey_block_1 yellow_block_1 - block
 )
 (:init (ontable orange_block_1) (ontable black_block_1) (ontable white_block_1) (ontable purple_block_1) (on white_block_2 orange_block_1) (ontable grey_block_1) (on yellow_block_1 grey_block_1) (clear black_block_1) (clear white_block_1) (clear purple_block_1) (clear white_block_2) (clear yellow_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1)))
 (:constraints (sometime (ontable white_block_2)) (sometime (holding yellow_block_1)) (sometime-before (holding yellow_block_1) (holding black_block_1)) (sometime (or (clear orange_block_1) (not (ontable grey_block_1)))) (sometime (not (on orange_block_1 yellow_block_1))) (sometime-after (not (on orange_block_1 yellow_block_1)) (or (on grey_block_1 white_block_1) (not (clear white_block_1)))) (sometime (clear orange_block_1)) (sometime (clear grey_block_1)) (sometime-before (clear grey_block_1) (or (on black_block_1 orange_block_1) (not (clear purple_block_1)))) (sometime (not (on black_block_1 purple_block_1))) (sometime-after (not (on black_block_1 purple_block_1)) (or (ontable white_block_2) (holding yellow_block_1))))
 (:metric minimize (total-cost))
)
