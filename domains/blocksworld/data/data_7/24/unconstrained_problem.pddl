(define (problem blocksworld-problem)
 (:domain blocksworld-domain)
 (:objects
   grey_block_1 brown_block_1 yellow_block_1 white_block_1 green_block_1 orange_block_1 blue_block_1 - block
 )
 (:init (ontable grey_block_1) (ontable brown_block_1) (on yellow_block_1 brown_block_1) (on white_block_1 yellow_block_1) (ontable green_block_1) (on orange_block_1 grey_block_1) (on blue_block_1 orange_block_1) (clear white_block_1) (clear green_block_1) (clear blue_block_1) (handempty) (= (total-cost) 0))
 (:goal (and (holding green_block_1)))
 (:metric minimize (total-cost))
)
