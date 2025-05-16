(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 orange_block_1 blue_block_1 grey_block_1 orange_block_2 red_block_1 orange_block_3 - block
 )
 (:init (ontable green_block_1) (ontable orange_block_1) (on blue_block_1 orange_block_1) (on grey_block_1 green_block_1) (on orange_block_2 grey_block_1) (on red_block_1 orange_block_2) (on orange_block_3 blue_block_1) (clear red_block_1) (clear orange_block_3) (handempty) (= (total-cost) 0))
 (:goal (and (on orange_block_3 orange_block_2)))
 (:metric minimize (total-cost))
)
