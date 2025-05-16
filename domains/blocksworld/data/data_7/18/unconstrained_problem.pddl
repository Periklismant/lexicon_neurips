(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   orange_block_1 green_block_1 blue_block_1 red_block_1 black_block_1 orange_block_2 brown_block_1 - block
 )
 (:init (ontable orange_block_1) (on green_block_1 orange_block_1) (ontable blue_block_1) (on red_block_1 blue_block_1) (ontable black_block_1) (on orange_block_2 red_block_1) (on brown_block_1 orange_block_2) (clear green_block_1) (clear black_block_1) (clear brown_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:metric minimize (total-cost))
)
