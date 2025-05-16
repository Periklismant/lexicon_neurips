(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   green_block_1 grey_block_1 grey_block_2 orange_block_1 black_block_1 black_block_2 brown_block_1 - block
 )
 (:init (ontable green_block_1) (ontable grey_block_1) (on grey_block_2 green_block_1) (on orange_block_1 grey_block_1) (on black_block_1 grey_block_2) (ontable black_block_2) (on brown_block_1 orange_block_1) (clear black_block_1) (clear black_block_2) (clear brown_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:metric minimize (total-cost))
)
