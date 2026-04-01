(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 brown_block_1 blue_block_1 orange_block_1 blue_block_2 - block
 )
 (:init (ontable green_block_1) (on brown_block_1 green_block_1) (on blue_block_1 brown_block_1) (on orange_block_1 blue_block_1) (ontable blue_block_2) (clear orange_block_1) (clear blue_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding blue_block_2)))
 (:constraints (sometime (or (holding orange_block_1) (holding brown_block_1))))
 (:metric minimize (total-cost))
)
