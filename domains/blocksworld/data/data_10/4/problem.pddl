(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   purple_block_1 brown_block_1 yellow_block_1 purple_block_2 black_block_1 orange_block_1 white_block_1 - block
 )
 (:init (ontable purple_block_1) (on brown_block_1 purple_block_1) (on yellow_block_1 brown_block_1) (ontable purple_block_2) (ontable black_block_1) (ontable orange_block_1) (on white_block_1 yellow_block_1) (clear purple_block_2) (clear black_block_1) (clear orange_block_1) (clear white_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding orange_block_1)))
 (:constraints (sometime (not (ontable orange_block_1))) (sometime-before (not (ontable orange_block_1)) (or (on yellow_block_1 white_block_1) (not (ontable black_block_1)))) (sometime (or (on purple_block_1 black_block_1) (on yellow_block_1 purple_block_2))) (sometime (not (clear orange_block_1))) (sometime-before (not (clear orange_block_1)) (and (on purple_block_2 black_block_1) (ontable brown_block_1))) (sometime (holding purple_block_1)) (sometime (not (clear purple_block_2))) (sometime (not (clear purple_block_1))) (sometime-after (not (clear purple_block_1)) (clear orange_block_1)) (sometime (holding purple_block_2)) (sometime (not (ontable black_block_1))) (sometime (or (holding black_block_1) (holding white_block_1))) (sometime (not (ontable white_block_1))) (sometime-after (not (ontable white_block_1)) (on orange_block_1 yellow_block_1)))
 (:metric minimize (total-cost))
)
