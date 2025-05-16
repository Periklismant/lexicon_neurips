(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   yellow_block_1 purple_block_1 black_block_1 orange_block_1 yellow_block_2 white_block_1 orange_block_2 - block
 )
 (:init (ontable yellow_block_1) (ontable purple_block_1) (ontable black_block_1) (on orange_block_1 black_block_1) (on yellow_block_2 yellow_block_1) (on white_block_1 orange_block_1) (on orange_block_2 purple_block_1) (clear yellow_block_2) (clear white_block_1) (clear orange_block_2) (handempty) (= (total-cost) 0))
 (:goal (and (holding orange_block_2)))
 (:metric minimize (total-cost))
)
