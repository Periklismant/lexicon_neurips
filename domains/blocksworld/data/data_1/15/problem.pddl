(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   blue_block_1 white_block_1 yellow_block_1 orange_block_1 orange_block_2 purple_block_1 blue_block_2 - block
 )
 (:init (ontable blue_block_1) (on white_block_1 blue_block_1) (on yellow_block_1 white_block_1) (ontable orange_block_1) (on orange_block_2 yellow_block_1) (on purple_block_1 orange_block_1) (on blue_block_2 purple_block_1) (clear orange_block_2) (clear blue_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (ontable orange_block_2)))
 (:constraints (sometime (and (not (clear blue_block_2)) (ontable yellow_block_1))))
 (:metric minimize (total-cost))
)
