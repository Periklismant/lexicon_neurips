(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 purple_block_1 black_block_1 orange_block_1 yellow_block_2 white_block_1 orange_block_2 - block
 )
 (:init (ontable yellow_block_1) (ontable purple_block_1) (ontable black_block_1) (on orange_block_1 black_block_1) (on yellow_block_2 yellow_block_1) (on white_block_1 orange_block_1) (on orange_block_2 purple_block_1) (clear yellow_block_2) (clear white_block_1) (clear orange_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding orange_block_2)))
 (:constraints (sometime (and (not (clear yellow_block_2)) (holding black_block_1))) (sometime (holding orange_block_1)) (sometime (clear purple_block_1)) (sometime-before (clear purple_block_1) (or (clear black_block_1) (not (ontable black_block_1)))) (sometime (holding purple_block_1)) (sometime (or (ontable orange_block_1) (on yellow_block_2 orange_block_1))) (sometime (on orange_block_2 black_block_1)) (sometime (on purple_block_1 yellow_block_1)) (sometime (not (clear orange_block_2))) (sometime-before (not (clear orange_block_2)) (or (ontable yellow_block_2) (on purple_block_1 orange_block_2))) (sometime (clear black_block_1)) (sometime (or (on purple_block_1 orange_block_2) (clear yellow_block_1))))
 (:metric minimize (total-cost))
)
