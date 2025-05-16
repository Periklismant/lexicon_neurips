(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 brown_block_1 brown_block_2 purple_block_1 black_block_1 orange_block_1 green_block_1 - block
 )
 (:init (ontable yellow_block_1) (ontable brown_block_1) (on brown_block_2 yellow_block_1) (on purple_block_1 brown_block_1) (on black_block_1 purple_block_1) (ontable orange_block_1) (on green_block_1 black_block_1) (clear brown_block_2) (clear orange_block_1) (clear green_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (on brown_block_1 orange_block_1)))
 (:constraints (sometime (and (holding brown_block_2) (on orange_block_1 brown_block_1))))
 (:metric minimize (total-cost))
)
