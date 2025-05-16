(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   orange_block_1 black_block_1 white_block_1 purple_block_1 white_block_2 grey_block_1 yellow_block_1 - block
 )
 (:init (ontable orange_block_1) (ontable black_block_1) (ontable white_block_1) (ontable purple_block_1) (on white_block_2 orange_block_1) (ontable grey_block_1) (on yellow_block_1 grey_block_1) (clear black_block_1) (clear white_block_1) (clear purple_block_1) (clear white_block_2) (clear yellow_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (ontable yellow_block_1)))
 (:metric minimize (total-cost))
)
